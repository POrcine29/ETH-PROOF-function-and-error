# ETH-PROOF-function-and-error

In Solidity (the programming language for Ethereum smart contracts), developers use functions to define the behavior of their contracts. These functions play a crucial role in ensuring the correctness and security of the contract code. 

## Description

To summarize these features, before running the remaining contract code, the need function should be used to verify user input or the status of the contract. When looking for internal mistakes in the contract code that shouldn't happen, one should utilize the assert method. If a condition is not satisfied, the revert function should be used to reverse the transaction, as it offers greater flexibility in addressing errors.

## Getting Started

### Executing program

Open your web browser and navigate to Remix IDE. 

https://remix.ethereum.org/

Click on the file icon in the File Explorer tab to create a new file and name it `MySimpleContract.sol`.

```solidity
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
```


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
