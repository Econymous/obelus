// SPDX-License-Identifier: MIT
pragma solidity ^0.7.6;

contract RedBalloons{
	uint constant $ = 1e4;
	uint constant $$ = 1e18;
	Pyramid PiZZa = Pyramid(0xCbA2630071BC46aCc3408749cf8c76E4a4599Db7);
	MagicLamp lamp = MagicLamp(0x4521fCd166c234dabf756caE011e1A5895424D60);
	
	//priorities
	ERC20 balloonToken = ERC20(0xAC55641Cbb734bdf6510d1bBd62E240c2409040f);//
	ERC20 spamToken = ERC20(0xAC55641Cbb734bdf6510d1bBd62E240c2409040f);//
	ERC20 MVT = ERC20(0xAC55641Cbb734bdf6510d1bBd62E240c2409040f);//
	ERC20 MDT = ERC20(0xAC55641Cbb734bdf6510d1bBd62E240c2409040f);//
	ERC20 XYO = ERC20(0xAC55641Cbb734bdf6510d1bBd62E240c2409040f);//
	ERC20 SENT = ERC20(0xAC55641Cbb734bdf6510d1bBd62E240c2409040f);//

	//other
	ERC20 x_moonday = ERC20(0xAC55641Cbb734bdf6510d1bBd62E240c2409040f);//
	ERC20 x_drc = ERC20(0xAC55641Cbb734bdf6510d1bBd62E240c2409040f);//
	ERC20 x_barnbond = ERC20(0xAC55641Cbb734bdf6510d1bBd62E240c2409040f);//
	ERC20 x_wetstuff = ERC20(0xAC55641Cbb734bdf6510d1bBd62E240c2409040f);//
	ERC20 x_BCO = ERC20(0xAC55641Cbb734bdf6510d1bBd62E240c2409040f);//
	ERC20 x_CID = ERC20(0xAC55641Cbb734bdf6510d1bBd62E240c2409040f);//
	ERC20 x_RFOX = ERC20(0xAC55641Cbb734bdf6510d1bBd62E240c2409040f);//
	ERC20 x_GLM = ERC20(0xAC55641Cbb734bdf6510d1bBd62E240c2409040f);//
	ERC20 x_BRD = ERC20(0xAC55641Cbb734bdf6510d1bBd62E240c2409040f);//
	ERC20 x_OCTO = ERC20(0xAC55641Cbb734bdf6510d1bBd62E240c2409040f);//
	ERC20 x_UNI = ERC20(0xAC55641Cbb734bdf6510d1bBd62E240c2409040f);//
	ERC20 x_PEPE = ERC20(0xAC55641Cbb734bdf6510d1bBd62E240c2409040f);//
	ERC20 x_BZZZZ = ERC20(0xAC55641Cbb734bdf6510d1bBd62E240c2409040f);//


	address THIS = address(this);
	address address0 = address(0);
	address payable Haley;

	uint genesis;
	uint timeLastBalloonPopped;

	address feather;
	address cattle;
	address panda;
	address penguin;
	address gold;
	address water;
	address fox;
	address bat;
	address wheat;
	address skull;
	address shootingStar;
	address deer;
	address crane;
	address wolf;
	address moon;
	address bee;
	address monkey;
	address eye;
	address golem;
	address pawPrints;
	address goat;
	address lion;
	address unicorn;
	address octopus;
	address frog;
	address forest;
	address snake;
	address spider;
	address rose;
	address sunflower;
	address palmTree;
	address dragonFly;
	address shroom;

	uint redBalloonsLeftOnTheWall = 99;
	bool redBalloonOnTheLoose;
	address redBalloonLocation;

	mapping(address => uint8) token_R;
	mapping(address => uint8) token_G;
	mapping(address => uint8) token_B;
	mapping(address => uint) token_Color;
	
	address balloonGiver;
	uint rationCost = 0.0002 ether;
	
	Token spamJerky;
	Token R99;

	mapping( address => bool) ofBalloons;


	function ofBalloon(address addr) internal view returns(bool){
		return ofBalloons[addr];
	}

	function ofRug(address addr) public view returns(bool){
		return ofBalloon(addr) || lamp.ofRug(addr);
	}

	function tokenRGB(address token) public view returns(uint R,uint G,uint B, uint C){
		if( ofBalloon(token) || token == address(spamJerky) )
			return (token_R[token], token_G[token], token_B[token], token_Color[token]);
		else if( lamp.ofRug(token) ){
			( R, G, B ) = RugToken(token)._RGB();
			return ( R,G,B , 1 );
		}
		revert();
	}

	constructor(){
		//literally a test to prove this latest modification works
		spamJerky = newCard("Spam Jerky", "SpJ", 2, 1, 1, 5);
		R99 = newCard("Red Balloon", "R99", 3, 0, 0, 99);// this should be pretty fucking high forever

		skull= 0x9b29285e56011cbA4F6b16bA7BcC5e79308fC812;
		feather= 0xc7b91f012c1242B33dC41642b0584D16a38dBfA2;
		cattle= 0x8E83e75288C4Be44FDC686C4555B34620f0b78B0;
		panda= 0x69c236470b50225158ccB90D8D6508Da6c5E3DBC;
		penguin= 0x0A236dD68FC543b9E89Ef740b63c662e6aB462F2;
		gold= 0xb1010be7DD4450f2923f929655DBb7404d7F4b5C;
		water= 0xCf4FD6A7B0Cb93650C43b7f0e963F0D6aDb11ED6;
		fox= 0x37D032956DaE4aaE99E3Af4330309579C4b973E7;
		bat= 0x5c198079Ce7dca3A9c3806EABA16028388904EC9;
		wheat= 0x6E99Eec11512d7f8f8e8D2817eDF1FE4Fdf70226;
		shootingStar= 0x7c58213E9262831cd500Df50662d1A8D4E64F832;
		deer= 0x2F1aA1352a7E874795a5D904174bc54521C1e34b;
		crane= 0xF18bb5a42E13417E692aB0D18b25870c33de43CE;
		wolf= 0x4B676021d18fb976b13b32bd5019078f0F6Cea9F;
		moon= 0x227414223537A471F0893ee06FEF6ab5e71eadB7;
		bee= 0xdf2Bd675519740f240A626B6Fc389aC25f325a10;
		monkey= 0x0F84cE848474fEA34a17Cc7a84a9D79C172F981d;
		eye= 0x371f15Dd56B96Aa07a50e334bFaA958a7756A816;
		golem= 0x095deF21da3ae492783C1f511E22ae0bE3623527;
		pawPrints= 0xf82C8E77dFF69a56D072D39aCC0BA60Bf437a1b1;
		goat= 0x633CA5652A6774262A790A494e9DdD4fffe51933;
		lion= 0x318C3B89a5311E50f083B19fc511C1A8531C5F4a;
		unicorn= 0x8DE3c405410Ca4877Acdd3B1a5163c0f32eccdec;
		octopus= 0xe1146e60cBeE0148778d84C65370771c56FF989c;
		frog= 0xcAFa81dD9Cd8471AF9aCd22c22F8593FA2947528;
		forest= 0xFf870B5330E0CFa10Bec6B080c66Bf19D37281b9;
		snake= 0xe432bbb9E75C616f04cC034d545839c8f3799041;
		spider= 0xC5966E4B728060708D930eA2d85a049d28F73959;
		rose= 0xB7D3FcCB1947f4aC5DaC8C6fe5C1027B3455C9FC;
		sunflower= 0xC713d90325265546cF01F093C096dCFE4D8b6511;
		palmTree= 0x44aD75b39c0969Debb07ce09a8c577a0B844100C;
		dragonFly= 0x0cedc2D31290B801Ba5eBF5A71185a45B7213138;
		shroom= 0x391fE0B1F9B9288cFce8fB77f5A6Da7C872E0393;

		redBalloonLocation = panda;

		Haley = msg.sender;
		balloonGiver = Haley;
		genesis = block.timestamp;
		timeLastBalloonPopped = block.timestamp;

		moreShares(Haley, 1e18);//just so we can kick things off without having to wait.
	}

	Token snowman;
	Token jack_o_lantern;
	Token blackSwan;
	Token haleysArrow;
	Token moonHowler;
	Token vampire;
	Token miracleMilk;
	Token beeHive;
	Token surfBoard;
	Token canoe;
	Token boat;
	Token submarine;
	Token apeIn;
	Token teleporter;
	Token thirdEye;
	Token hourglassStarDust;
	Token manyPlace;
	Token chimeraGargoyle;
	Token kyuubi;
	Token ironGiant;
	Token bread;
	Token kraken;
	Token pegasus;
	Token tyrone;
	Token honey;
	Token sniperDrone;
	Token[] cards;

	function newCard(string memory name, string memory symbol, uint8 R, uint8 G, uint8 B, uint C) internal returns(Token){
		Token newToken = new Token(name, symbol);
		address rBT = address(newToken);
		ofBalloons[rBT] = true;
		token_R[rBT] = R;
		token_G[rBT] = G;
		token_B[rBT] = B;
		token_Color[rBT] = C; 
		cards.push(newToken);
		return newToken;
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
	function isCaravan(address kingdom) public view returns(bool IS){
		(,,,,,,,IS) = lamp.XY(kingdom);
	}

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
	function proximity(address one, address two, bool _4_8) public view returns(bool){
		(uint x1, uint y1) = getXY(one);
		(uint x2, uint y2) = getXY(two);
		
		uint distance = (x1<x2?(x2-x1):(x1-x2)) + (y1<y2?(y2-y1):(y1-y2));
		address _floatingCastle = floatingCastle();
		return ( (distance == 1) || ( _4_8 && (distance == 2 && x1 != x2 && y1 !=y2) )  ) && one != _floatingCastle && two != _floatingCastle;
	}


/*
██████╗░███████╗██╗░░░░░███████╗░█████╗░░██████╗███████╗  ██████╗░░█████╗░██╗░░░░░██╗░░░░░░█████╗░░█████╗░███╗░░██╗
██╔══██╗██╔════╝██║░░░░░██╔════╝██╔══██╗██╔════╝██╔════╝  ██╔══██╗██╔══██╗██║░░░░░██║░░░░░██╔══██╗██╔══██╗████╗░██║
██████╔╝█████╗░░██║░░░░░█████╗░░███████║╚█████╗░█████╗░░  ██████╦╝███████║██║░░░░░██║░░░░░██║░░██║██║░░██║██╔██╗██║
██╔══██╗██╔══╝░░██║░░░░░██╔══╝░░██╔══██║░╚═══██╗██╔══╝░░  ██╔══██╗██╔══██║██║░░░░░██║░░░░░██║░░██║██║░░██║██║╚████║
██║░░██║███████╗███████╗███████╗██║░░██║██████╔╝███████╗  ██████╦╝██║░░██║███████╗███████╗╚█████╔╝╚█████╔╝██║░╚███║
╚═╝░░╚═╝╚══════╝╚══════╝╚══════╝╚═╝░░╚═╝╚═════╝░╚══════╝  ╚═════╝░╚═╝░░╚═╝╚══════╝╚══════╝░╚════╝░░╚════╝░╚═╝░░╚══╝*/
	function releaseBalloon() public{
		
		address sender = msg.sender;
		address theNewGuy = recordSetter[redBalloonsLeftOnTheWall];
		require(
			( timeLastBalloonPopped+86400 < block.timestamp || sender == theNewGuy )
			&& theNewGuy != address0//we need to keep this so that the balloonGiver is not null. giving money to null address
			&& redBalloonsLeftOnTheWall > 0
			&& panda != floatingCastle()
			&& !redBalloonOnTheLoose
		);
		balloonGiver = theNewGuy;
		redBalloonsLeftOnTheWall -= 1;
		redBalloonLocation = panda;
		redBalloonOnTheLoose = true;
	}


/*
██████╗░██╗░░░██╗██╗░░░██╗  ░██████╗██████╗░░█████╗░███╗░░░███╗  ░░░░░██╗███████╗██████╗░██╗░░██╗██╗░░░██╗
██╔══██╗██║░░░██║╚██╗░██╔╝  ██╔════╝██╔══██╗██╔══██╗████╗░████║  ░░░░░██║██╔════╝██╔══██╗██║░██╔╝╚██╗░██╔╝
██████╦╝██║░░░██║░╚████╔╝░  ╚█████╗░██████╔╝███████║██╔████╔██║  ░░░░░██║█████╗░░██████╔╝█████═╝░░╚████╔╝░
██╔══██╗██║░░░██║░░╚██╔╝░░  ░╚═══██╗██╔═══╝░██╔══██║██║╚██╔╝██║  ██╗░░██║██╔══╝░░██╔══██╗██╔═██╗░░░╚██╔╝░░
██████╦╝╚██████╔╝░░░██║░░░  ██████╔╝██║░░░░░██║░░██║██║░╚═╝░██║  ╚█████╔╝███████╗██║░░██║██║░╚██╗░░░██║░░░
╚═════╝░░╚═════╝░░░░╚═╝░░░  ╚═════╝░╚═╝░░░░░╚═╝░░╚═╝╚═╝░░░░░╚═╝  ░╚════╝░╚══════╝╚═╝░░╚═╝╚═╝░░╚═╝░░░╚═╝░░░*/
	function buySpamJerky() public payable returns(uint){
		
		uint val = msg.value;
		address sender = msg.sender;
		require(
			val % rationCost == 0
			&& balloonOrGiftBoxOnBoard()
			&& (val/rationCost)>0
		);
		uint rations = val / rationCost;
		RugToken rug = RugToken(redBalloonLocation);
		(uint R, uint G, uint B) = rug._RGB();
		uint createdPiZZa = lamp.buy{value:val}( Haley, ($$*R) /3, ($$*G)/3, ($$*B)/3 );

		//generate rations for the buyer.
		spamJerky.mint(sender, rations);
		perShare += createdPiZZa * scaleFactor / totalShares;

		address rugReceiver = floatingCastle();
		if( redBalloonLocation == rugReceiver ){
			R99.mint(sender, 1);
			timeLastBalloonPopped = block.timestamp;
			redBalloonOnTheLoose = false;
			rationCost += 0.0002 ether;
			rugReceiver = sender;
		}

		uint rugs = rug.balanceOf(THIS);

		if(rugs/2 > 0)
			rug.transfer(sender, rugs/2);
		if(rugs/2 > 0)
			rug.transfer(rugReceiver, rugs/2);

		return createdPiZZa/1e18;
	}

	function balloonOrGiftBoxOnBoard() public view returns(bool){
		return redBalloonOnTheLoose || (redBalloonsLeftOnTheWall == 99/* gift box starts game */);
	}

/*
░██████╗████████╗░█████╗░░█████╗░██╗░░██╗  ██████╗░░█████╗░██╗░░░░░██╗░░░░░░█████╗░░█████╗░███╗░░██╗
██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██║░██╔╝  ██╔══██╗██╔══██╗██║░░░░░██║░░░░░██╔══██╗██╔══██╗████╗░██║
╚█████╗░░░░██║░░░██║░░██║██║░░╚═╝█████═╝░  ██████╦╝███████║██║░░░░░██║░░░░░██║░░██║██║░░██║██╔██╗██║
░╚═══██╗░░░██║░░░██║░░██║██║░░██╗██╔═██╗░  ██╔══██╗██╔══██║██║░░░░░██║░░░░░██║░░██║██║░░██║██║╚████║
██████╔╝░░░██║░░░╚█████╔╝╚█████╔╝██║░╚██╗  ██████╦╝██║░░██║███████╗███████╗╚█████╔╝╚█████╔╝██║░╚███║
╚═════╝░░░░╚═╝░░░░╚════╝░░╚════╝░╚═╝░░╚═╝  ╚═════╝░╚═╝░░╚═╝╚══════╝╚══════╝░╚════╝░░╚════╝░╚═╝░░╚══╝*/
	mapping( uint => mapping(address=>uint) ) stockedBalloons;
	mapping( uint => address ) recordSetter;
	
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
			require( redBalloonOnTheLoose && value == 1);
			RugToken(TOKEN).transfer(panda, 1);
			moveBalloon( bytesToAddress(_data) );
		}else if( TOKEN == address(R99) ){	
			popR99(from, value);
		}else if(TOKEN == address(MVT) ){
			address sender = msg.sender;
			require( 0<value && PiZZa.balanceOf(sender) >= 10*$$);
			stockedBalloons[redBalloonsLeftOnTheWall][sender] += value;
			uint newCount = stockedBalloons[redBalloonsLeftOnTheWall][sender];
			
			balloonLocked += value;
			moreShares(sender, value*9/10);
			moreShares(/*for the current balloon giver*/balloonGiver, value/20);
			moreShares(/* operational */ Haley, value/20);

			if( stockedBalloons[redBalloonsLeftOnTheWall][ recordSetter[redBalloonsLeftOnTheWall] ] < newCount ){
				recordSetter[redBalloonsLeftOnTheWall] = sender;
			}
		}else{
			revert();
		}
	}

	function popR99(address from, uint value) internal{
		require(
			redBalloonsLeftOnTheWall == 0
			&& !redBalloonOnTheLoose 
			&& block.timestamp > timeLastBalloonPopped+(timeLastBalloonPopped-genesis)
		);
		MVT.transfer( from, balloonLocked * value / 100 );
	}

	function moveBalloon(address destination) internal{
		require(
			redBalloonLocation != floatingCastle()
			&& redBalloonOnTheLoose 
			&& proximity(redBalloonLocation,destination,false)
			&& ofRug(destination)
		);

		redBalloonLocation = destination;
	}
	function bytesToAddress(bytes memory bys) internal pure returns (address addr){
		assembly {
		  addr := mload(add(bys,20))
		} 
	}

	uint public totalShares;
	uint perShare;
	uint scaleFactor = 10000000000000;
	mapping(address => uint) public shares;
	mapping(address => uint) payouts;

