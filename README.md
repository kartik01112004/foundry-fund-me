## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

- **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
- **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
- **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
- **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```

This is a Solidity contract named FundMe that allows users to fund the contract with Ether (ETH) and allows the contract owner to withdraw the funds. The contract uses the Chainlink price feed to convert the ETH amount to USD.

Importing Dependencies

The contract imports two dependencies:

AggregatorV3Interface from @chainlink/contracts: This interface provides a way to interact with the Chainlink price feed.
PriceConverter from ./PriceConverter.sol: This contract is not shown in the code snippet, but it's likely a custom contract that provides a function to convert ETH to USD using the Chainlink price feed.
Contract Variables

The contract has several variables:

addressToAmountFunded: A mapping of addresses to the amount of ETH they have funded.
funders: An array of addresses that have funded the contract.
i_owner: The address of the contract owner, set to the deployer of the contract.
MINIMUM_USD: A constant representing the minimum amount of USD required to fund the contract (5 USD).
Constructor

The constructor sets the i_owner variable to the deployer of the contract.

Functions

fund()
Allows users to fund the contract with ETH.
Requires that the amount of ETH sent is greater than or equal to the minimum USD amount (5 USD).
Updates the addressToAmountFunded mapping and adds the sender to the funders array.
getVersion()
Returns the version of the Chainlink price feed.
withdraw()
Allows the contract owner to withdraw the funds.
Resets the addressToAmountFunded mapping and clears the funders array.
Uses the call function to send the contract's balance to the owner.
fallback() and receive()
These two functions are special functions in Solidity that are called when the contract receives Ether.
In this case, they both call the fund() function, allowing users to fund the contract by sending Ether directly to the contract.
Modifiers

The contract uses a modifier onlyOwner to restrict access to the withdraw function to only the contract owner.

Error Handling

The contract uses a custom error FundMe\_\_NotOwner to handle the case where a non-owner tries to call the withdraw function.

Overall, this contract provides a simple way for users to fund a contract with Ether and for the contract owner to withdraw the funds, while using the Chainlink price feed to convert the ETH amount to USD.

`forge test --mt testPriceFeedIsAccurate -vvv --fork-url $SEPOLIA_RPC_URL`

### Cheatcodes in foundry 

`expectRevert()` means that next line should fail and the test should pass

## Foundry Chisel

Write solidity in terminal

## Anvil gas price

its default to zero

setting gas price : `vm.txgasPrice(GAS_PRICE);`