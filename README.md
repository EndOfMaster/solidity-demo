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


## 杂项
#### msg.sender
当前用户的公钥
#### require
验证判断

