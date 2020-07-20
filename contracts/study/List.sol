pragma solidity ^0.6.8;

contract List {

    address[] private list = new address[](1);

    mapping(address => uint256) private _index;

    //    constructor() public{
    //        list.push(address(0));
    //    }

    function get() public view returns (address[] memory){
        return list;
    }

    function add(address ace) public {
        _index[ace] = list.length;
        list.push(ace);
    }

    function sub(address ace) public {
        uint256 index = _index[ace];
        if (index != 0) {
            delete list[index];
            delete _index[ace];
            list.pop();
        }
    }

    function getKong(address ace) public view returns (uint256){
        return _index[ace];
    }

    function getLength() public view returns (uint256){
        return list.length;
    }

}