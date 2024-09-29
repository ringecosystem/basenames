// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.23;

import "forge-std/Script.sol";
import {Registry} from "src/L2/Registry.sol";

contract DeployRegistry is Script {
    function run() external {
        address deployerAddress = msg.sender;
        vm.startBroadcast();

        Registry registry = new Registry(deployerAddress);
        console.log(address(registry));

        vm.stopBroadcast();
    }
}
