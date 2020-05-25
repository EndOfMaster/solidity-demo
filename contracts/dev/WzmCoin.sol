pragma solidity ^0.6.8;

contract WzmCoin {

    mapping(address => uint256) private balances;

    function addMoney() public payable {
        balances[msg.sender] += msg.value;
    }

    modifier hasMoney(uint money) {
        //这里不是true触发，而是false，语义应该是应该怎么样，否则。。
        require(balances[msg.sender] > money, "not have this money");
        _;
    }

    function getMoney(uint256 money) public payable hasMoney(money){
        balances[msg.sender] -= money;
        msg.sender.transfer(money);
    }

    function transfer(address payable to, uint256 money) public payable hasMoney(money) {
        balances[msg.sender] -= money;
        balances[to] += money;
    }

    function showMoney() view public returns (uint256 money){
        return balances[msg.sender];
    }

}
