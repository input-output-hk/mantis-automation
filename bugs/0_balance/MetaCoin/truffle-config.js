module.exports = {
  // Uncommenting the defaults below 
  // provides for an easier quick-start with Ganache.
  // You can also follow this format for other networks;
  // see <http://truffleframework.com/docs/advanced/configuration>
  // for more details on how to specify configuration options!
  //
  networks: {
    sagano: {
      host: "127.0.0.1",
			port: 8546,
      network_id: "*",
			from: "0xa4713d6ab3ad3c77bee2156037e2d7953b45eafe",
			gas: 8000000,
			networkCheckTimeout: 60000,
    },
  }
};
