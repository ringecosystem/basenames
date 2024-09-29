// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "forge-std/Test.sol";
import "forge-std/Script.sol";
import {NameEncoder} from "ens-contracts/utils/NameEncoder.sol";
import "../../src/util/Constants.sol";


contract ConstantsTest is Test {
	function test_constants() public {
        (bytes memory dnsName, bytes32 node) = NameEncoder.dnsEncodeName("ring-dao.eth");
        console.logBytes(dnsName);
        console.logBytes32(node);

        (dnsName, node) = NameEncoder.dnsEncodeName("8000002e.reverse");
        console.logBytes(dnsName);
        console.logBytes32(node);

        (dnsName, node) = NameEncoder.dnsEncodeName("eth");
        console.logBytes(dnsName);
        console.logBytes32(node);
	}
}
