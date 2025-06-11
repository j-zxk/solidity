const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");
module.exports = buildModule("MyERC20Module", (m) => {
  const MyERC20 = m.contract("MyERC20", []);
  return { MyERC20 };
})