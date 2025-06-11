// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 'abcd' -> 'dcba'
contract ReverseString {
  function reverseString(string memory str) public pure returns(string memory) {
    bytes memory _str = bytes(str);
    bytes memory _reverseStr = new bytes(_str.length);
    for (uint i = 0; i < _str.length; i++) {
      _reverseStr[i] = _str[_str.length - i - 1];
    }
    return string(_reverseStr);
  }
}