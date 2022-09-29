/**
* @type import('hardhat/config').HardhatUserConfig
*/

require('dotenv').config();
require("@nomiclabs/hardhat-ethers");

const { ALCHEMY_KEY, ACCOUNT_PRIVATE_KEY } = process.env;

const INFURA_URL = "https://rinkeby.infura.io/v3/05ef08be7bec4c9eb35821bd02018d19";
const KOVAN_URL = "https://kovan.infura.io/v3/ba63b223746842d89619ef053b179319";
const GOERLI_URL = "https://eth-goerli.alchemyapi.io/v2/";

module.exports = {
  solidity: "0.8.1",
  networks: {
    goerli: {
      url: `${GOERLI_URL}${ALCHEMY_KEY}`,
      accounts: [`0x${ACCOUNT_PRIVATE_KEY}`]
    }
  }
};