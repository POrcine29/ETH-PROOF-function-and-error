// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract SimpleContract {
    uint256 public value;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function setValue(uint256 _newValue) public {
        // Require: Ensures a condition is met before executing further.
        // Here, we require that the sender of the transaction is the owner of the contract.
        require(msg.sender == owner, "Only the owner can set the value");

        // Assert: Checks for internal errors and halts execution if conditions are not met.
        // Here, we assert that the new value is not zero.
        assert(_newValue != 0);

        // Revert: Reverts the transaction and rolls back state changes if conditions are not met.
        // Here, we revert if the new value is less than the current value.
        if (_newValue < value) {
            revert("New value must be greater than or equal to current value");
        }

        // If all conditions are met, update the value.
        value = _newValue;
    }
}
