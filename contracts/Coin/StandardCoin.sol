pragma solidity ^0.4.22;


import "./Coin.sol";

/**
 * @title StandardCoin
 */
contract StandardCoin is Coin {
    string private _name;
    string private _symbol;
    uint8 private _decimals;

    constructor (string memory name, string memory symbol, uint8 decimals, uint256 initialSupply, address issuer) public {
        _name = name;
        _symbol = symbol;
        _decimals = decimals;

        _mint(issuer, initialSupply);
    }

    /**
     * @return the name of the token.
     */
    function name() public view returns (string memory) {
        return _name;
    }

    /**
     * @return the symbol of the token.
     */
    function symbol() public view returns (string memory) {
        return _symbol;
    }

    /**
     * @return the number of decimals of the token.
     */
    function decimals() public view returns (uint8) {
        return _decimals;
    }
}
