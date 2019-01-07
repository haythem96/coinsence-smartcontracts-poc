pragma solidity ^0.4.22;


import "openzeppelin-solidity/contracts/utils/Address.sol";

contract Factory {

    /**
     * Events
     */
    event CoinInstantiation(address sender, address coinAddress);

    /**
     * Storage
     */
    mapping(address => bool) public isIssued;
    address[] public coins;

    constructor() public {
    }

    /**
     * @dev Get list of issued coins
     */
    function getCoins () public view returns (address[]){
        return coins;
    }

    /**
     * @dev Register coin address in factory registry
     * @param _coinAddress address of coin contract instantiation
     */
    function register(address _coinAddress) internal {
        require(Address.isContract(_coinAddress), "Address does not belong to a contract");
        isIssued[_coinAddress] = true;
        coins.push(_coinAddress);
        emit CoinInstantiation(msg.sender, _coinAddress);
    }
}