/*
███████╗░█████╗░██████╗░███╗░░██╗██╗███╗░░██╗░██████╗░░██████╗
██╔════╝██╔══██╗██╔══██╗████╗░██║██║████╗░██║██╔════╝░██╔════╝
█████╗░░███████║██████╔╝██╔██╗██║██║██╔██╗██║██║░░██╗░╚█████╗░
██╔══╝░░██╔══██║██╔══██╗██║╚████║██║██║╚████║██║░░╚██╗░╚═══██╗
███████╗██║░░██║██║░░██║██║░╚███║██║██║░╚███║╚██████╔╝██████╔╝
╚══════╝╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░╚══╝╚═╝╚═╝░░╚══╝░╚═════╝░╚═════╝░*/
	function moreShares(address who, uint _shares) internal{
		totalShares += _shares;
		shares[who] += _shares;
		payouts[who] += perShare*_shares;
	}

	function dividendsOf(address who) public view returns(uint dividends){
		return ( ( shares[who] * perShare - payouts[who] ) / scaleFactor );  
	}

	function withdrawDividends(address destination) public{
		
		address sender = msg.sender;
		if(destination == address0) destination = sender;

		uint $PIZZA = dividendsOf( sender);
		payouts[sender] = shares[sender] * perShare;

		if( $PIZZA > 0 ){
			PiZZa.transfer( destination, $PIZZA);
		}
	}

	function haleysWithdraw() public{
		require(msg.sender == Haley);
		address[] memory kingdoms;
		uint[] memory fomoRounds;
		lamp.withdrawDividends(kingdoms, fomoRounds, Haley);
	}
	bool glassBalloonPopped;
	function glassBalloon() public{
		require(msg.sender == Haley && glassBalloonPopped == false);
		popR99(Haley, 1);
		glassBalloonPopped = true;
	}

