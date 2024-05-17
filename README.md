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

contract TuitionPayment {
    address public student;
    mapping(address => uint256) public studentBalances;
    uint256 public constant MAX_BALANCE = 500;

    constructor() {
        student = msg.sender;
    }

    function deposit(uint256 _amount) public payable {
        require(msg.sender == student, "Only the school admin can deposit");
        require(_amount > 0, "Deposit amount must be greater than 0");
        require(studentBalances[msg.sender] + _amount <= MAX_BALANCE, "Exceeds maximum balance");

        studentBalances[msg.sender] += _amount;

        // Assert that the total balance after depositing doesn't exceed the maximum balance
        assert(studentBalances[msg.sender] <= MAX_BALANCE);
    }

    function withdraw(uint256 _amount) public {
        require(_amount > 0, "Withdrawal amount must be greater than 0");
        require(studentBalances[msg.sender] >= _amount, "Insufficient balance");

        studentBalances[msg.sender] -= _amount;
        require(payable(msg.sender).send(_amount), "Payment failed");
    }

    function checkBalance(address _student) public view returns(uint256) {
        require(studentBalances[_student] > 0, "Student has no balance");
        return studentBalances[_student];
    }
}
```


Compile the contract using the Editor's active tab, which is the contract mentioned above.
Pressing Ctrl + S will quickly compile. In addition, you can compile by right-clicking a file in the File Explorer, clicking the play button at the top of the Editor, or by visiting the Solidity compiler and selecting the compile button.


Click the Deploy and Run Transactions Icon on the left side menu.


Choose REMIX VM (Cancun) as your environment.


Click your deployed contracts


Once to click the deployed contracts type of your amount that you want to deposit


Once to set your deposit amount type the amount that you want to withdraw 


And last is copy your address to the check balanceand click the call then click the max balance and student to call agin



## Authors

Orcine,Poliana J.

8210778@ntc.edu.ph
