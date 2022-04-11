// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import "remix_tests.sol"; // this import is automatically injected by Remix.
import "../contracts/5_SimpleAuction.sol";

contract SimpleAuctionTest {
   
    bytes32[] proposalNames;
   
    SimpleAuction SimpleAuctionToTest ;
    uint amount;
    address thisAddress;
    address AuctionAddress;

    function beforeAll () public {
        thisAddress = msg.sender;
        SimpleAuctionToTest = new SimpleAuction(100, payable(msg.sender));
        AuctionAddress = SimpleAuctionToTest.beneficiary.address;
        amount = 10;

    }
    
    function bidSmall () public {
        Assert.equal(msg.sender, thisAddress, "This contract address");
        Assert.equal(AuctionAddress, SimpleAuctionToTest.highestBidder.address, "Auction contract address");
        SimpleAuctionToTest.bid{value:100};
        Assert.equal(SimpleAuctionToTest.highestBid(), 100, "is not 10 the highest bid");        
        Assert.equal(SimpleAuctionToTest.highestBidder.address, thisAddress, "is not highest bidder");
    }
    
}
