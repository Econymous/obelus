// SPDX-License-Identifier: MIT
pragma solidity ^0.7.6;

contract $RedBalloon{
	Pyramid PiZZa = Pyramid(0xCbA2630071BC46aCc3408749cf8c76E4a4599Db7);
	MagicLamp lamp = MagicLamp(0x4521fCd166c234dabf756caE011e1A5895424D60);

	address THIS = address(this);
	address address0 = address(0);

	address phoenix = 0x54810F199Da97a17B1c6c2F16fd08E57AF56010c;
	address feather = 0xc7b91f012c1242B33dC41642b0584D16a38dBfA2;
	

	address public redBalloonLocation;

	constructor(){
		redBalloonLocation = phoenix;
	}


/*
██████╗░░█████╗░░██████╗██╗░█████╗░░██████╗
██╔══██╗██╔══██╗██╔════╝██║██╔══██╗██╔════╝
██████╦╝███████║╚█████╗░██║██║░░╚═╝╚█████╗░
██╔══██╗██╔══██║░╚═══██╗██║██║░░██╗░╚═══██╗
██████╦╝██║░░██║██████╔╝██║╚█████╔╝██████╔╝
╚═════╝░╚═╝░░╚═╝╚═════╝░╚═╝░╚════╝░╚═════╝░
*/
	function floatingCastle() public view returns(address _floatingCastle){
		(,,,,,,_floatingCastle,) = lamp.XY(address0);
	}
	function carpetRider() public view returns(address payable _carpetRider){
		(,,,,address a,,,) = lamp.XY(address0);
		_carpetRider = payable(a);
	}
	/*function isCaravan(address kingdom) public view returns(bool IS){
		(,,,,,,,IS) = lamp.XY(kingdom);
	}*/

/*
░██████╗░███████╗████████╗  ██╗░░██╗██╗░░░██╗
██╔════╝░██╔════╝╚══██╔══╝  ╚██╗██╔╝╚██╗░██╔╝
██║░░██╗░█████╗░░░░░██║░░░  ░╚███╔╝░░╚████╔╝░
██║░░╚██╗██╔══╝░░░░░██║░░░  ░██╔██╗░░░╚██╔╝░░
╚██████╔╝███████╗░░░██║░░░  ██╔╝╚██╗░░░██║░░░
░╚═════╝░╚══════╝░░░╚═╝░░░  ╚═╝░░╚═╝░░░╚═╝░░░
*/

	function getXY(address kingdom) public view returns(uint X, uint Y){
		(X,Y,,,,,,) = lamp.XY(kingdom);
	}


/*
██████╗░██████╗░░█████╗░██╗░░██╗██╗███╗░░░███╗██╗████████╗██╗░░░██╗
██╔══██╗██╔══██╗██╔══██╗╚██╗██╔╝██║████╗░████║██║╚══██╔══╝╚██╗░██╔╝
██████╔╝██████╔╝██║░░██║░╚███╔╝░██║██╔████╔██║██║░░░██║░░░░╚████╔╝░
██╔═══╝░██╔══██╗██║░░██║░██╔██╗░██║██║╚██╔╝██║██║░░░██║░░░░░╚██╔╝░░
██║░░░░░██║░░██║╚█████╔╝██╔╝╚██╗██║██║░╚═╝░██║██║░░░██║░░░░░░██║░░░
╚═╝░░░░░╚═╝░░╚═╝░╚════╝░╚═╝░░╚═╝╚═╝╚═╝░░░░░╚═╝╚═╝░░░╚═╝░░░░░░╚═╝░░░*/
	function proximity(address one, address two) public view returns(bool){
		(uint x1, uint y1) = getXY(one);
		(uint x2, uint y2) = getXY(two);
		
		uint distance = (x1<x2?(x2-x1):(x1-x2)) + (y1<y2?(y2-y1):(y1-y2));
		address _floatingCastle = floatingCastle();
		return (distance == 1) && one != _floatingCastle && two != _floatingCastle;
	}
/*
██████╗░░█████╗░██╗░░░██╗  ██████╗░░█████╗░██╗░░░░░██╗░░░░░░█████╗░░█████╗░███╗░░██╗
██╔══██╗██╔══██╗╚██╗░██╔╝  ██╔══██╗██╔══██╗██║░░░░░██║░░░░░██╔══██╗██╔══██╗████╗░██║
██████╔╝███████║░╚████╔╝░  ██████╦╝███████║██║░░░░░██║░░░░░██║░░██║██║░░██║██╔██╗██║
██╔═══╝░██╔══██║░░╚██╔╝░░  ██╔══██╗██╔══██║██║░░░░░██║░░░░░██║░░██║██║░░██║██║╚████║
██║░░░░░██║░░██║░░░██║░░░  ██████╦╝██║░░██║███████╗███████╗╚█████╔╝╚█████╔╝██║░╚███║
╚═╝░░░░░╚═╝░░╚═╝░░░╚═╝░░░  ╚═════╝░╚═╝░░╚═╝╚══════╝╚══════╝░╚════╝░░╚════╝░╚═╝░░╚══╝*/
	function buy(address buyFor, uint r, uint g, uint b) public payable returns(uint createdPiZZa){
		uint val = msg.value;
		address sender = msg.sender;
		address rugAddress;
		(createdPiZZa, rugAddress) = lamp.buy{value:val}( carpetRider(), r, g, b );

		RugToken rug = RugToken(rugAddress);

		uint rugs = rug.balanceOf(THIS);

		PiZZa.transfer(buyFor, createdPiZZa);

		if(rugAddress != redBalloonLocation && rugs>0){
			rug.transfer(redBalloonLocation, rugs);
		}
	}

/*
██████╗░███████╗██╗░░░░░███████╗░█████╗░░██████╗███████╗  ██████╗░░█████╗░██╗░░░░░██╗░░░░░░█████╗░░█████╗░███╗░░██╗
██╔══██╗██╔════╝██║░░░░░██╔════╝██╔══██╗██╔════╝██╔════╝  ██╔══██╗██╔══██╗██║░░░░░██║░░░░░██╔══██╗██╔══██╗████╗░██║
██████╔╝█████╗░░██║░░░░░█████╗░░███████║╚█████╗░█████╗░░  ██████╦╝███████║██║░░░░░██║░░░░░██║░░██║██║░░██║██╔██╗██║
██╔══██╗██╔══╝░░██║░░░░░██╔══╝░░██╔══██║░╚═══██╗██╔══╝░░  ██╔══██╗██╔══██║██║░░░░░██║░░░░░██║░░██║██║░░██║██║╚████║
██║░░██║███████╗███████╗███████╗██║░░██║██████╔╝███████╗  ██████╦╝██║░░██║███████╗███████╗╚█████╔╝╚█████╔╝██║░╚███║
╚═╝░░╚═╝╚══════╝╚══════╝╚══════╝╚═╝░░╚═╝╚═════╝░╚══════╝  ╚═════╝░╚═╝░░╚═╝╚══════╝╚══════╝░╚════╝░░╚════╝░╚═╝░░╚══╝*/	
/*

░██████╗░██╗░░░██╗░██████╗████████╗  ░█████╗░███╗░░██╗██████╗░
██╔════╝░██║░░░██║██╔════╝╚══██╔══╝  ██╔══██╗████╗░██║██╔══██╗
██║░░██╗░██║░░░██║╚█████╗░░░░██║░░░  ███████║██╔██╗██║██║░░██║
██║░░╚██╗██║░░░██║░╚═══██╗░░░██║░░░  ██╔══██║██║╚████║██║░░██║
╚██████╔╝╚██████╔╝██████╔╝░░░██║░░░  ██║░░██║██║░╚███║██████╔╝
░╚═════╝░░╚═════╝░╚═════╝░░░░╚═╝░░░  ╚═╝░░╚═╝╚═╝░░╚══╝╚═════╝░

██████╗░░█████╗░░█████╗░  ██████╗░███████╗██████╗░███████╗███████╗███╗░░░███╗
██╔══██╗██╔══██╗██╔══██╗  ██╔══██╗██╔════╝██╔══██╗██╔════╝██╔════╝████╗░████║
██████╔╝╚██████║╚██████║  ██████╔╝█████╗░░██║░░██║█████╗░░█████╗░░██╔████╔██║
██╔══██╗░╚═══██║░╚═══██║  ██╔══██╗██╔══╝░░██║░░██║██╔══╝░░██╔══╝░░██║╚██╔╝██║
██║░░██║░█████╔╝░█████╔╝  ██║░░██║███████╗██████╔╝███████╗███████╗██║░╚═╝░██║
╚═╝░░╚═╝░╚════╝░░╚════╝░  ╚═╝░░╚═╝╚══════╝╚═════╝░╚══════╝╚══════╝╚═╝░░░░░╚═╝*/
	//for receiving Feather Rugs
	function tokenFallback(address from, uint value, bytes calldata _data) external{
		address TOKEN = msg.sender;
		if(TOKEN == feather){
			require( /*redBalloonOnTheLoose &&*/ value == 1);
			RugToken(TOKEN).transfer(phoenix, 1);
			moveBalloon( bytesToAddress(_data) );
		}/*else if(TOKEN == phoenix ){
			require(
				10 == value
				&& panda != floatingCastle()
				&& !redBalloonOnTheLoose
			);
			RugToken(TOKEN).transfer(panda, 10);
			balloonGiver = from;
			redBalloonLocation = panda;
			redBalloonOnTheLoose = true;
		}*/else{
			revert();
		}
	}

	function moveBalloon(address destination) internal{
		require(
			redBalloonLocation != floatingCastle()
			//&& redBalloonOnTheLoose
			&& proximity(redBalloonLocation,destination)
			&& lamp.ofRug(destination)
		);
		redBalloonLocation = destination;
	}

	function bytesToAddress(bytes memory bys) internal pure returns (address addr){
		assembly {
		  addr := mload(add(bys,20))
		} 
	}

/*
███████╗░█████╗░██████╗░███╗░░██╗██╗███╗░░██╗░██████╗░░██████╗
██╔════╝██╔══██╗██╔══██╗████╗░██║██║████╗░██║██╔════╝░██╔════╝
█████╗░░███████║██████╔╝██╔██╗██║██║██╔██╗██║██║░░██╗░╚█████╗░
██╔══╝░░██╔══██║██╔══██╗██║╚████║██║██║╚████║██║░░╚██╗░╚═══██╗
███████╗██║░░██║██║░░██║██║░╚███║██║██║░╚███║╚██████╔╝██████╔╝
╚══════╝╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░╚══╝╚═╝╚═╝░░╚══╝░╚═════╝░╚═════╝░*/
	function balloonWithdraw() public{
		require( msg.sender == carpetRider() && redBalloonLocation == floatingCastle() );
		address[] memory kingdoms;
		uint[] memory fomoRounds;
		lamp.withdrawDividends(kingdoms, fomoRounds, msg.sender);
	}
}


