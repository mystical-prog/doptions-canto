// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "forge-std/console.sol";
import "../src/primary/Factory.sol";

contract NewFactory is Script {
    function setUp() public {}

    function run() public {
        uint privateKey = vm.envUint("DEV_PRIVATE_KEY");

        vm.startBroadcast(privateKey);
        OptionsFactory factory = new OptionsFactory(0x03F734Bd9847575fDbE9bEaDDf9C166F880B5E5f);
        vm.stopBroadcast();
    }
}