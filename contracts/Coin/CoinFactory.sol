///TODO
///Token ownership implementation
pragma solidity ^0.4.22;


import "./Factory.sol";
import "./StandardCoin.sol";


/// @title Coin factory - Allows creation of multiple coins
/// @author Haythem Sellami
contract CoinFactory is Factory {

    event Created(address coin_address, address indexed owner_address, uint256 time, string name);

    /**
     * @dev Allows creation of custom coin.
     * @param _name String for coin name.
     * @param _symbol String for coin symbol.
     * @return Returns coin address.
     */
    function create(string _name, string _symbol, uint8 _decimals, uint256 _supply) public returns (address tokenAddress) {
        coinAddress = new StandardCoin(_name, _symbol, ,_decimals, _supply, msg.sender);
        
        register(coinAddress);
        emit Created(coinAddress, msg.sender, now, _name);
    }

}