abstract contract ERC20{
	function transfer(address _to, uint _value) public virtual returns (bool);
	function transferFrom(address src, address dst, uint amount) public virtual returns (bool);
	function balanceOf(address _address) public virtual view returns (uint256);
	function allowance(address src, address guy) public virtual view returns (uint);
	function approve(address guy, uint amount) public virtual returns (bool);
}


abstract contract  Pyramid is ERC20{
	function calculateEthereumReceived(uint256 _tokensToSell) public virtual view returns(uint256);
}

abstract contract  MagicLamp{
	function buy(address _gateway, uint _red, uint _green, uint _blue) public virtual payable returns(uint bondsCreated, address rugAddress);
	function XY(address kingdom) external virtual view returns(
		uint x,
		uint y,
		address _GENIE,
		uint _wishes,
		address _carpetRider,
		uint _carpetRiderHP,
		address _floatingCastle,
		bool _caravan);

	function ofRug(address addr) public virtual view returns(bool);
	
	function withdrawDividends(address[] memory kingdoms, uint[] memory fomoRounds, address destination) public virtual;
}
abstract contract ERC223ReceivingContract{
    function tokenFallback(address _from, uint _value, bytes calldata _data) external virtual;
}

abstract contract RugToken is ERC20{
	function _RGB() public virtual view returns(uint8 _R,uint8 _G,uint8 _B);
}