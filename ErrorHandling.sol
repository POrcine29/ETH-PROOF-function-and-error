// SPDX-License-Identifier: MIT        
pragma solidity ^0.8.0;

contract Errorhandling {
    uint256 public totalValue;

    function setValue(uint256 _newValue) external {
        require(_newValue != 0, "New value must not be zero");

        if (_newValue > 100) {
            revert("New value must not exceed 100");
        }

        uint256 newValue = totalValue + _newValue;
        assert(newValue >= totalValue);

        totalValue = newValue;
    }

    function decrementValue(uint256 _decrement) external {
        require(_decrement <= totalValue, "Decrement cannot be greater than the total value.");
        
        uint256 newValue = totalValue - _decrement;
        totalValue = newValue;
    }

    function assertExample() external pure returns (bool) {
        // This assert will always pass, proving that it is used correctly.
        assert(1 == 1);
        return true;
    }
}          
