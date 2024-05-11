# ETH-PROOF-function-and-error

In Solidity (the programming language for Ethereum smart contracts), developers use functions to define the behavior of their contracts. These functions play a crucial role in ensuring the correctness and security of the contract code. 

## Description

To summarize these features, before running the remaining contract code, the need function should be used to verify user input or the status of the contract. When looking for internal mistakes in the contract code that shouldn't happen, one should utilize the assert method. If a condition is not satisfied, the revert function should be used to reverse the transaction, as it offers greater flexibility in addressing errors.

## Getting Started

### Executing program

Open your web browser and navigate to Remix IDE. 

Click on the file icon in the File Explorer tab to create a new file and name it MySimpleContract.sol







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

Compile the contract using the Editor's active tab, which is the contract mentioned above.
Pressing Ctrl + S will quickly compile. In addition, you can compile by right-clicking a file in the File Explorer, clicking the play button at the top of the Editor, or by visiting the Solidity compiler and selecting the compile button.

Click the Deploy and Run Transactions Icon on the left side menu.

Choose REMIX VM (Cancun) as your environment.

Click your deployed contracts

Once to click the deployed contracts set the new value

Once to set your new value click the owner and the value to call and see if the transaction is successful

## Authors

Orcine,Poliana J.

8210778@ntc.edu.ph