/*
░█████╗░████████╗██╗░░██╗███████╗██████╗░  ░█████╗░░█████╗░██████╗░██████╗░░██████╗
██╔══██╗╚══██╔══╝██║░░██║██╔════╝██╔══██╗  ██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔════╝
██║░░██║░░░██║░░░███████║█████╗░░██████╔╝  ██║░░╚═╝███████║██████╔╝██║░░██║╚█████╗░
██║░░██║░░░██║░░░██╔══██║██╔══╝░░██╔══██╗  ██║░░██╗██╔══██║██╔══██╗██║░░██║░╚═══██╗
╚█████╔╝░░░██║░░░██║░░██║███████╗██║░░██║  ╚█████╔╝██║░░██║██║░░██║██████╔╝██████╔╝
░╚════╝░░░░╚═╝░░░╚═╝░░╚═╝╚══════╝╚═╝░░╚═╝  ░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝╚═════╝░╚═════╝░*/
	uint balloonLocked;
	function otherCards(uint8 cardCode) public payable{
		address sender = msg.sender;
		uint reward = 1;
		Token cardCreated;
		if(cardCode == 0){
			if(address(thirdEye) == address0 ){ thirdEye = newCard("Third Eye","3rd",2,0,2, 9); reward *= 10;}
			cardCreated = thirdEye;
			require( isCaravan(shroom) && floatingCastle() == eye );
		}else if(cardCode == 1){
			reward = 100;
			if(address(hourglassStarDust) == address0 ){ hourglassStarDust = newCard("Seconds","2nd",0,1,1, 1); reward *= 10;}
			cardCreated = hourglassStarDust;
			require( isCaravan(shootingStar) );
		}else if(cardCode == 2){
			if(address(teleporter) == address0 ){ teleporter = newCard("Teleporter","XY0",2,0,1, 5); reward *= 10;}
			cardCreated = teleporter;
			(uint X, uint Y) = getXY(pawPrints);
			require( (X==1||X==8) && (Y==1||Y==8) );
		}else if(cardCode == 3){
			if(address(moonHowler) == address0){moonHowler = newCard("Shadow Wolf","WoLF",6,6,6, 6); reward *= 6;}
			cardCreated = moonHowler;
			require( redBalloonLocation == wolf && floatingCastle() == moon );
		}else if(cardCode == 4){
			if( address(vampire) == address0 ){
				vampire = newCard("Vampire","VaMP",2,0,0, 6);
				dracula = new Token("DRACULA LORD TOKEN", "DLT");
				dracula.mint(sender, 1);
			}
			cardCreated = vampire;
			require( floatingCastle() == bat && redBalloonsLeftOnTheWall%11 == 0 );
		}else if(cardCode == 5){
			if( address(miracleMilk) == address0 ){miracleMilk = newCard("Miracle Milk","Moo",3,3,3, 2); reward *=10;}
			cardCreated = miracleMilk;
			require(  redBalloonLocation == cattle );
		}else if(cardCode == 6){
			if(redBalloonsLeftOnTheWall>=54){
				if(address(surfBoard) == address0 ){ surfBoard = newCard("Surf Board","SuRF",0,1,3, 1); reward *= 10;}
				cardCreated = surfBoard;
			}else if(redBalloonsLeftOnTheWall>=22){
				if(address(canoe) == address0 ){ canoe = newCard("Canoe","PaDDl",1,2,3, 2); reward *= 10;}
				cardCreated = canoe;
			}else if(redBalloonsLeftOnTheWall>=7){
				if(address(boat) == address0 ){boat = newCard("Boat","SaIL",0,0,3, 4); reward *= 10;}
				cardCreated = boat;
			}else if(redBalloonsLeftOnTheWall>=0){
				if(address(submarine) == address0 ){submarine = newCard("Submarine","SuB",0,0,1, 6); reward *= 10;}
				cardCreated = submarine;
			}
			require( redBalloonLocation == water && inCenter_onGround(water) );
		}else if(cardCode == 7){
			if(address(apeIn) == address0 ){ apeIn = newCard("Fomo Ape","FoMo",2,2,0, 7); reward *= 10;}
			cardCreated = apeIn;
			require( redBalloonLocation == monkey && proximity(palmTree, monkey, false) );
		}else if(cardCode == 8){
			if(address(manyPlace) == address0 ){ manyPlace = newCard("Many Place","MPl",2,0,3, 13); reward *= 3;}
			cardCreated = manyPlace;
			require( floatingCastle() == goat && (redBalloonsLeftOnTheWall == 99 || redBalloonsLeftOnTheWall == 0) );
		}else if(cardCode == 9){
			if(address(chimeraGargoyle) == address0 ){ chimeraGargoyle = newCard("Chimera Gargoyle","ChG",2,2,2, 8); reward *= 10;}
			cardCreated = chimeraGargoyle;
			require( 
				inCenter_onGround(lion)
				&&inCenter_onGround(goat)
				&&inCenter_onGround(snake)
			);
		}else if(cardCode == 10){
			if(address(kyuubi) == address0 ){ kyuubi = newCard("PsyKyuubi","PsyK",3,1,0, 2); reward *= 10;}
			cardCreated = kyuubi;
			require( floatingCastle() == fox );
		}else if(cardCode == 11){
			if(address(ironGiant) == address0 ){ ironGiant = newCard("Iron Giant","IRoN",6,6,6, 6); reward *= 10;}
			cardCreated = ironGiant;
			require( floatingCastle() == gold && golem == redBalloonLocation );
		}else if(cardCode == 12){
			if(address(bread) == address0 ){ bread = newCard("Cake","LIEs",2,2,1, 3); reward *= 10;}
			cardCreated = bread;
			require(  wheat == redBalloonLocation );
		}else if(cardCode == 13){
			if(address(kraken) == address0 ){ kraken = newCard("Kraken","KRKn",0,0,2, 6); reward *= 10;}
			cardCreated = kraken;
			require( octopus == redBalloonLocation && floatingCastle() == water);
		}else if(cardCode == 14){
			if(address(pegasus) == address0 ){ pegasus = newCard("Pegasus","UNi",2,3,3, 3); reward *= 10;}
			cardCreated = pegasus;
			(uint X1, uint Y1) = getXY(redBalloonLocation);
			(uint X2, uint Y2) = getXY(unicorn);
			require( floatingCastle() == unicorn && X1 == X2 && Y1 == Y2);
		}else if(cardCode == 15){
			if(address(tyrone) == address0 ){ tyrone = newCard("President of KeKistan","Reeeeeeeeeeeeeeeee",0,2,0, 8); reward *= 10; }
			cardCreated = tyrone;
			require( redBalloonLocation == frog && inCenter_onGround(frog)  && isCaravan(frog) );
		}else if(cardCode == 16){
			if(address(sniperDrone) == address0 ){ sniperDrone = newCard("Diving Sniper","DSn",1,2,0, 3); reward *= 50;}
			cardCreated = sniperDrone;
			require( floatingCastle() == dragonFly || inCenter_onGround(dragonFly) );
		}else if(cardCode == 17){
			if(address(beeHive) == address0 ){ beeHive = newCard("Bee Hive","HiVE",3,3,0, 3); reward *= 10;}
			cardCreated = beeHive;
			require(
				( proximity(bee, rose, false) || proximity(bee, sunflower, false) )
				&& inCenter_onGround(bee)
			);
		}else if(cardCode == 18){
			//Snow Man
			(,uint Y)=getXY(penguin);
			require( redBalloonLocation == penguin && Y>=7);
			reward *= 7;
			if(address(snowman) == address0){snowman = newCard("Christmas","FRoST",3,3,3,3); reward *= 1000;}
			cardCreated = snowman;
		}else if(cardCode == 19){
			//Jack-o-Lantern
			require(
				proximity(skull,fox,false)
				&& proximity(bat,fox,false)
				&& proximity(spider,fox,true)
			);
			reward *= 4;
			if(address(jack_o_lantern) == address0){jack_o_lantern = newCard("Jack-O-Lantern","JaCK",3,1,0,4); reward *= 100;}
			cardCreated = jack_o_lantern;
		}else if(cardCode == 20){
			//Black Swan
			(,uint Y)=getXY(crane);		
			require( proximity(skull,crane,false) && Y<=2 );
			if(address(blackSwan) == address0){blackSwan = newCard("Black Swan","SWaN",0,0,0, 7); reward *= 100;}
			cardCreated = blackSwan;
		}else if(cardCode == 21){
			//Artemis' Arrow
			require( floatingCastle() == forest && inCenter_onGround(deer) && isCaravan(deer) );
			if(address(haleysArrow) == address0){haleysArrow = newCard("Haley's Arrow","ARTMS",3,3,2, 4); reward *= 100;}
			reward *= 10;
			cardCreated = haleysArrow;
		}else if(cardCode == 22){
			//Honey
			require( proximity(bee, rose, false) || proximity(bee, sunflower, false) );
			if(address(honey) == address0){honey = newCard("Honey","H0NEY",3,2,0, 2); reward *= 10000;}//yes... 10,000
			reward *= 10;
			cardCreated = honey;
		}else{
			revert();
		}
		uint cardsToMint = buySpamJerky();

		require( redBalloonOnTheLoose && cardsToMint > 0);
		cardCreated.mint(sender, cardsToMint*reward);
	}
	function inCenter_onGround(address K) internal view returns(bool){
		(uint X, uint Y) = getXY(K);
		return (X==4||X==5) && (Y==4||Y==5) && floatingCastle() != K;
	}
	Token public dracula;

	/*
░██████╗░███████╗████████╗  ██████╗░░█████╗░████████╗░█████╗░
██╔════╝░██╔════╝╚══██╔══╝  ██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗
██║░░██╗░█████╗░░░░░██║░░░  ██║░░██║███████║░░░██║░░░███████║
██║░░╚██╗██╔══╝░░░░░██║░░░  ██║░░██║██╔══██║░░░██║░░░██╔══██║
╚██████╔╝███████╗░░░██║░░░  ██████╔╝██║░░██║░░░██║░░░██║░░██║
░╚═════╝░╚══════╝░░░╚═╝░░░  ╚═════╝░╚═╝░░╚═╝░░░╚═╝░░░╚═╝░░╚═╝*/
	function getData(address p) external view returns(
		address balloonLocation,
		uint balloonsLeft,
		uint i,//shares
		uint _totalShares,
		uint _rationCost,
		uint _dividends,
		uint _stockedBalloons,
		address _recordSetter,
		uint _mostBalloonsStocked,
		uint _timeLastBalloonPopped,
		bool _redBalloonOnTheLoose,
		uint[] memory UINTs
	){
		balloonLocation = redBalloonLocation;
		balloonsLeft = redBalloonsLeftOnTheWall;
		
		_totalShares = totalShares;
		_rationCost = rationCost;
		_dividends = dividendsOf(p);
		_stockedBalloons = stockedBalloons[redBalloonsLeftOnTheWall][p];
		_recordSetter = recordSetter[redBalloonsLeftOnTheWall];
		_mostBalloonsStocked = stockedBalloons[redBalloonsLeftOnTheWall][_recordSetter];
		_timeLastBalloonPopped = timeLastBalloonPopped;
		_redBalloonOnTheLoose = redBalloonOnTheLoose;

		UINTs = new uint[](67);
		ERC20[] memory tokens = new ERC20[](19);
		tokens[0] = balloonToken;
		tokens[1] = spamToken;
		tokens[2] = MVT;
		tokens[3] = MDT;
		tokens[4] = XYO;
		tokens[5] = x_moonday;
		tokens[6] = x_drc;
		tokens[7] = x_barnbond;
		tokens[8] = x_wetstuff;
		tokens[9] = x_BCO;
		tokens[10] = SENT;
		tokens[11] = x_CID;
		tokens[12] = x_RFOX;
		tokens[13] = x_GLM;
		tokens[14] = x_BRD;
		tokens[15] = x_OCTO;
		tokens[16] = x_UNI;
		tokens[17] = x_PEPE;
		tokens[18] = x_BZZZZ;

		for(i=0;i<38;i+=2){ (UINTs[i],UINTs[i+1]) = tokenData(tokens[i/2],p); }
		for(i=0;i<cards.length;i++){ (UINTs[i+38],) = tokenData(cards[i],p); }

		i = shares[p];
	}

	function tokenData(ERC20 erc, address p) internal view returns(uint,uint){ return ( erc.balanceOf(p), 0 ); }
}


