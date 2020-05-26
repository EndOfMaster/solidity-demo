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

#### indexed
事件参数中加入indexed，在监听者处可以过滤参数
``` sol
event Transfer(address indexed _from, address indexed _to, uint256 _value);
```
``` js
let filter = this.contract_instance.filters.Transfer(this.active_wallet.address, null，null);
            this.contract_instance.on(filter, (from, to, value, event) => {
                console.log("监听发送以太坊事件:");
                console.log(`from:${from}+to:${to}+value:${value}`);
```

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
目前需要注意的是，定长的 内存memory 数组并不能赋值给变长的 内存memory 数组，这一行引发了一个类型错误，因为 unint[3] memory不能转换成 uint[] memory。
#### event
声明事件
#### emit
触发事件
#### modifier
函数修饰器，使用 modifier 可以更便捷的校验函数的入参。
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
#### private
完全只能本合约调用，继承的合约都无法调用
## 杂项
#### msg.sender
当前用户的公钥
#### require
验证判断
#### 位移
```sol
不管 x 正还是负，x << y 相当于 x * 2 ** y。
如果 x 为正值，x >> y 相当于 x / 2 ** y。
如果 x 为负值，x >> y 相当于 (x + 1) / 2**y - 1 (与将 x 除以 2**y 同时向负无穷大四舍五入)。
在所有情况下，通过负值的 y 进行移位会引发运行时异常。
```
#### 函数的格式
```sol
function (<parameter types>) {internal|external} [pure|constant|view|payable] [returns (<return types>)]
```
#### eth货币单位
默认为wei<br>
1 wei == 1 <br>
1 szabo == 1e12<br>
1 finney == 1e15<br>
1 ether == 1e18<br>
#### 时间单位
1 == 1 seconds<br>
1 minutes == 60 seconds<br>
1 hours == 60 minutes<br>
1 days == 24 hours<br>
1 weeks == 7 days<br>
