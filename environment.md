### Ganache
一个基于内存实现的Ethereum节点，通常用于测试和调试。
#### 安装
npm install -g ganache-cli
#### 运行
ganache-cli

### Truffle
Truffle是一个支持多Ethereum网络部署的工具，包含编译、测试。
#### 初始化
truffle init
#### 编译
truffle compile

> 只会编译和上次有变化的文件，如果需要编译所有要加上'--all'

#### 部署
truffle migrate
> 如果是以前部署成功，需要加'--reset'重新部署

#### 注意事项
1. 一定要有构造！类似：
```
constructor() public {
        owner = msg.sender;
}
```
#### 互动
truffle console

如下是创建了一个名为contract的对象，可以后续使用
```
HelloWorld.deployed().then(instance => contract = instance)
```
但是这样也能直接使用：

```
HelloWorld.deployed().then(instance => instance.helloWorld.call())
```
.exit退出console