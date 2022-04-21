/**
 * Use this file to configure your truffle project. It's seeded with some
 * common settings for different networks and features like migrations,
 * compilation and testing. Uncomment the ones you need or modify
 * them to suit your project as necessary.
 *
 * More information about configuration can be found at:
 *
 * trufflesuite.com/docs/advanced/configuration
 *
 * To deploy via Infura you'll need a wallet provider (like @truffle/hdwallet-provider)
 * to sign your transactions before they're sent to a remote public node. Infura accounts
 * are available for free at: infura.io/register.
 *
 * You'll also need a mnemonic - the twelve word phrase the wallet uses to generate
 * public/private key pairs. If you're publishing your code to GitHub make sure you load this
 * phrase from a file you've .gitignored so it doesn't accidentally become public.
 *
 */

const HDWalletProvider = require("@truffle/hdwallet-provider");
const privateKey = "";  // Owner
module.exports = {
  /**
   * Networks define how you connect to your ethereum client and let you set the
   * defaults web3 uses to send transactions. If you don't specify one truffle
   * will spin up a development blockchain for you on port 9545 when you
   * run `develop` or `test`. You can ask a truffle command to use a specific
   * network from the command line, e.g
   *
   * $ truffle test --network <network-name>
   */

  networks: {
    // Useful for testing. The `development` name is special - truffle uses it by default
    // if it's defined here and no other network is specified at the command line.
    // You should run a client (like ganache-cli, geth or parity) in a separate terminal
    // tab if you use this network and you must also set the `host`, `port` and `network_id`
    // options below to some value.
    //
    development: {
      host: "127.0.0.1",     // Localhost (default: none)
      port: 8545,            // Standard Ethereum port (default: none)
      network_id: "*",       // Any network (default: none)
    },
    rinkeby: {
      provider: () =>
          new HDWalletProvider(
              privateKey, "https://rinkeby.infura.io/v3/9aa3d95b3bc440fa88ea12eaa4456161"
          ),
      network_id: "4", // Any network (default: none)
      gas: 12000000,
      gasPrice: 10000000000,
      skipDryRun: true,
      confirmations: 2
    },
    bsc: {
      provider: () => new HDWalletProvider(
        privateKey, `https://bsc-dataseed1.binance.org`
      ),
      network_id: "56", // Any network (default: none)
      gas: 12000000,
      gasPrice: 10000000000,
      skipDryRun: true,
      confirmations: 2
    },
    bsctest: {
      provider: () => new HDWalletProvider(
        privateKey, `https://data-seed-prebsc-1-s1.binance.org:8545`
      ),
      network_id: "97", // Any network (default: none)
      gas: 12000000,
      gasPrice: 10000000000,
      confirmations: 10,
      timeoutBlocks: 200
    }
  },

  // Set default mocha options here, use special reporters etc.
  mocha: {
    // timeout: 100000
  },

  plugins: [
    'truffle-plugin-verify',
    'truffle-contract-size'
  ],

  compilers: {
    solc: {
      version: "^0.8.0", // Fetch exact version from solc-bin (default: truffle's version)
      settings: {
        optimizer: {
          enabled: true,
          runs: 100,
        },
      },
    },
  },
};
