

pragma solidity ^0.8.0;

contract DecentralizedLending {
    address public owner;

    // Create a mapping to store borrower's address and loan amount
    mapping(address => uint256) public borrowerLoans;

    // Create a mapping to store lender's address and loan amount
    mapping(address => uint256) public lenderLoans;

    constructor() public {
        owner = msg.sender;
    }

    // Function to allow lenders to lend assets
    function lend(address borrower, uint256 amount) public {
        require(amount > 0, "Loan amount must be greater than 0");

        lenderLoans[msg.sender] = lenderLoans[msg.sender].add(amount);
        borrowerLoans[borrower] = borrowerLoans[borrower].add(amount);
    }

    // Function to allow borrowers to repay loan
    function repay(address lender, uint256 amount) public {
        require(amount > 0, "Repayment amount must be greater than 0");

        lenderLoans[lender] = lenderLoans[lender].sub(amount);
        borrowerLoans[msg.sender] = borrowerLoans[msg.sender].sub(amount);
    }

}