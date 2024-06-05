# Deploying a Contract on Fuel Sepolia Testnet

⚠︎ Use CODESPACE

## Preparation
- Download Fuel [Wallet](https://chromewebstore.google.com/detail/fuel-wallet/dldjpboieedgcmpkchcjcbijingjcgok)
- Claim [Faucet](https://faucet-testnet.fuel.network/) or [Bridge](https://app.fuel.network/bridge?from=eth&to=fuel) from ETH Sepolia

## Easy Setup

```bash
yes y | sudo apt-get update -y && sudo apt-get install git build-essential -y && git clone https://github.com/PrastianHD/Deploy-Fuel.git && cd Deploy-Fuel && chmod ug+x *.sh && ./setup.sh
```

## Import Wallet
```bash
forc wallet import
```
![logo](img/forc-wallet-import.png)

⚠︎ How to Paste in Codespace is `CTRL + SHIFT + V`

⚠︎ Enter mnemonic, invisible just enter after paste

⚠︎ Enter Password

## Create Account
```bash
forc wallet account new
```
![logo](img/forc-wallet-accounts.png)

## Check Adress
```
forc wallet accounts
```

## Deploy Contract
```bash
forc deploy --testnet
```
![logo](img/forc-deploy.png)

⚠︎ Make sure you have ETH Fuel Sepolia Testnet

⚠︎ Index = 0

⚠︎ Type `y` and `ENTER`

## CONTRACT DEPLOYED

Check In [Explorer](https://app.fuel.network/)
