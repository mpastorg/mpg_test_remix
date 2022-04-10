// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import "remix_tests.sol"; // this import is automatically injected by Remix.
import "../contracts/1_Storage.sol";

contract StorageTest {
   
    bytes32[] proposalNames;
   
    Storage storageToTest;
    function beforeAll () public {
        storageToTest = new Storage();
    }
    
    function checkStorageStore () public {
        storageToTest.store(666);
        Assert.equal(storageToTest.retrieve(), uint(666), "number should be 666");
    }
}
