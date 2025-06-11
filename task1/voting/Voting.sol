// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 一个mapping来存储候选人的得票数
// 一个vote函数，允许用户投票给某个候选人
// 一个getVotes函数，返回某个候选人的得票数
// 一个resetVotes函数，重置所有候选人的得票数

contract Voting {
  struct Candidate {
    uint id;
    uint voteCount;
  }

  mapping(uint => Candidate) public candidates;

  uint[] public candidateIds;

  function vote(uint _id) public {
    require(_id > 0, 'invalid id');
    candidates[_id].voteCount++;
    for (uint i = 0; i < candidateIds.length; i++) {
      if (candidateIds[i] == _id) return;
    }
    candidateIds.push(_id);
  }

  function getVotes(uint _id) public view returns (uint) {
    require(_id > 0, 'invalid id');
    return candidates[_id].voteCount;
  }

  function resetVotes() public {
    for (uint i = 0; i < candidateIds.length; i++) {
      candidates[candidateIds[i]].voteCount = 0;
    }
  }
}
