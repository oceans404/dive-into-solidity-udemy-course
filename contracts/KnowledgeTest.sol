//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract KnowledgeTest {
    // Add a public state variable of type address called owner
    address public owner;
    string[] public tokens = ["BTC", "ETH"];
    address[] public players;

    // Declare the constructor and initialize the owner variable in the constructor. The owner should be initialized with the address of the account that deploys the contract
    constructor() {
        owner = msg.sender;
    }

    function start() public {
        players.push(msg.sender);
    }

    function concatenate(string memory str1, string memory str2) public pure returns (string memory) {
        return string.concat(str1, str2);
    }

    function changeTokens() public  {
        // string[] memory t = tokens;
        tokens[0] = "VET";
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function transferAll(address payable transferAddress) external payable {
        require(msg.sender == owner, "ONLY_OWNER");
        transferAddress.transfer(getBalance());
    }

    receive() external payable {}
}
