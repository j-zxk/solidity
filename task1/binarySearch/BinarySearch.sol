// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BinarySearch {
  // [2, 3, 4, 6, 9] 3
  function binarySearch (int[] memory arr, int target) public returns(int index) {
    uint left = 0;
    uint right = arr.length - 1;

    while (left <= right) {
      uint mid = (left + right) / 2;

      if (arr[mid] == target)
        return int(mid);
      if (arr[mid] > target)
        right = mid - 1;
      else 
        left = mid + 1;
    }

    return -1;
  } 
}