// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract FundMe {
  address public owner;

  struct Funder {
    address sender;
    uint256 value;
  }
  Funder[] public funders;

  constructor() public {
    owner = msg.sender;
  }

  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  function withdraw() public payable onlyOwner {
    payable(msg.sender).transfer(address(this).balance);

    delete funders;
  }

  function fund() public payable {
    require(msg.value == 100000000000000000);
    funders.push(Funder({sender: msg.sender, value: msg.value}));
  }
}
