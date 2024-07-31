// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";

contract FundMeTest is Test {
    uint256 n = 1;

    function setUp() external {
        n = 2;
    }

    function testDemo() public view {
        console.log(n);
        console.log(n);
        console.log(n);
        assertEq(n, 2);
    }
}
