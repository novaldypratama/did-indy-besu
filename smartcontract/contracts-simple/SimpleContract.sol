// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract SimpleContract {
  mapping(string => int) private accounts;

  function open(string memory acc_id, int amount) public {
    accounts[acc_id] = amount;
  }

  function query(string memory acc_id) public view returns (int amount) {
    amount = accounts[acc_id];
  }

  function transfer(string memory acc_from, string memory acc_to, int amount) public {
    accounts[acc_from] -= amount;
    accounts[acc_to] += amount;
  }
}
