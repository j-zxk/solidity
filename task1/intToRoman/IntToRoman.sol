// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IntToRoman {
  string[] private thousands = ["", "M", "MM", "MMM"];
  string[] private hundreds = ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"];
  string[] private tens = ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"];
  string[] private ones = ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"];

  function intToRoman(uint num) public view returns(string memory) {
    return string.concat(
      thousands[num / 1000], 
      hundreds[num % 1000 / 100], 
      tens[num % 100 / 10],
      ones[num % 10]
    );
  }
}