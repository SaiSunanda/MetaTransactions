// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@opengsn/contracts/src/BaseRelayRecipient.sol";

//Interface for NFT Meta Transactions
interface INFTMetaTx {
    function mint(uint256 id, uint256 amount) external;
}

// this contract is used as BaseRelayRecipient to using the GAS through GSN
contract NFTHandler is BaseRelayRecipient {
    address NFTMetaAddress;

    constructor(address _NFTMetaAddress, address _forwarder) {
        NFTMetaAddress = _NFTMetaAddress;
        _setTrustedForwarder(_forwarder);
    }

    // this Function Mints the NFT with NFT ID and total number of NFTs
    function mintNFTMetaTx(uint256 _id, uint256 _amount) public {
        INFTMetaTx(NFTMetaAddress).mint(_id, _amount);
    }

    // this is the function that specifies the GSN version
    function versionRecipient() external pure override returns (string memory) {
        return "2.0.0";
    }
}