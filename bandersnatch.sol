// File openzeppelin-solidity/contracts/utils/introspection/IERC165.sol@v4.0.0

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.6;
pragma experimental ABIEncoderV2;

/**
 * @dev Interface of the ERC165 standard, as defined in the
 * https://eips.ethereum.org/EIPS/eip-165[EIP].
 *
 * Implementers can declare support of contract interfaces, which can then be
 * queried by others ({ERC165Checker}).
 *
 * For an implementation, see {ERC165}.
 */
interface IERC165 {
    /**
     * @dev Returns true if this contract implements the interface defined by
     * `interfaceId`. See the corresponding
     * https://eips.ethereum.org/EIPS/eip-165#how-interfaces-are-identified[EIP section]
     * to learn more about how these ids are created.
     *
     * This function call must use less than 30 000 gas.
     */
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}


// File openzeppelin-solidity/contracts/token/NewScrolls/INewScrolls.sol@v4.0.0



pragma solidity ^0.8.0;

/**
 * @dev Required interface of an NewScrolls compliant contract.
 */
interface INewScrolls is IERC165 {
    /**
     * @dev Emitted when `tokenId` token is transferred from `from` to `to`.
     */
    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);

    /**
     * @dev Emitted when `owner` enables `approved` to manage the `tokenId` token.
     */
    event Approval(address indexed owner, address indexed approved, uint256 indexed tokenId);

    /**
     * @dev Emitted when `owner` enables or disables (`approved`) `operator` to manage all of its assets.
     */
    event ApprovalForAll(address indexed owner, address indexed operator, bool approved);

    /**
     * @dev Returns the number of tokens in ``owner``'s account.
     */
    function balanceOf(address owner) external view returns (uint256 balance);

    /**
     * @dev Returns the owner of the `tokenId` token.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function ownerOf(uint256 tokenId) external view returns (address owner);

    /**
     * @dev Safely transfers `tokenId` token from `from` to `to`, checking first that contract recipients
     * are aware of the NewScrolls protocol to prevent tokens from being forever locked.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must exist and be owned by `from`.
     * - If the caller is not `from`, it must be have been allowed to move this token by either {approve} or {setApprovalForAll}.
     * - If `to` refers to a smart contract, it must implement {INewScrollsReceiver-onNewScrollsReceived}, which is called upon a safe transfer.
     *
     * Emits a {Transfer} event.
     */
    function safeTransferFrom(address from, address to, uint256 tokenId) external;

    /**
     * @dev Transfers `tokenId` token from `from` to `to`.
     *
     * WARNING: Usage of this method is discouraged, use {safeTransferFrom} whenever possible.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must be owned by `from`.
     * - If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address from, address to, uint256 tokenId) external;

    /**
     * @dev Gives permission to `to` to transfer `tokenId` token to another account.
     * The approval is cleared when the token is transferred.
     *
     * Only a single account can be approved at a time, so approving the zero address clears previous approvals.
     *
     * Requirements:
     *
     * - The caller must own the token or be an approved operator.
     * - `tokenId` must exist.
     *
     * Emits an {Approval} event.
     */
    function approve(address to, uint256 tokenId) external;

    /**
     * @dev Returns the account approved for `tokenId` token.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function getApproved(uint256 tokenId) external view returns (address operator);

    /**
     * @dev Approve or remove `operator` as an operator for the caller.
     * Operators can call {transferFrom} or {safeTransferFrom} for any token owned by the caller.
     *
     * Requirements:
     *
     * - The `operator` cannot be the caller.
     *
     * Emits an {ApprovalForAll} event.
     */
    function setApprovalForAll(address operator, bool _approved) external;

    /**
     * @dev Returns if the `operator` is allowed to manage all of the assets of `owner`.
     *
     * See {setApprovalForAll}
     */
    function isApprovedForAll(address owner, address operator) external view returns (bool);

    /**
      * @dev Safely transfers `tokenId` token from `from` to `to`.
      *
      * Requirements:
      *
      * - `from` cannot be the zero address.
      * - `to` cannot be the zero address.
      * - `tokenId` token must exist and be owned by `from`.
      * - If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.
      * - If `to` refers to a smart contract, it must implement {INewScrollsReceiver-onNewScrollsReceived}, which is called upon a safe transfer.
      *
      * Emits a {Transfer} event.
      */
    function safeTransferFrom(address from, address to, uint256 tokenId, bytes calldata data) external;
}


// File openzeppelin-solidity/contracts/token/NewScrolls/INewScrollsReceiver.sol@v4.0.0



pragma solidity ^0.8.0;

/**
 * @title NewScrolls token receiver interface
 * @dev Interface for any contract that wants to support safeTransfers
 * from NewScrolls asset contracts.
 */
interface INewScrollsReceiver {
    /**
     * @dev Whenever an {INewScrolls} `tokenId` token is transferred to this contract via {INewScrolls-safeTransferFrom}
     * by `operator` from `from`, this function is called.
     *
     * It must return its Solidity selector to confirm the token transfer.
     * If any other value is returned or the interface is not implemented by the recipient, the transfer will be reverted.
     *
     * The selector can be obtained in Solidity with `INewScrolls.onNewScrollsReceived.selector`.
     */
    function onNewScrollsReceived(address from, uint256 tokenId, bytes calldata data) external returns (bytes4);
}


// File openzeppelin-solidity/contracts/token/NewScrolls/extensions/INewScrollsMetadata.sol@v4.0.0



