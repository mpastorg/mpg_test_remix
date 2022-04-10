// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import "remix_tests.sol"; // this import is automatically injected by Remix.
import "../contracts/2_Owner.sol";

contract OwnerTest {
   
   
    Owner ownerToTest;
    address testOwner;

    function beforeAll () public {
        ownerToTest = new Owner();
        testOwner = msg.sender;
        Assert.equal(ownerToTest.getOwner(), testOwner, "owner is not assigned");
    }
    
    function checkOwnerSet () public {
        address internalOwner = 0xea4D61878315580576e141BE4D279719e96b8bE6; 

        ownerToTest.changeOwner(internalOwner);            
    
        Assert.equal(ownerToTest.getOwner(), internalOwner, "owner doesn't match");
        ownerToTest.setDefaultOwner();
    }
}
