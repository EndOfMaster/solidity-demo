// SPDX-License-Identifier: MIT

pragma solidity ^0.6.8;

/**
*   https://github.com/ethereum/EIPs/issues/20
*/
interface IERC20 {

    //总量
    function totalSupply() constant returns (uint256 totalSupply);

    //某用户的余额
    function balanceOf(address _owner) constant returns (uint256 balance);

    //转账
    function transfer(address _to, uint256 _value) returns (bool success);

    //和approve完成委托交易，a使用approve委托多少coin然后，b帮a用这个方法卖给c
    function transferFrom(address _from, address _to, uint256 _value) returns (bool success);

    function approve(address _spender, uint256 _value) returns (bool success);

    //查询a委托到b多少coin
    function allowance(address _owner, address _spender) constant returns (uint256 remaining);

    //交易通知
    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    //委托通知
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}