pragma solidity ^0.8.0;

/**
 * @title ERC-721 Non-Fungible Token Standard, optional metadata extension
 * @dev See https://eips.ethereum.org/EIPS/eip-721
 */
interface INewScrollsMetadata is INewScrolls {

    /**
     * @dev Returns the token collection name.
     */
    function name() external view returns (string memory);

    /**
     * @dev Returns the token collection symbol.
     */
    function symbol() external view returns (string memory);

    /**
     * @dev Returns the Uniform Resource Identifier (URI) for `tokenId` token.
     */
    function tokenURI(uint256 tokenId) external view returns (string memory);
}


// File openzeppelin-solidity/contracts/token/NewScrolls/extensions/INewScrollsEnumerable.sol@v4.0.0



pragma solidity ^0.8.0;

/**
 * @title ERC-721 Non-Fungible Token Standard, optional enumeration extension
 * @dev See https://eips.ethereum.org/EIPS/eip-721
 */
interface INewScrollsEnumerable is INewScrolls {

    /**
     * @dev Returns the total amount of tokens stored by the contract.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns a token ID owned by `owner` at a given `index` of its token list.
     * Use along with {balanceOf} to enumerate all of ``owner``'s tokens.
     */
    function tokenOfOwnerByIndex(address owner, uint256 index) external view returns (uint256 tokenId);

    /**
     * @dev Returns a token ID at a given `index` of all the tokens stored by the contract.
     * Use along with {totalSupply} to enumerate all tokens.
     */
    function tokenByIndex(uint256 index) external view returns (uint256);
}


// File openzeppelin-solidity/contracts/utils/Address.sol@v4.0.0



pragma solidity ^0.8.0;

/**
 * @dev Collection of functions related to the address type
 */
