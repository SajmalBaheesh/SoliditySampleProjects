mkdir EthPublic
openssl rand -hex 32 |tr -d "\n" > jwtsecret.hex
Create config.toml

1. `network="GOERLI"`: Specifies the network identifier for the Besu client. In this case, it is set to "GOERLI," 
indicating that the client is configured to connect to the Goerli test network.

2. `data-path="./data"`: Defines the path where Besu will store its data, including the blockchain data, key 
stores, and other related information. In this case, it is set to "./data," indicating that the data will be 
stored in the "data" directory relative to the Besu execution location.

3. `rpc-http-enabled=true`: Enables the HTTP-RPC (Remote Procedure Call) server, allowing remote clients to 
interact with the Besu client using HTTP-based requests.

4. `rpc-http-host="0.0.0.0"`: Specifies the network interface on which the HTTP-RPC server will listen for 
incoming connections. Setting it to "0.0.0.0" means it will listen on all available network interfaces.

5. `rpc-http-cors-origins=["*"]`: Configures Cross-Origin Resource Sharing (CORS) origins for the HTTP-RPC 
server. In this case, it allows requests from any origin by using the wildcard "*" value.

6. `rpc-ws-enabled=true`: Enables the WebSocket-RPC server, allowing remote clients to interact with the 
Besu client using WebSocket-based connections.

7. `rpc-ws-host="0.0.0.0"`: Specifies the network interface on which the WebSocket-RPC server will listen for 
incoming connections. Similar to the HTTP-RPC server, it is set to listen on all available network interfaces.

8. `engine-host-allowlist=["*"]`: Specifies the list of IP addresses or hostnames that are allowed to connect to
 the Besu engine. In this case, using the wildcard "*" value allows connections from any IP address or hostname.

9. `engine-rpc-enabled=true`: Enables the RPC (Remote Procedure Call) API for interacting with the Besu engine, 
providing additional control and monitoring capabilities.

10. `engine-jwt-secret="./jwtsecret.hex"`: Specifies the file path to the secret key used for JSON Web Token (JWT)
 authentication with the Besu engine. JWT can be used for securing and authenticating API requests to the engine.


Config.yaml -> Teku

The provided configuration snippet appears to be a sample configuration for Teku, an Ethereum 2.0 client developed
by ConsenSys. Let's go through each line to explain its purpose:

1. `network: "goerli"`: Specifies the network identifier for the Teku client. In this case, it is set to "goerli," 
indicating that the client is configured to connect to the Goerli test network.

2. `ee-endpoint: "http://localhost:8551"`: Specifies the endpoint URL for the Eth1 (Ethereum 1.x) JSON-RPC API. Teku 
requires an Eth1 endpoint for accessing Ethereum mainnet or testnet to fetch block data and interact with the Ethereum 
network.

3. `ee-jwt-secret-file: "./jwtsecret.hex"`: Specifies the file path to the secret key used for JSON Web Token (JWT) 
authentication with the Eth1 endpoint. JWT can be used for securing and authenticating API requests to the Eth1 
JSON-RPC API.

4. `metrics-enabled: true`: Enables the collection and reporting of metrics by Teku. Metrics provide insights into 
the performance and behavior of the client and can be used for monitoring and analysis purposes.

5. `rest-api-enabled: true`: Enables the REST API server in Teku, allowing remote clients to interact with the client
through HTTP-based requests. The REST API provides endpoints for various operations, including retrieving blockchain 
data, submitting transactions, and managing accounts.

Launch:
besu --config-file './config.toml'