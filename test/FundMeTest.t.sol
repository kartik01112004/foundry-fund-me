// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundMeTest is Test {
    uint256 n = 1;
    FundMe fundMe; // declaring in whole contract

    function setUp() external {
        fundMe = new FundMe();
    }

    function testMinDollerIsFive() public view {
        assertEq(fundMe.MINIMUM_USD(), 5e18);
    }

    function testOwnerIsMessageSender() public view {
        assertEq(fundMe.i_owner(), address(this));
    }
}
