pragma solidity >=0.4.21 <0.7.0;

import "@openzeppelin/contracts/ownership/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721Full.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721Mintable.sol";

contract Article is ERC721Full, Ownable {

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    //加密内容密钥
    string private key;

    constructor() ERC721Full("WejuaiArticle", "WJA") public {
    }

    function addArticle(address player, string memory tokenURI) public onlyOwner returns (uint256) {
        //增量
        _tokenIds.increment();
        //新长度
        uint256 newItemId = _tokenIds.current();
        //用于铸造新token的内部函数
        _mint(player, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }

}
