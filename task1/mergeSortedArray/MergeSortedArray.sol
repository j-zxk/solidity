// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MergeSortedArray {
  function mergeSortedArray(int[] memory arr1, int[] memory arr2) public returns(int[] memory) {
    uint len = arr1.length + arr2.length;
    int[] arr3 = new int[](len);
    uint i = 0;
    uint j = 0;
    uint k = 0;

    while (i < arr1.length && j < arr2.length) {
      if (arr1[i] < arr2[j]) 
        arr3[k] = arr1[i];
        i++;
        k++;
      else 
        arr3[k] = arr2[j];
        j++;
        k++;
    }

    while (i < arr1.length) {
      arr3[k] = arr1[i];
      i++;
      k++;
    }

    while (j < arr2.length) {
      arr3[k] = arr2[j];
      j++;
      k++;
    }

    return arr3;
  }
}