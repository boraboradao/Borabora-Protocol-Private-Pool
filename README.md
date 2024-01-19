# Private Pool Overview

Private Pool is the first experimental development of the Borabora protocol, consisting of smart contracts in Solidity.

Sufficient liquidity is crucial for trading protocols, as deeper pools can support higher open interest. However, acquiring and maintaining liquidity can be costly and unstable if solely reliant on liquidity providers (LP). Therefore, instead of “renting” all liquidity from external sources, the Borabora protocol implements the POL mechanism to become gradually self-sufficient.

Upon genesis, the protocol purchased LP tokens with funds raised from previous rounds.

- Borabora Private Pool's Liquidity Pools provide a single-side exposure to liquidity providers. The token pair of each liquidity pool is set as TokenA/Stablecoin, and LPs can purchase LP Tokens by depositing the Stablecoin asset into the pool.
- Borabora Private Pool's Liquidity Pools provide a single-side exposure to liquidity providers. The token pair of each liquidity pool is set as TokenA/Stablecoin, and LPs can purchase LP Tokens by depositing the Stablecoin asset into the pool.
- Borabora Private Pool's Liquidity Pools adopt a “closed fund model” to adjust the total value of the liquidity pool based on market demand for liquidity. This aims to solve the problem of the lack of risk-reward for early-stage LPs in an infinitely open liquidity pool. In a demand-driven liquidity model, early-stage LPs are rewarded with trading fees without the effect of reward dilution from additional liquidity that would otherwise be underutilized. 

<img width="416" alt="image" src="https://github.com/boraboradao/Borabora-V1/assets/103490210/e75d077d-377f-41ea-9da5-beed83f55e39">


# Deployment
Private Pool is deployed on BNBChain.

# Tip
Due to business development, this version has been deprecated.