library Address {
    /**
     * @dev Returns true if `account` is a contract.
     *
     * [IMPORTANT]
     * ====
     * It is unsafe to assume that an address for which this function returns
     * false is an externally-owned account (EOA) and not a contract.
     *
     * Among others, `isContract` will return false for the following
     * types of addresses:
     *
     *  - an externally-owned account
     *  - a contract in construction
     *  - an address where a contract will be created
     *  - an address where a contract lived, but was destroyed
     * ====
     */
    function isContract(address account) internal view returns (bool) {
        // This method relies on extcodesize, which returns 0 for contracts in
        // construction, since the code is only stored at the end of the
        // constructor execution.

        uint256 size;
        // solhint-disable-next-line no-inline-assembly
        assembly { size := extcodesize(account) }
        return size > 0;
    }

    /**
     * @dev Replacement for Solidity's `transfer`: sends `amount` wei to
     * `recipient`, forwarding all available gas and reverting on errors.
     *
     * https://eips.ethereum.org/EIPS/eip-1884[EIP1884] increases the gas cost
     * of certain opcodes, possibly making contracts go over the 2300 gas limit
     * imposed by `transfer`, making them unable to receive funds via
     * `transfer`. {sendValue} removes this limitation.
     *
     * https://diligence.consensys.net/posts/2019/09/stop-using-soliditys-transfer-now/[Learn more].
     *
     * IMPORTANT: because control is transferred to `recipient`, care must be
     * taken to not create reentrancy vulnerabilities. Consider using
     * {ReentrancyGuard} or the
     * https://solidity.readthedocs.io/en/v0.5.11/security-considerations.html#use-the-checks-effects-interactions-pattern[checks-effects-interactions pattern].
     */
    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-low-level-calls, avoid-call-value
        (bool success, ) = recipient.call{ value: amount }("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }

    /**
     * @dev Performs a Solidity function call using a low level `call`. A
     * plain`call` is an unsafe replacement for a function call: use this
     * function instead.
     *
     * If `target` reverts with a revert reason, it is bubbled up by this
     * function (like regular Solidity function calls).
     *
     * Returns the raw returned data. To convert to the expected return value,
     * use https://solidity.readthedocs.io/en/latest/units-and-global-variables.html?highlight=abi.decode#abi-encoding-and-decoding-functions[`abi.decode`].
     *
     * Requirements:
     *
     * - `target` must be a contract.
     * - calling `target` with `data` must not revert.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data) internal returns (bytes memory) {
      return functionCall(target, data, "Address: low-level call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`], but with
     * `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data, string memory errorMessage) internal returns (bytes memory) {
        return functionCallWithValue(target, data, 0, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but also transferring `value` wei to `target`.
     *
     * Requirements:
     *
     * - the calling contract must have an ETH balance of at least `value`.
     * - the called Solidity function must be `payable`.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(address target, bytes memory data, uint256 value) internal returns (bytes memory) {
        return functionCallWithValue(target, data, value, "Address: low-level call with value failed");
    }

    /**
     * @dev Same as {xref-Address-functionCallWithValue-address-bytes-uint256-}[`functionCallWithValue`], but
     * with `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(address target, bytes memory data, uint256 value, string memory errorMessage) internal returns (bytes memory) {
        require(address(this).balance >= value, "Address: insufficient balance for call");
        require(isContract(target), "Address: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.call{ value: value }(data);
        return _verifyCallResult(success, returndata, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but performing a static call.
     *
     * _Available since v3.3._
     */
    function functionStaticCall(address target, bytes memory data) internal view returns (bytes memory) {
        return functionStaticCall(target, data, "Address: low-level static call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-string-}[`functionCall`],
     * but performing a static call.
     *
     * _Available since v3.3._
     */
    function functionStaticCall(address target, bytes memory data, string memory errorMessage) internal view returns (bytes memory) {
        require(isContract(target), "Address: static call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.staticcall(data);
        return _verifyCallResult(success, returndata, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but performing a delegate call.
     *
     * _Available since v3.4._
     */
    function functionDelegateCall(address target, bytes memory data) internal returns (bytes memory) {
        return functionDelegateCall(target, data, "Address: low-level delegate call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-string-}[`functionCall`],
     * but performing a delegate call.
     *
     * _Available since v3.4._
     */
    function functionDelegateCall(address target, bytes memory data, string memory errorMessage) internal returns (bytes memory) {
        require(isContract(target), "Address: delegate call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.delegatecall(data);
        return _verifyCallResult(success, returndata, errorMessage);
    }

    function _verifyCallResult(bool success, bytes memory returndata, string memory errorMessage) private pure returns(bytes memory) {
        if (success) {
            return returndata;
        } else {
            // Look for revert reason and bubble it up if present
            if (returndata.length > 0) {
                // The easiest way to bubble the revert reason is using memory via assembly

                // solhint-disable-next-line no-inline-assembly
                assembly {
                    let returndata_size := mload(returndata)
                    revert(add(32, returndata), returndata_size)
                }
            } else {
                revert(errorMessage);
            }
        }
    }
}


// File openzeppelin-solidity/contracts/utils/Context.sol@v4.0.0



pragma solidity ^0.8.0;

/*
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}


// File openzeppelin-solidity/contracts/utils/Strings.sol@v4.0.0



pragma solidity ^0.8.0;

/**
 * @dev String operations.
 */
library Strings {
    bytes16 private constant alphabet = "0123456789abcdef";

    /**
     * @dev Converts a `uint256` to its ASCII `string` decimal representation.
     */
    function toString(uint256 value) internal pure returns (string memory) {
        // Inspired by OraclizeAPI's implementation - MIT licence
        // https://github.com/oraclize/ethereum-api/blob/b42146b063c7d6ee1358846c198246239e9360e8/oraclizeAPI_0.4.25.sol

        if (value == 0) {
            return "0";
        }
        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }
        return string(buffer);
    }

    /**
     * @dev Converts a `uint256` to its ASCII `string` hexadecimal representation.
     */
    function toHexString(uint256 value) internal pure returns (string memory) {
        if (value == 0) {
            return "0x00";
        }
        uint256 temp = value;
        uint256 length = 0;
        while (temp != 0) {
            length++;
            temp >>= 8;
        }
        return toHexString(value, length);
    }

    /**
     * @dev Converts a `uint256` to its ASCII `string` hexadecimal representation with fixed length.
     */
    function toHexString(uint256 value, uint256 length) internal pure returns (string memory) {
        bytes memory buffer = new bytes(2 * length + 2);
        buffer[0] = "0";
        buffer[1] = "x";
        for (uint256 i = 2 * length + 1; i > 1; --i) {
            buffer[i] = alphabet[value & 0xf];
            value >>= 4;
        }
        require(value == 0, "Strings: hex length insufficient");
        return string(buffer);
    }

}


// File openzeppelin-solidity/contracts/utils/introspection/ERC165.sol@v4.0.0



pragma solidity ^0.8.0;

/**
 * @dev Implementation of the {IERC165} interface.
 *
 * Contracts that want to implement ERC165 should inherit from this contract and override {supportsInterface} to check
 * for the additional interface id that will be supported. For example:
 *
 * ```solidity
 * function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
 *     return interfaceId == type(MyInterface).interfaceId || super.supportsInterface(interfaceId);
 * }
 * ```
 *
 * Alternatively, {ERC165Storage} provides an easier to use but more expensive implementation.
 */
abstract contract ERC165 is IERC165 {
    /**
     * @dev See {IERC165-supportsInterface}.
     */
    function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
        return interfaceId == type(IERC165).interfaceId;
    }
}


// File openzeppelin-solidity/contracts/token/NewScrolls/NewScrolls.sol@v4.0.0



pragma solidity ^0.8.0;

/**
 * @dev Implementation of https://eips.ethereum.org/EIPS/eip-721[NewScrolls] Non-Fungible Token Standard, including
 * the Metadata extension, but not including the Enumerable extension, which is available separately as
 * {NewScrollsEnumerable}.
 */

    /*----------------------------------------------------*/
    /*----------------------------------------------------*/
    /*----------------------------------------------------*/
    /*----------------------------------------------------*/
    /*----------------------------------------------------*/
    /*----------------------------------------------------*/
    /*----------------------------------------------------*/
    /*----------------------------------------------------*/
    /*----------------------------------------------------*/

    /*----------------------------------------------------*/
    /*----------------------------------------------------*/
    /*----------------------------------------------------*/
    /*----------------------------------------------------*/
    /*----------------------------------------------------*/
    /*----------------------------------------------------*/
    /*----------------------------------------------------*/
    /*----------------------------------------------------*/
    /*----------------------------------------------------*/

    /*----------------------------------------------------*/
    /*----------------------------------------------------*/
    /*----------------------------------------------------*/
    /*----------------------------------------------------*/
    /*----------------------------------------------------*/
    /*----------------------------------------------------*/
    /*----------------------------------------------------*/
    /*----------------------------------------------------*/
    /*----------------------------------------------------*/
/*
BANDERSNATCH
###
*/
contract NewScrolls is Context, ERC165, INewScrolls, INewScrollsMetadata {

    address THIS = address(this);
    Oracle ORACLE = Oracle(0x9449562a87f035daEAee0139d21d95EE9c9E398B);
    RedBalloon redBalloon = RedBalloon(0x380762Ea0Edd3E0abfc000179F3B8C12471FC1a2);
    Pyramid PiZZa = Pyramid(0xCbA2630071BC46aCc3408749cf8c76E4a4599Db7);
    
    uint genesis;

    address pineapples;
    address parker = 0xAeA13531Ab3726086A02fD9254ee3dC37c876442;

    uint[] _r;
    uint[] _g;
    uint[] _b;
    constructor(){
        pineapples = msg.sender;
        genesis = block.timestamp;
        _name = "New Scrolls";
        _symbol = "SCROLL";
        _mint(pineapples, 0);
        cards[0].creator = parker;
        cards[0].timeCreated = block.timestamp;
        emit Text(0, parker, 0, '', "You awaken in a grassy field, unable to remember how you got here. You can hear a waterfall in a nearby forest, and you can see smoke rising from a town in the distance.");

        cardCost = $/1000;

        //sappling
        _r.push($/3);
        _g.push(1e18);
        _b.push($/3);

        //forest
        _r.push(0);
        _g.push($/3);
        _b.push(0);

        //palm tree
        _r.push($/3);
        _g.push($);
        _b.push(2*$/3);

        //wheat
        _r.push(2*$/3);
        _g.push(2*$/3);
        _b.push($/3);

        //blueberries
        _r.push($/3);
        _g.push($/3);
        _b.push(2*$/3);

        //rose
        _r.push($);
        _g.push($/3);
        _b.push(2*$/3);

        //sunflower
        _r.push($);
        _g.push($);
        _b.push($/3);
    }

    mapping(address => string) public sig;
    mapping(address => string) public link;

    function changeSig(string memory _sig) public{
        sig[msg.sender] = _sig;
    }

    function changeLink(string memory _link) public{
        link[msg.sender] = _link;
    }

    function changeBrand(string memory _sig, string memory _link) public{
        link[msg.sender] = _link;
        sig[msg.sender] = _sig;
    }

    mapping(address => uint) public creator_cardCount;
    mapping(address => mapping(uint => uint)) public creator_cards;
    struct Card{
        uint ID;
        uint timeCreated;
        uint baseCard;
        uint textID;
        string URI;
        uint depth;
        uint parent;
        uint weight;
        bool staked;
        address creator;
        mapping(uint => uint) storyCards;
        uint storyCardCount;
    }
    
    function viewCards_ofCreator(address addr, uint offset) public view returns(
        uint[] memory _cardIDs,
        uint[] memory timeCreated,
        uint[] memory baseCard,
        uint[] memory textID,
        uint[] memory depth,
        uint[] memory parent,
        uint[] memory weight,
        bool[] memory staked,
        string[] memory URI
    ){
        uint L;

        L = creator_cardCount[addr];

        _cardIDs = new uint[](L);
        timeCreated = new uint[](L);
        baseCard = new uint[](L);
        textID = new uint[](L);
        depth = new uint[](L);
        parent = new uint[](L);
        weight = new uint[](L);
        staked = new bool[](L);
        URI = new string[](L);

        Card storage c = cards[0];
        for(uint i=offset; i<(L+offset) && i<(100+offset); i++){
            c = stackThese2(addr,i);
            _cardIDs[i] = c.ID;
            timeCreated[i] = c.timeCreated;
            baseCard[i] = c.baseCard;
            textID[i] = c.textID;
            depth[i] = c.depth;
            parent[i] = c.parent;
            weight[i] = c.weight;
            staked[i] = c.staked;
            URI[i] = c.URI;
        }
    }

    function stackThese2(address c,uint i) internal view returns(Card storage){
        return cards[creator_cards[c][i]];
    }
    function stackThese(uint c,uint i) internal view returns(Card storage){
        return cards[cards[c].storyCards[i]];
    }

    function viewCards_ofCard( uint cardID, uint offset) public view returns(
        uint[] memory _cardIDs,        uint[] memory timeCreated,        uint[] memory baseCard,        uint[] memory textID,        uint[] memory depth,        uint[] memory parent,        uint[] memory weight,        bool[] memory staked,        string[] memory URI    ){
        uint L;

        L = cards[cardID].storyCardCount;

        _cardIDs = new uint[](L);
        timeCreated = new uint[](L);
        baseCard = new uint[](L);
        textID = new uint[](L);
        depth = new uint[](L);
        parent = new uint[](L);
        weight = new uint[](L);
        staked = new bool[](L);
        URI = new string[](L);

        Card storage c = cards[0];
        for(uint i=offset; i<(L+offset) && i<(100+offset); i++){
            c = stackThese(cardID,i);
            _cardIDs[i] = c.ID;
            timeCreated[i] = c.timeCreated;
            baseCard[i] = c.baseCard;
            textID[i] = c.textID;
            depth[i] = c.depth;
            parent[i] = c.parent;
            weight[i] = c.weight;
            staked[i] = c.staked;
            URI[i] = c.URI;
        }
    }

    function viewCard(uint ID, uint offset) public view returns(
        uint timeCreated,
        uint baseCard,
        uint textID,
        uint depth,
        uint parent,
        uint weight,
        bool staked,
        string memory URI,
        string memory authorSig,
        address creator,
        uint[] memory cardIDs
    ){
        Card storage c = cards[ID];
        timeCreated = c.timeCreated;
        baseCard = c.baseCard;
        textID = c.textID;
        depth = c.depth;
        parent = c.parent;
        weight = c.weight;
        staked = c.staked;
        URI = URI;
        creator = c.creator;
        authorSig = sig[c.creator];
        cardIDs = new uint[](c.storyCardCount);
        for(uint i;i<c.storyCardCount && i<(100+offset);i++){
            cardIDs[i] = cards[c.storyCards[i]].ID;
        }
    }
    
    mapping(uint => Card) public cards;
    uint cardCount = 1;//because there is an initial card
    uint texts = 1;//because there is an initial card

    event Text(uint indexed textID, address indexed author , uint indexed previousCard, string action, string situation);
    event TextBundle(address indexed author , uint[] previousCards, string[] actions, string[] situations, uint indexed otID);
    uint constant $ = 1e18;
    mapping(uint =>  mapping(uint => uint)) previous;
    mapping(uint =>  mapping(uint => uint)) textPointer;
    mapping(uint => address) requestor;
    mapping(uint => uint8) requestType;
    uint public cardCost;
    function newPath(uint[] memory cardIDs, string[] memory actions, string[] memory situations) public payable{
        (uint fee1, uint fee2) = ORACLE.getFee();
        uint L = actions.length;
        uint oracleMoney = msg.value-cardCost*L;
        require(msg.value >= (fee2+fee1)+cardCost*L );
        uint otID = ORACLE.fileRequestTicket{value:oracleMoney}(1, true);

        uint banderMoney = cardCost*L;
        uint banderBonds;
        if(banderMoney>0){
            banderBonds = redBalloon.buy{value:banderMoney}( THIS, _r[block.number%7], _g[block.number%7], _b[block.number%7] );
        }

        G_UINT[otID] = L;
        requestor[otID] = msg.sender;
        requestType[otID] = 0;

        emit TextBundle(msg.sender, cardIDs, actions, situations, otID);
        uint canonBonds;
        uint dividendBonds;
        uint cardID;
        string memory action;
        string memory situation;
        for(uint i; i<L; i++){
            cardID = cardIDs[i];
            action = actions[i];
            situation = situations[i];
            require( cardID < cardCount);
            if(banderMoney>0){
                canonBonds = banderBonds/L * ( block.timestamp - cards[cards[cardID].baseCard].timeCreated ) / (block.timestamp-genesis);
                dividendBonds = banderBonds/L - canonBonds;
                if(dividendBonds>0){
                    earningsPer += dividendBonds * scaleFactor / totalShares;
                }
                earnings[ownerOf(cardID)] += canonBonds;
            }


            emit Text(texts, msg.sender, cardID, action, situation);

            previous[otID][i] = cardIDs[i];
            textPointer[otID][i] = texts;

            texts += 1;
        }
    }

    // Allow contract to accept PiZZa
    function tokenFallback(address from, uint value, bytes calldata _data) external{
        if(msg.sender == address(PiZZa)){
            if(from != address(redBalloon)){
                if(totalShares>0){
                    earningsPer += value * scaleFactor / totalShares;
                }
            }
        }
    }
    
    mapping(uint => address) newOracle;
    event OracleUpdateRequest(address _newOracle, uint otID);
    function oracleUpdateRequest(address _newOracle) public payable{
        require(cardCount>500 || msg.sender == pineapples);
        uint otID = ORACLE.fileRequestTicket{value:msg.value}(1, true);
        newOracle[otID] = _newOracle;
        requestType[otID] = 2;
        emit OracleUpdateRequest(_newOracle, otID);
    }

    event PriceUpdateRequest(uint newPrice, uint otID);
    function priceUpdateRequest(uint newPrice) public payable{
        uint otID = ORACLE.fileRequestTicket{value:msg.value}(1, true);
        G_UINT[otID] = newPrice;
        requestType[otID] = 3;
        emit PriceUpdateRequest(newPrice, otID);
    }

    mapping(uint => uint) G_UINT;
    mapping(uint => string) requestedURI;
    event URIRequest(uint cardID, string URI, uint otID);
    function uriRequest(uint cardID, string memory URI) public payable{
        (uint fee1, uint fee2) = ORACLE.getFee();
        require( msg.value >= (fee1+fee2)*2 );
        uint otID = ORACLE.fileRequestTicket{value:msg.value-fee1-fee2}(1, true);
        earnings[ownerOf(cardID)] += redBalloon.buy{value:fee1+fee2}( THIS, _r[block.number%7], _g[block.number%7], _b[block.number%7] );
        requestedURI[otID] = URI;
        G_UINT[otID] = cardID;
        requestType[otID] = 1;
        emit URIRequest(cardID, URI, otID);
    }


    function mintUniqueTokenTo(
        address _to,
        uint textID,
        uint parent
    ) internal {
        _mint(_to, cardCount);
        cards[cardCount].creator = _to;
        creator_cards[_to][creator_cardCount[_to]] = cardCount;
        creator_cardCount[_to] += 1;

        cards[cardCount].ID = cardCount;
        cards[cardCount].textID = textID;
        cards[cardCount].parent = parent;
        uint depth = cards[parent].depth + 1;
        cards[cardCount].depth = depth;
        uint weight = depth * (block.timestamp - genesis);
        cards[cardCount].timeCreated = block.timestamp;
        cards[cardCount].baseCard = cardCount;
        cards[cardCount].weight = weight;

        addShares(_to, weight);
    }
    
    event RequestRejected(address indexed  author, uint  ticketID);
    event StoryAccepted(address indexed  author, uint  previousCardID, uint newCardID, uint textID);
    event URIRejected(uint indexed cardID, uint  ticketID);
    event URIAccepted(uint indexed cardID, uint  ticketID);
    event newOracleRejected(address _newOracle, uint indexed ticketID);
    event newOracleAccepted(address _newOracle, uint indexed ticketID);
    event newPriceRejected(uint price, uint indexed ticketID);
    event newPriceAccepted(uint price, uint indexed ticketID);
    function oracleIntFallback(uint ticketID, bool requestRejected, uint numberOfOptions, uint[] memory optionWeights, int[] memory intOptions) external{
        uint optWeight;
        uint positive;
        uint negative;
        require( msg.sender == address(ORACLE) );

        if(!requestRejected){
            //YES OR NO?
            for(uint i; i < numberOfOptions; i+=1){
                optWeight = optionWeights[i];
                if(intOptions[i]>0){
                    positive += optWeight;
                }else{
                    negative += optWeight;
                }
            }
            if(requestType[ticketID]==0){
                address _requestor = requestor[ticketID];
                if(positive>negative){
                    uint textID;
                    uint pcID;
                    Card storage previousCard;
                    uint L = G_UINT[ticketID];
                    for(uint i;i<L;i++){
                        textID = textPointer[ticketID][i];
                        pcID  = previous[ticketID][i];
                        previousCard = cards[pcID];
                        mintUniqueTokenTo(_requestor, textID, pcID);
                        creator_cards[_requestor][creator_cardCount[_requestor]] = cardCount;
                        creator_cardCount[_requestor]+=1;

                        emit StoryAccepted(_requestor, pcID, cardCount, textID);
                        previousCard.storyCards[previousCard.storyCardCount] = cardCount;

                        cardCount += 1;
                        previousCard.storyCardCount += 1;
                    }
                }else{
                    emit RequestRejected(_requestor, ticketID);
                }
            }else if(requestType[ticketID]==1){
                uint cardID = G_UINT[ticketID];
                if(positive>negative){
                    cards[cardID].URI = requestedURI[ticketID];
                    emit URIAccepted(cardID,ticketID);
                }else{
                    emit URIRejected(cardID,ticketID);
                }
            }else if(requestType[ticketID]==2){
                address _newOracle = newOracle[ticketID];
                if(positive>negative){
                    ORACLE = Oracle(_newOracle);
                    emit newOracleAccepted(_newOracle,ticketID);
                }else{
                    emit newOracleRejected(_newOracle,ticketID);
                }
            }else if(requestType[ticketID]==3){
                if(positive>negative){
                    cardCost = G_UINT[ticketID];
                    emit newPriceAccepted(cardCost,ticketID);
                }else{
                    emit newPriceRejected(G_UINT[ticketID],ticketID);
                }
            }
        }
    }
    
    mapping(address => uint) public shares;
    uint public totalShares;
    uint earningsPer;
    mapping(address => uint) payouts;
    mapping(address => uint) public earnings;
    uint256 constant scaleFactor = 0x10000000000000000;
    
    function addShares(address account, uint amount) internal{
        update(account);
        totalShares += amount;
        shares[account] += amount;
    }

    function removeShares(address account, uint amount) internal{
        update(account);
        totalShares -= amount;
        shares[account] -= amount;
    }

    function dividendsOf(address account) public view returns(uint){
        uint owedPerShare = earningsPer - payouts[account];
        return shares[account] * owedPerShare / scaleFactor;
    }
    
    function update(address account) internal {
        uint newMoney = dividendsOf(account);
        payouts[account] = earningsPer;
        earnings[account] += newMoney;
    }

    event Withdraw(address account, uint amount);
    function withdraw() public{
        address sender = msg.sender;
        update(sender);
        uint earned = earnings[sender];
        earnings[sender] = 0;
        require(earned > 0);
        emit Withdraw(sender, earned);
        PiZZa.transfer(sender, earned);
    }

    event StakeIntoCard(uint ogCard, uint edgeCard);
    function stakeIntoCard(uint ogCard, uint edgeCard) public{
        address sender = msg.sender;
        Card storage oCard = cards[ogCard];
        Card storage eCard = cards[edgeCard];
        require(
            ownerOf(ogCard)==sender
            && !oCard.staked
            && eCard.baseCard == edgeCard
            && oCard.depth < eCard.depth
            && eCard.parent == ogCard
        );
        oCard.staked = true;
        eCard.staked = false;
        eCard.baseCard = cards[ogCard].baseCard;
        emit StakeIntoCard(ogCard, edgeCard);
    }

    function viewEarnings(address player) public view returns(uint){
        return earnings[player] + dividendsOf(player);
    }

    /*----------------------------------------------------*/
    /*----------------------------------------------------*/
    /*----------------------------------------------------*/
    /*----------------------------------------------------*/
    /*----------------------------------------------------*/
    /*----------------------------------------------------*/
    /*----------------------------------------------------*/
    /*----------------------------------------------------*/
    /*----------------------------------------------------*/

    /*----------------------------------------------------*/
    /*----------------------------------------------------*/
    /*----------------------------------------------------*/
    /*----------------------------------------------------*/
    /*----------------------------------------------------*/
    /*----------------------------------------------------*/
    /*----------------------------------------------------*/
    /*----------------------------------------------------*/
    /*----------------------------------------------------*/

    /*----------------------------------------------------*/
    /*----------------------------------------------------*/
    /*----------------------------------------------------*/
    /*----------------------------------------------------*/
    /*----------------------------------------------------*/
    /*----------------------------------------------------*/
    /*----------------------------------------------------*/
    /*----------------------------------------------------*/
    /*----------------------------------------------------*/

    using Address for address;
    using Strings for uint256;

    // Token name
    string private _name;

    // Token symbol
    string private _symbol;

    // Mapping from token ID to owner address
    mapping (uint256 => address) private _owners;

    // Mapping owner address to token count
    mapping (address => uint256) private _balances;

    // Mapping from token ID to approved address
    mapping (uint256 => address) private _tokenApprovals;

    // Mapping from owner to operator approvals
    mapping (address => mapping (address => bool)) private _operatorApprovals;

    /**
     * @dev See {IERC165-supportsInterface}.
     */
    function supportsInterface(bytes4 interfaceId) public view virtual override(ERC165, IERC165) returns (bool) {
        return interfaceId == type(INewScrolls).interfaceId
            || interfaceId == type(INewScrollsMetadata).interfaceId
            || super.supportsInterface(interfaceId);
    }

    /**
     * @dev See {INewScrolls-balanceOf}.
     */
    function balanceOf(address owner) public view virtual override returns (uint256) {
        require(owner != address(0), "NewScrolls: balance query for the zero address");
        return _balances[owner];
    }

    /**
     * @dev See {INewScrolls-ownerOf}.
     */
    function ownerOf(uint256 tokenId) public view virtual override returns (address) {
        address owner = _owners[tokenId];
        require(owner != address(0), "NewScrolls: owner query for nonexistent token");
        return owner;
    }

    /**
     * @dev See {INewScrollsMetadata-name}.
     */
    function name() public view virtual override returns (string memory) {
        return _name;
    }

    /**
     * @dev See {INewScrollsMetadata-symbol}.
     */
    function symbol() public view virtual override returns (string memory) {
        return _symbol;
    }

    /**
     * @dev See {INewScrollsMetadata-tokenURI}.
     */
    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        require(_exists(tokenId), "NewScrollsMetadata: URI query for nonexistent token");

        return cards[tokenId].URI;
    }


    /**
     * @dev See {INewScrolls-approve}.
     */
    function approve(address to, uint256 tokenId) public virtual override {
        address owner = NewScrolls.ownerOf(tokenId);
        require(to != owner, "NewScrolls: approval to current owner");

        require(_msgSender() == owner || NewScrolls.isApprovedForAll(owner, _msgSender()),
            "NewScrolls: approve caller is not owner nor approved for all"
        );

        _approve(to, tokenId);
    }

    /**
     * @dev See {INewScrolls-getApproved}.
     */
    function getApproved(uint256 tokenId) public view virtual override returns (address) {
        require(_exists(tokenId), "NewScrolls: approved query for nonexistent token");

        return _tokenApprovals[tokenId];
    }

    /**
     * @dev See {INewScrolls-setApprovalForAll}.
     */
    function setApprovalForAll(address operator, bool approved) public virtual override {
        require(operator != _msgSender(), "NewScrolls: approve to caller");

        _operatorApprovals[_msgSender()][operator] = approved;
        emit ApprovalForAll(_msgSender(), operator, approved);
    }

    /**
     * @dev See {INewScrolls-isApprovedForAll}.
     */
    function isApprovedForAll(address owner, address operator) public view virtual override returns (bool) {
        return _operatorApprovals[owner][operator];
    }

    /**
     * @dev See {INewScrolls-transferFrom}.
     */
    function transferFrom(address from, address to, uint256 tokenId) public virtual override {
        //solhint-disable-next-line max-line-length
        require(_isApprovedOrOwner(_msgSender(), tokenId), "NewScrolls: transfer caller is not owner nor approved");

        _transfer(from, to, tokenId);
    }

    /**
     * @dev See {INewScrolls-safeTransferFrom}.
     */
    function safeTransferFrom(address from, address to, uint256 tokenId) public virtual override {
        safeTransferFrom(from, to, tokenId, "");
    }

    /**
     * @dev See {INewScrolls-safeTransferFrom}.
     */
    function safeTransferFrom(address from, address to, uint256 tokenId, bytes memory _data) public virtual override {
        require(_isApprovedOrOwner(_msgSender(), tokenId), "NewScrolls: transfer caller is not owner nor approved");
        _safeTransfer(from, to, tokenId, _data);
    }

    /**
     * @dev Safely transfers `tokenId` token from `from` to `to`, checking first that contract recipients
     * are aware of the NewScrolls protocol to prevent tokens from being forever locked.
     *
     * `_data` is additional data, it has no specified format and it is sent in call to `to`.
     *
     * This internal function is equivalent to {safeTransferFrom}, and can be used to e.g.
     * implement alternative mechanisms to perform token transfer, such as signature-based.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must exist and be owned by `from`.
     * - If `to` refers to a smart contract, it must implement {INewScrollsReceiver-onNewScrollsReceived}, which is called upon a safe transfer.
     *
     * Emits a {Transfer} event.
     */
    function _safeTransfer(address from, address to, uint256 tokenId, bytes memory _data) internal virtual {
        _transfer(from, to, tokenId);
        require(_checkOnNewScrollsReceived(from, to, tokenId, _data), "NewScrolls: transfer to non NewScrollsReceiver implementer");
    }

    /**
     * @dev Returns whether `tokenId` exists.
     *
     * Tokens can be managed by their owner or approved accounts via {approve} or {setApprovalForAll}.
     *
     * Tokens start existing when they are minted (`_mint`),
     * and stop existing when they are burned (`_burn`).
     */
    function _exists(uint256 tokenId) internal view virtual returns (bool) {
        return _owners[tokenId] != address(0);
    }

    /**
     * @dev Returns whether `spender` is allowed to manage `tokenId`.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function _isApprovedOrOwner(address spender, uint256 tokenId) internal view virtual returns (bool) {
        require(_exists(tokenId), "NewScrolls: operator query for nonexistent token");
        address owner = NewScrolls.ownerOf(tokenId);
        return (spender == owner || getApproved(tokenId) == spender || NewScrolls.isApprovedForAll(owner, spender));
    }

    /**
     * @dev Safely mints `tokenId` and transfers it to `to`.
     *
     * Requirements:
     *
     * - `tokenId` must not exist.
     * - If `to` refers to a smart contract, it must implement {INewScrollsReceiver-onNewScrollsReceived}, which is called upon a safe transfer.
     *
     * Emits a {Transfer} event.
     */
    function _safeMint(address to, uint256 tokenId) internal virtual {
        _safeMint(to, tokenId, "");
    }

    /**
     * @dev Same as {xref-NewScrolls-_safeMint-address-uint256-}[`_safeMint`], with an additional `data` parameter which is
     * forwarded in {INewScrollsReceiver-onNewScrollsReceived} to contract recipients.
     */
    function _safeMint(address to, uint256 tokenId, bytes memory _data) internal virtual {
        _mint(to, tokenId);
        require(_checkOnNewScrollsReceived(address(0), to, tokenId, _data), "NewScrolls: transfer to non NewScrollsReceiver implementer");
    }

    /**
     * @dev Mints `tokenId` and transfers it to `to`.
     *
     * WARNING: Usage of this method is discouraged, use {_safeMint} whenever possible
     *
     * Requirements:
     *
     * - `tokenId` must not exist.
     * - `to` cannot be the zero address.
     *
     * Emits a {Transfer} event.
     */
    event Mint(address to, uint tokenID);
    function _mint(address to, uint256 tokenId) internal virtual {
        require(to != address(0));
        require(!_exists(tokenId));
        _balances[to] += 1;
        _owners[tokenId] = to;

        emit Mint(to, tokenId);
    }

    /**
     * @dev Destroys `tokenId`.
     * The approval is cleared when the token is burned.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     *
     * Emits a {Transfer} event.
     */
    function _burn(uint256 tokenId) internal virtual {
        address owner = NewScrolls.ownerOf(tokenId);


        // Clear approvals
        _approve(address(0), tokenId);

        _balances[owner] -= 1;
        delete _owners[tokenId];

        emit Transfer(owner, address(0), tokenId);
    }

    /**
     * @dev Transfers `tokenId` from `from` to `to`.
     *  As opposed to {transferFrom}, this imposes no restrictions on msg.sender.
     *
     * Requirements:
     *
     * - `to` cannot be the zero address.
     * - `tokenId` token must be owned by `from`.
     *
     * Emits a {Transfer} event.
     */
    function _transfer(address from, address to, uint256 tokenId) internal virtual {
        require(NewScrolls.ownerOf(tokenId) == from, "NewScrolls: transfer of token that is not own");
        require(to != address(0), "NewScrolls: transfer to the zero address");

        // Clear approvals from the previous owner
        _approve(address(0), tokenId);

        _balances[from] -= 1;
        _balances[to] += 1;
        _owners[tokenId] = to;
        uint _weight = cards[tokenId].weight;
        removeShares(from, _weight);
        addShares(to, _weight);

        emit Transfer(from, to, tokenId);
    }

    /**
     * @dev Approve `to` to operate on `tokenId`
     *
     * Emits a {Approval} event.
     */
    function _approve(address to, uint256 tokenId) internal virtual {
        _tokenApprovals[tokenId] = to;
        emit Approval(NewScrolls.ownerOf(tokenId), to, tokenId);
    }

    /**
     * @dev Internal function to invoke {INewScrollsReceiver-onNewScrollsReceived} on a target address.
     * The call is not executed if the target address is not a contract.
     *
     * @param from address representing the previous owner of the given token ID
     * @param to target address that will receive the tokens
     * @param tokenId uint256 ID of the token to be transferred
     * @param _data bytes optional data to send along with the call
     * @return bool whether the call correctly returned the expected magic value
     */
    function _checkOnNewScrollsReceived(address from, address to, uint256 tokenId, bytes memory _data)
        private returns (bool)
    {
        if (to.isContract()) {
            INewScrollsReceiver(to).onNewScrollsReceived(from, tokenId, _data);
        }
        return true;
    }
}

abstract contract Oracle{
    function fileRequestTicket(uint8 returnType, bool subjective) external virtual payable returns(uint ticketID);
    function getFee() public virtual view returns(uint txCoverageFee, uint serviceFee);
}

abstract contract RedBalloon{
    function buy(address _gateway, uint _red, uint _green, uint _blue) public virtual payable returns(uint createdPiZZa);
}


abstract contract Pyramid{
    function transfer(address _to, uint256 _value) public virtual returns (bool);
}