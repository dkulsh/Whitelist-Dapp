//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Whitelist {

    mapping(address => bool) public whitelistedAddresses;

    uint8 public maxWhitelistedAddresses;

    uint8 public numAddressesWhitelisted;

    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    function addAddressToWhitelist() public {

        require(! whitelistedAddresses[msg.sender], "Sender is already whitelisted");

        require(numAddressesWhitelisted < maxWhitelistedAddresses, "Limit reached. More addresses cannot be whitelisted");

        whitelistedAddresses[msg.sender] = true;

        numAddressesWhitelisted += 1;

    }
}