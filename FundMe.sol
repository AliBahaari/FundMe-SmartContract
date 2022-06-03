// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract FundMe {
  address public owner;

  mapping(address => uint256) public addressToValue;

  constructor() public {
    owner = msg.sender;
  }

  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  function withdraw() public payable onlyOwner {
    payable(msg.sender).transfer(address(this).balance);
  }

  function fund() public payable {
    require(msg.value == 100000000000000000);
    addressToValue[msg.sender] += msg.value;
  }

  function report(address _address) public view returns (uint256) {
    return addressToValue[_address];
  }
}
