// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;


contract Whitelist {

    // Max number of whitelisted addresses allowed
    uint8 public maxWhitelistedAddresses;

    // Create a mapping of whitelistedAddresses
    // if an address is whitelisted, we would set it to true, it is false by default for all other addresses
    mapping(address => bool) public whitelistedAddresses;

    // keep track of how many addresses have been whitelisted
    uint8 public numAddressesWhitelisted;

    // Setting the Max number of whitelisted addresses
    // User will put the value at the time of deployment
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses =  _maxWhitelistedAddresses;
    }

    /**
        addAddressToWhitelist - This function adds the address of the sender to the
        whitelist
     */
    function addAddressToWhitelist() public {
        // check if user already whitelisted
        require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");
        // check if numAddressesWhitelisted < maxWhitelistedAddresses, if not throw error
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "More addresses cant be added, limit reached");
        // Add address which called the function to the whitelistedAddress array
        whitelistedAddresses[msg.sender] = true;
        // Increment number of whitelisted addresses
        numAddressesWhitelisted += 1;
    }

}