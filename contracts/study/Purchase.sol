pragma solidity >=0.4.22 <0.7.0;

//秘密的远程购买合约
contract Purchase {
    uint public value;
    address payable public seller;
    address payable public buyer;

    enum State { Created, Locked, Release, Inactive }

    State public state;

    modifier condition(bool _condition) {
        require(_condition);
        _;
    }

    modifier onlyBuyer() {
        require(
            msg.sender == buyer,
            "Only buyer can call this."
        );
        _;
    }

    modifier onlySeller() {
        require(
            msg.sender == seller,
            "Only seller can call this."
        );
        _;
    }

    modifier inState(State _state) {
        require(
            state == _state,
            "Invalid state."
        );
        _;
    }
    // 终止
    event Aborted();
    //采购确认
    event PurchaseConfirmed();
    //收到的项目
    event ItemReceived();
    // 卖方退款
    event SellerRefunded();

    //确保 `msg.value` 是一个偶数。
    //如果它是一个奇数，则它将被截断。
    //通过乘法检查它不是奇数。
    constructor() public payable {
        seller = msg.sender;
        value = msg.value / 2;
        require((2 * value) == msg.value, "Value has to be even.");
    }

    ///中止购买并回收以太币。
    ///只能在合约被锁定之前由卖家调用。
    function abort() public onlySeller inState(State.Created) {
        emit Aborted();
        state = State.Inactive;
        seller.transfer(address(this).balance);
    }

    /// 买家确认购买。
    /// 交易必须包含 `2 * value` 个以太币。
    /// 以太币会被锁定，直到 confirmReceived 被调用。
    function confirmPurchase() public inState(State.Created) condition(msg.value == (2 * value)) payable {
        emit PurchaseConfirmed();
        buyer = msg.sender;
        state = State.Locked;
    }

    /// 确认你（买家）已经收到商品。
    /// 这会释放被锁定的以太币。
    function confirmReceived() public onlyBuyer inState(State.Locked) {
        emit ItemReceived();

        // 首先改变状态，否可能会被重复调用
        state = State.Release;

        buyer.transfer(value);
    }

    /// This function refunds the seller, i.e.
    /// pays back the locked funds of the seller.
    function refundSeller() public onlySeller inState(State.Release) {
        emit SellerRefunded();
        // It is important to change the state first because
        // otherwise, the contracts called using `send` below
        // can call in again here.
        state = State.Inactive;

        seller.transfer(3 * value);
    }
}