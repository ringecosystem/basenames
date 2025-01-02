// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.23;

import "forge-std/Script.sol";
import {Registry} from "src/L2/Registry.sol";
import "src/util/Constants.sol";

contract EstablishNamespace is Script {
    function run() external {
        address deployerAddress = msg.sender;
        vm.startBroadcast();

        address ensAddress = vm.envAddress("REGISTRY_ADDR"); // deployer-owned registry
        Registry registry = Registry(ensAddress);
        address baseRegistrar = vm.envAddress("BASE_REGISTRAR_ADDR");

        // establish the base.eth namespace
        bytes32 ethLabel = keccak256("eth");
        bytes32 baseLabel = keccak256("darwinia"); // basetest.eth is our sepolia test domain
        registry.setSubnodeOwner(0x0, ethLabel, deployerAddress);
        registry.setSubnodeOwner(ETH_NODE, baseLabel, baseRegistrar); // base registrar must own 2LD

        vm.stopBroadcast();
    }
}
