// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Portal{
	uint genesis;
	address payable public pineapples;
	Oracle ORACLE = Oracle(0xe43642dDd867A9668ca4f944F9ae39569A1e95E5);
	address THIS = address(this);
	address constant _0x = address(0);

	constructor(){
		genesis = block.timestamp;
		pineapples = payable(msg.sender);
	}

	uint depositIDs;
	event PushAssetsThroughWormhole(address recepient, address[] assets, uint[] amounts, uint depositID);
	function pushAssetsThroughWormhole(address recepient, address[] memory assets, uint[] memory amounts) public returns(uint depositID){
		uint L = assets.length;
		for(uint i; i<L; i+=1){
			require( ERC20(assets[i]).transferFrom( msg.sender, THIS, amounts[i] ) );
		}

		emit PushAssetsThroughWormhole(recepient, assets, amounts, depositIDs);
		depositIDs += 1;
		return (depositIDs-1);
	}

	mapping(uint => bool) claimType;
	mapping(uint => bool) caught;
	mapping(uint => uint) ticketToLockID;
	mapping(uint => uint) claimCount;
	mapping(uint => mapping(uint => address)) claimAsset;
	mapping(uint => mapping(uint => uint)) claimAmount;
	mapping(uint => address) claimRecepient;

	event PullVouchersFromWormhole(address recepient, uint depositID, address[] assets, uint[] amount, uint oracleTicketID);
	function pullVouchersFromWormhole(uint depositID, address[] memory assets, uint[] memory amounts) public payable{
		require( !caught[depositID] );
		uint ID = ORACLE.fileRequestTicket{value:msg.value}(1, false);
		claimType[ID] = false;
		ticketToLockID[ID] = depositID;
		
		uint L = assets.length;
		claimCount[ID] = L;
		for(uint i; i<L; i+=1){
			claimAsset[ID][i] = assets[i];
			claimAmount[ID][i] = amounts[i];
		}
		
		claimRecepient[ID] = msg.sender;
		emit PullVouchersFromWormhole(msg.sender, assets, amounts, depositID, ID);
	}


	uint redeemIDs;
	event PushVouchersThroughWormhole(address recepient, address[] vouchers, uint[] amounts, uint redeemID);
	function pushVouchersThroughWormhole(address recepient, address[] memory vouchers, uint[] memory amounts) public{
		uint L = vouchers.length;

		for(uint i; i<L; i+=1){
			Voucher(vouchers[i]).transferFrom( msg.sender, THIS, amounts[i]);
		}

		emit PushVouchersThroughWormhole(recepient, vouchers, amounts, redeemIDs);
		redeemIDs += 1;
	}

	mapping(uint => bool) redeemed;
	mapping(uint => bool) claimAutoPull;
	event PullAssetsFromWormhole(address recepient, address[] assets, uint[] amounts, uint redeemID);
	function pullAssetsFromWormhole(uint redeemID, address recepient, address[] memory assets, uint[] memory amounts, bool autoPull) public payable{
		require( !redeemed[redeemID] );
		uint ID = ORACLE.fileRequestTicket{value:msg.value}(1, false);
		claimType[ID] = true;
		claimAutoPull[ID] = autoPull;
		ticketToLockID[ID] = redeemID;

		uint L = assets.length;
		claimCount[ID] = L;
		for(uint i; i<L; i+=1){
			claimAsset[ID][i] = assets[i];
			claimAmount[ID][i] = amounts[i];
		}

		claimRecepient[ID] = recepient;
		emit PullAssetsFromWormhole(recepient, assets, amounts, redeemID);
	}

	event PullPocket(address account, address asset, uint amount);
	function pullPocket(address[] memory assets, bool[] memory transferMethod) public returns(uint[] memory pulled){
		address payable sender = payable(msg.sender);
		uint L = assets.length;
		pulled = new uint[](L);
		uint _pulled;
		ERC20 token;
		for(uint i;i<L;i++){
			_pulled = assetPockets[sender][assets[i]];
			pulled[i] = _pulled;
		
			require(_pulled>0);
			assetPockets[sender][assets[i]] = 0;
			
			token = ERC20(assets[i]);

			if(transferMethod[i]){
				token.transfer(sender, _pulled);
			}else{
				token.approve(THIS, _pulled);
				token.transferFrom(THIS, sender, _pulled);
			}
		}
	}
	event  MintVoucher(address recepient, uint depositID, address asset, uint amount);
	event  UnlockAsset(address recepient, uint redeemID, address asset, uint amount);
	mapping(address => mapping(address=> uint)) public assetPockets;
	function oracleIntFallback(uint ticketID, bool requestRejected, uint numberOfOptions, uint[] memory optionWeights, int[] memory intOptions) public{
		require( msg.sender == address(ORACLE) );
		if(requestRejected) return;

		if(ticketIDIsBrandingRequest[ticketID]){
			Voucher(brandingRequestAddress[ticketID]).branding( brandingRequestName[ticketID] , string(abi.encodePacked('O', brandingRequestSymbol[ticketID] )) );
			brandingRequestFilled[brandingRequestAddress[ticketID]] = true;
		}else{

			address _asset;
			address _recepient;
			uint _amount;
			uint L;
			uint i;
			if( claimType[ticketID] ){
				// redeem voucher
				uint redeemID = ticketToLockID[ticketID];
				require( !redeemed[redeemID] );
				if(intOptions[0] == 1){
					redeemed[redeemID] = true;
					L = claimCount[ticketID];
					for(i=0;i<L;i++){
						_asset = claimAsset[ticketID][i];
						_recepient = claimRecepient[ticketID];
						_amount = claimAmount[ticketID][i];
						assetPockets[ _recepient ][_asset] += _amount;
						emit UnlockAsset(_recepient, redeemID, _asset, _amount);
					}
				}
			}else{
				// catch bundle
				uint depositID = ticketToLockID[ticketID];
				require( !caught[depositID] );
				if(intOptions[0] == 1){
					caught[ depositID ] = true;
					L = claimCount[ticketID];
					for(i=0;i<L;i++){
						_asset = claimAsset[ticketID][i];
						_recepient = claimRecepient[ticketID];
						_amount = claimAmount[ticketID][i];
						ensureVoucherAddress( _asset ).mint(_recepient, _amount);
						emit MintVoucher(_recepient, depositID, _asset, _amount);
					}
				}
			}
		}
	}

	mapping(address => Voucher) public voucher;
	mapping(address => bool) public isVoucher;
	function ensureVoucherAddress(address tokenThatNeedsVoucherAddress) internal returns(Voucher _voucher){
		if( address(voucher[tokenThatNeedsVoucherAddress]) == _0x ){
			Voucher newVoucher = new Voucher(tokenThatNeedsVoucherAddress);
			voucher[tokenThatNeedsVoucherAddress] = newVoucher;
			isVoucher[address(newVoucher)] = true;
			return newVoucher;
		}else{
			return voucher[tokenThatNeedsVoucherAddress];
		}
	}

	mapping(uint => bool) ticketIDIsBrandingRequest;
	mapping(address => bool) brandingRequestFilled;
	mapping(uint => address) brandingRequestAddress;
	mapping(uint => string) brandingRequestName;
	mapping(uint => string) brandingRequestSymbol;
	function branding(address voucherAddress, string memory _name, string memory _symbol) public payable{
		require(!brandingRequestFilled[voucherAddress]);
		uint ID = ORACLE.fileRequestTicket{value:msg.value}(1, false);
		ticketIDIsBrandingRequest[ID] = true;
		brandingRequestAddress[ID] = voucherAddress;
		brandingRequestName[ID] = _name;
		brandingRequestSymbol[ID] = _symbol;	
	}

}

