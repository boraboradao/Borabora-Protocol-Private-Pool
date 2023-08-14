# Borabora V1

This repo is home to the Borabora Widgets package and the DApps [borabora.ooo](https://borabora.ooo).

BorBora V1 contains the infrastructure of the BoraBora protocol, the most important of which are Dynamic Oracle and Rebase Funding Rate.

·Contains the infrastructure of the BoraBora protocol, the most important of which is Dynamic Oracle.The Dynamic Oracle is a set of complex contracts with the supply function for price.

·Borabora has fully adapted to the funding rate of the on-chain environment, which is charged by the direction of naked positions and is triggered by the actions (trading, LP, positions closing, margin adding, etc.). The funding rate payments will be sent to the LP. The amount of funding rate is determined by the size of the naked position. The collection interval is one block, collected by the  rebase mechanism.

<img width="416" alt="image" src="https://github.com/boraboradao/Borabora-V1/assets/103490210/e75d077d-377f-41ea-9da5-beed83f55e39">


## Project setup
```
truffle compile
```

### Compiles and hot-reloads for gen abi
```
npm run abi
```

### Mirgate and minifies for testnetwork
```
truffle mirgate --network rinkeby
```

### Mirgate and minifies for BSC chain
```
truffle mirgate --network bsc
```

##### Apple

##### Banana

##### Coconut

##### Durian
