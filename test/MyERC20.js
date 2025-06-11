const hre = require("hardhat");
const { expect } = require("chai");

describe("mytoken test", async() => {
  const { ethers } = hre;

  let MyTokenContract1, MyTokenContract2, MyTokenContract3;

  let account1, account2, account3;

  beforeEach(async() => {
    [account1, account2, account3] = await ethers.getSigners();

    const mytoken = await ethers.getContractFactory("MyERC20");

    MyTokenContract1 = await mytoken.connect(account1).deploy();
    MyTokenContract2 = await mytoken.connect(account2).deploy();
    MyTokenContract3 = await mytoken.connect(account3).deploy();

    // MyTokenContract.waitForDeployment();

    // const contractAddress = await MyTokenContract.getAddress();

    // expect(contractAddress).to.length.greaterThan(0);
  })

  it("测试增发代币", async() => {
    await MyTokenContract1.mint(account1, 1000);
    const balanceOfAccount1 = await MyTokenContract1.balanceOf(account1);

    expect(balanceOfAccount1).to.equal(1000);
  })

  it("测试转账", async() => {
    await MyTokenContract2.mint(account2, 1000);

    await MyTokenContract2.transfer(account1, 800);

    const balanceOfAccount2 = await MyTokenContract2.balanceOf(account2);

    expect(balanceOfAccount2).to.equal(200);
  })

  it("测试授权", async() => {
    await MyTokenContract1.approve(account2, 1000);

    const allowances = await MyTokenContract1.allowance(account1, account2);

    expect(allowances).to.equal(1000);
  })
})