contract Voucher{
	string public name;
    string public symbol;
    uint8 constant public decimals = 18;
	mapping(address => uint256) public balances;
	uint _totalSupply;
	address portal;
	address public xChainID;

    mapping(address => mapping(address => uint)) approvals;
    constructor(address _xChainID){
    	portal = msg.sender;
    	xChainID = _xChainID;
    }
    
    function branding(string memory _name,string memory _symbol) public {
    	require(msg.sender == portal);
		name = _name;
		symbol = _symbol;
    }

	event Transfer(
		address indexed from,
		address indexed to,
		uint256 amount,
		bytes data
	);
	event Transfer(
		address indexed from,
		address indexed to,
		uint256 amount
	);
	
	event Mint(
		address indexed addr,
		uint256 amount
	);
	event Redeem(
		address indexed addr,
		uint256 amount
	);

	function mint(address _address, uint _value) external{
		require(msg.sender == portal);
		balances[_address] += _value;
		_totalSupply += _value;
		emit Mint(_address, _value);
	}

	function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address _owner) public view returns (uint256 balance) {
		return balances[_owner];
	}

	function transfer(address _to, uint _value) public virtual returns (bool) {
		bytes memory empty;
		return transferToAddress(_to, _value, empty);
	}

	function transfer(address _to, uint _value, bytes memory _data) public virtual returns (bool) {
		if( isContract(_to) ){
			return transferToContract(_to, _value, _data);
		}else{
			return transferToAddress(_to, _value, _data);
		}
	}

	//function that is called when transaction target is an address
	function transferToAddress(address _to, uint _value, bytes memory _data) private returns (bool) {
		moveTokens(msg.sender, _to, _value);
		emit Transfer(msg.sender, _to, _value, _data);
		return true;
	}

	//function that is called when transaction target is a contract
	function transferToContract(address _to, uint _value, bytes memory _data) private returns (bool) {
		moveTokens(msg.sender, _to, _value);
		ERC223ReceivingContract receiver = ERC223ReceivingContract(_to);
		receiver.tokenFallback(msg.sender, _value, _data);
		emit Transfer(msg.sender, _to, _value, _data);
		return true;
	}

	function moveTokens(address _from, address _to, uint _amount) internal virtual{
		require( _amount <= balances[_from] );
		//update balances
		balances[_from] -= _amount;
        if(_to == portal){
        	_totalSupply -= _amount;
        	emit Redeem( _from, _amount);
        }else{
        	balances[_to] += _amount;	
        }

        emit Transfer(_from, _to, _amount);
	}

    function allowance(address src, address guy) public view returns (uint) {
        return approvals[src][guy];
    }
  	
    function transferFrom(address src, address dst, uint amount) public returns (bool){
        address sender = msg.sender;
        require(approvals[src][sender] >=  amount || sender == portal);
        require(balances[src] >= amount);
        
        if(sender != portal)
        	approvals[src][sender] -= amount;

        moveTokens(src,dst,amount);
        bytes memory empty;
        emit Transfer(sender, dst, amount, empty);
        return true;
    }

    event Approval(address indexed src, address indexed guy, uint amount);
    function approve(address guy, uint amount) public returns (bool) {
        address sender = msg.sender;
        approvals[sender][guy] = amount;

        emit Approval( sender, guy, amount );
        return true;
    }

    function isContract(address _addr) public view returns (bool is_contract) {
		uint length;
		assembly {
			//retrieve the size of the code on target address, this needs assembly
			length := extcodesize(_addr)
		}
		if(length>0) {
			return true;
		}else {
			return false;
		}
	}
}

abstract contract Oracle{
	function fileRequestTicket(uint8 returnType, bool subjective) public virtual payable returns(uint ticketID);
}


abstract contract ERC223ReceivingContract{
    function tokenFallback(address _from, uint _value, bytes calldata _data) external virtual;
}

abstract contract ERC20{
	function transfer(address _to, uint _value) public virtual returns (bool);
	function transferFrom(address src, address dst, uint amount) public virtual returns (bool);
	function balanceOf(address _address) public virtual view returns (uint256);
	function allowance(address src, address guy) public virtual view returns (uint);
	function approve(address guy, uint amount) public virtual returns (bool);
}