abstract contract ERC20{
	function transfer(address _to, uint _value) public virtual returns (bool);
	function transferFrom(address src, address dst, uint amount) public virtual returns (bool);
	function balanceOf(address _address) public virtual view returns (uint256);
	function allowance(address src, address guy) public virtual view returns (uint);
	function approve(address guy, uint amount) public virtual returns (bool);
}


/*
░██████╗░███████╗███╗░░██╗███████╗██████╗░██╗░█████╗░  ░█████╗░░█████╗░██████╗░██████╗░
██╔════╝░██╔════╝████╗░██║██╔════╝██╔══██╗██║██╔══██╗  ██╔══██╗██╔══██╗██╔══██╗██╔══██╗
██║░░██╗░█████╗░░██╔██╗██║█████╗░░██████╔╝██║██║░░╚═╝  ██║░░╚═╝███████║██████╔╝██║░░██║
██║░░╚██╗██╔══╝░░██║╚████║██╔══╝░░██╔══██╗██║██║░░██╗  ██║░░██╗██╔══██║██╔══██╗██║░░██║
╚██████╔╝███████╗██║░╚███║███████╗██║░░██║██║╚█████╔╝  ╚█████╔╝██║░░██║██║░░██║██████╔╝
░╚═════╝░╚══════╝╚═╝░░╚══╝╚══════╝╚═╝░░╚═╝╚═╝░╚════╝░  ░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝╚═════╝░*/
contract Token is ERC20{
	string public name;
    string public symbol;
    uint8 public decimals;// yes, 0
	address THIS = address(this);
	address minter;

	constructor(string memory _name, string memory _symbol ) {
		name = _name;
		symbol = _symbol;
		minter = msg.sender;
	}

	modifier authOnly{
	  require( msg.sender == minter );
	  _;
    }

	function mint(address _address, uint _value) external authOnly(){
		balances[_address] += _value;
		_totalSupply += _value;
	}

	mapping(address => uint256) balances;

	uint _totalSupply;

	mapping(address => mapping(address => uint)) approvals;

	
	function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address _address) public view override returns (uint256 balance) {
		return balances[_address];
	}

	function transfer(address _to, uint _value, bytes memory _data) public returns (bool) {
		if( isContract(_to) ){
			return transferToContract(_to, _value, _data);
		}else{
			return transferToAddress(_to, _value);
		}
	}
	function transfer(address _to, uint _value) public  override returns (bool) {
		bytes memory empty;
		if(isContract(_to)){
			return transferToContract(_to, _value, empty);
		}else{
			return transferToAddress(_to, _value);
		}
	}

	//function that is called when transaction target is an address
	function transferToAddress(address _to, uint _value) private returns (bool) {
		moveTokens(msg.sender, _to, _value);
		return true;
	}

	//function that is called when transaction target is a contract
	function transferToContract(address _to, uint _value, bytes memory _data) private returns (bool) {
		moveTokens(msg.sender, _to, _value);
		ERC223ReceivingContract receiver = ERC223ReceivingContract(_to);
		receiver.tokenFallback(msg.sender, _value, _data);
		return true;
	}

	function moveTokens(address _from, address _to, uint _amount) internal virtual{
		require( _amount <= balances[_from] );
		balances[_from] -= _amount;
		balances[_to] += _amount;
	}

    function allowance(address src, address guy) public view override returns (uint) {
        return approvals[src][guy];
    }
  	
    function transferFrom(address src, address dst, uint amount) public override returns (bool){
        address sender = msg.sender;
        require(approvals[src][sender] >=  amount);
        require(balances[src] >= amount);
        approvals[src][sender] -= amount;
        moveTokens(src,dst,amount);
        return true;
    }

    function approve(address guy, uint amount) public override returns (bool) {
        address sender = msg.sender;
        approvals[sender][guy] = amount;
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

	function colorToCluster(uint r, uint g, uint b) public virtual pure returns(uint8 rC, uint8 gC, uint8 bC);
	function ofRug(address addr) public virtual view returns(bool);
	function allKingdoms(address perspective) public virtual view returns(
		address[] memory address_,
		uint[] memory UINTs_
	);
	function withdrawDividends(address[] memory kingdoms, uint[] memory fomoRounds, address destination) public virtual;
}
abstract contract ERC223ReceivingContract{
    function tokenFallback(address _from, uint _value, bytes calldata _data) external virtual;
}

abstract contract RugToken is ERC20{
	function _RGB() public virtual view returns(uint8 _R,uint8 _G,uint8 _B);
}