// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC20 {
    event Transfer(address indexed from, address indexed to, uint256 value);
    
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
    
    function totalSupply() external view returns (uint256);
    
    function balanceOf(address account) external view returns (uint256);
    
    function transfer(address to, uint256 value) external returns (bool);
    
    function allowance(
        address owner,
        address spender
    ) external view returns (uint256);
    
    function approve(address spender, uint256 value) external returns (bool);

    function transferFrom(
        address from,
        address to,
        uint256 value
    ) external returns (bool);
}

contract MyERC20 is IERC20 {
  mapping (address account=>uint) private _balances;
  mapping (address account=>mapping (address spender=>uint)) private _allowances; // 保存 spender 可操作 account的代币额度

  uint256 private _totalSupply;

  address public Owner;

  event Log(uint256);

  constructor() {
    Owner = msg.sender;
  }

  modifier onlyOwner {
    require(Owner == msg.sender, "Only owner");
    _;
  }
  function totalSupply() public view returns (uint256) {
    return _totalSupply;
  }

  function balanceOf(address account) public view returns (uint256) {
    return _balances[account];
  }

  function transfer(address to, uint256 value) public returns (bool) {
    require(_balances[msg.sender] >= value);
    _balances[msg.sender]-=value;
    _balances[to]+=value;
    emit Transfer(msg.sender, to, value);
    return true;
  }

  function allowance(address owner, address spender) public view returns (uint256) {
    return _allowances[owner][spender];
  }

  // A 向 B 授权操作 A 的代币，授权人是 A 自己
  function approve(address spender, uint256 value) public returns (bool) {
    _allowances[msg.sender][spender] = value; // 授权人是自己
    emit Approval(msg.sender, spender, value);
    return true;
  }

  // B 操作 A 向自己授权的 value 额度的代币，to C
  function transferFrom(address from, address to, uint256 value) public returns (bool) {
    require(_allowances[from][msg.sender] >= value, "insufficient allowance");
    _allowances[from][msg.sender] -= value; // 减少 msg.sender 可操作 from 代币的额度
    _balances[from]-=value;
    _balances[to]+=value;
    emit Transfer(from, to, value);
    return true;
  }

  function mint(address account, uint256 value) public onlyOwner {
    _totalSupply+=value;
    _balances[account]+=value;
    emit Transfer(address(0), account, value);
  }
}