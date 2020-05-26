// SPDX-License-Identifier: MIT

pragma solidity ^0.6.8;

contract WzmPiggyBank {

    mapping(address => uint256) private _balances;

    function addMoney() public payable {
        _balances[msg.sender] += msg.value;
    }

    modifier hasMoney(uint money) {
        //这里不是true触发，而是false，语义应该是应该怎么样，否则。。
        require(_balances[msg.sender] > money, "not have this money");
        _;
    }

    function getMoney(uint256 money) public payable hasMoney(money) {
        _balances[msg.sender] -= money;
        msg.sender.transfer(money);
    }

    function transfer(address payable to, uint256 money) public payable hasMoney(money) {
        _balances[msg.sender] -= money;
        _balances[to] += money;
    }

    function showMoney() public view returns (uint256 money){
        return _balances[msg.sender];
    }

}
