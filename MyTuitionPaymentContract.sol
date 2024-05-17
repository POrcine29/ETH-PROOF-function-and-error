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
