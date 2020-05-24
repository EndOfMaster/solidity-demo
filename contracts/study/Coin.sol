pragma solidity  >=0.5.0 <0.7.0;

contract Coin {
    // 关键字“public”让这些变量可以从外部读取，会自动添加一个get的方法
    //function minter() external view returns (address) { return minter; }
    address public minter;

    /**mapping可以看做是一个哈希表，他会执行虚拟初始化
    而public修饰的mapping自从创建的getter函数
    function balances(address _account) external view returns (uint) {
        return balances[_account];
    }
    */
    mapping (address => uint) public balances;

    // 轻客户端可以通过事件针对变化作出高效的反应
    //声明了事件，它会在send函数的最后一行被发出，用户界面或者服务器应用可以监听区块链正在发送的事件，而不会花费太多成本
    event Sent(address from, address to, uint amount);

    // 这是构造函数，只有当合约创建时运行
    //这个是真正的创建，就是发布代码的那个人
    constructor() public {
        minter = msg.sender;
    }

    //好像是无成本赠送？
    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        require(amount < 1e60);
        balances[receiver] += amount;
    }

    function send(address receiver, uint amount) public {
        require(amount <= balances[msg.sender], "Insufficient balance.");
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }
}