const ethers = require('ethers');

const Apple = artifacts.require("./Apple.sol");
const Banana = artifacts.require("./Banana.sol");
const Coconut = artifacts.require("./Coconut.sol");
const Durian = artifacts.require("./Durian.sol");

const whiteAddress = [];

const executor = [];

module.exports = async function (deployer) {
  await deployer.deploy(Coconut, executor, whiteAddress);

  await Durian.deployed().then(async function () {
    whiteAddress.push(Durian.address);

    await deployer.deploy(Apple, executor, whiteAddress);
    await deployer.deploy(Banana, executor, whiteAddress);
    await deployer.deploy(Coconut, executor, whiteAddress);
  })
};
