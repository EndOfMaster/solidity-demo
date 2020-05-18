# 学习笔记
## 关键字
#### memory
值传递，默认为值传递，只会传递值，不同对象的后续变化都是独立的
#### storage
指针传递，多个对象指向同一内存地址，修改一个，同步修改
#### constructor
构造方法
#### view
函数可以被声明为view，在这种情况下，公共参数不能被修改，执行可以通过但是会报出warn但是并不会修改值
#### pure
编译就被报出错误
#### mapping 
map格式
mapping (address => uint) public balances
#### public
修饰的参数编译器会自动生成
``` sol
function minter() external view returns (address) { return minter; }
```
自己写一个的话会重复
#### struct
声明对象
#### payable
如果一个函数需要进行货币操作，必须要带上payable关键字，这样才能正常接收msg.value。

#### 数组
``` sol
struct Proposal {
        bytes32 name;   // 简称（最长32个字节）
        uint voteCount; // 得票数
}
Proposal[] public proposals;

// `Proposal({...})` 创建一个临时 Proposal 对象，
// `proposals.push(...)` 将其添加到 `proposals` 的末尾
proposals.push(Proposal({
    name : proposalNames[i],
    voteCount : 0
}));
```
#### event
声明事件
#### emit
触发事件
#### modifier
使用 modifier 可以更便捷的校验函数的入参。
新的函数体是由 modifier 本身的函数体，并用原函数体替换 `_;` 语句来组成的。
```sol
modifier onlyOwner() {
    require(msg.sender == owner);
    _;
} 
  
function hello() public onlyOwner returns(bool){
    return ture;
}
```
#### internal
修饰的function只能在合约内部和继承的合约内调用
## 杂项
#### msg.sender
当前用户的公钥
#### require
验证判断

