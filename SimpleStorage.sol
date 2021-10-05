// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract SimpleStorage {
    
    // this will get initialized to 0
    uint256 favoriteNumber;
    bool favoriteBol;
    
    struct People {
        uint256 favoriteNumber;
        string name;
    }
    
    People[] public people;
    mapping(string => uint256) public nameToFavoriteNumber;
    
    //store (executes a transaction and changes blockchain state, requires token fees to change blockchain state)
    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }
    
    // retrieve (calls a value, does not execute a transaction), view (to read a state from the blockchain, does not execute a transaction), pure (execute math functions, does not execute a transaction)
    function retrieve() public view returns (uint256) {
        return favoriteNumber;
    }
    
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People( _favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
        
    }
}
