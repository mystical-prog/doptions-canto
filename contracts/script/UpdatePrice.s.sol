// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import {IPyth} from "@pythnetwork/pyth-sdk-solidity/IPyth.sol";

contract UpdatePrice is Script {
    function setUp() public {}

    function run() external {
        uint256 privateKey = vm.envUint("DEV_PRIVATE_KEY");
        vm.startBroadcast(privateKey);

        IPyth pyth = IPyth(vm.envAddress("PYTH_ADDRESS"));
        bytes[] memory priceUpdateArray = new bytes[](1);
        priceUpdateArray[0] = vm.envBytes("PRICE_UPDATE");

        uint fee = pyth.getUpdateFee(priceUpdateArray);
        pyth.updatePriceFeeds{value: fee}(priceUpdateArray);

        vm.stopBroadcast();
    }
}