// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RomanToInt {
  mapping (bytes1=>uint) romanMap;

  constructor() {
    romanMap['I'] = 1;
    romanMap['V'] = 5;
    romanMap['X'] = 10;
    romanMap['L'] = 50;
    romanMap['C'] = 100;
    romanMap['D'] = 500;
    romanMap['M'] = 1000;
  }

  // MMCDXI M + M - C + D + X + I
  function romanToInt(string memory str) public view returns(uint) {
    bytes memory _str = bytes(str);
    uint result = 0;
    for (uint i = 0; i < _str.length; i++) {
      if (i < _str.length - 1 && romanMap[_str[i]] < romanMap[_str[i + 1]]) result-=romanMap[_str[i]];
      else result+=romanMap[_str[i]];
    }
    return result;
  }
}