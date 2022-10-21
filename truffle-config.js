module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // for more about customizing your Truffle configuration!
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545, 
      network_id: "*" // Match any network id
    }
  },
  compilers: {
    solc: {
      version: '0.4.25',
      optimizer: {
        enabled: true,
        runs: 200
      }
    }
  }
};
module.exports = {
  // your existing config goes here
  // don't forget to put comma on the last element before proceeding to next line

  compilers: {
    solc: {
      version: "0.4.25"
    }
  }
};