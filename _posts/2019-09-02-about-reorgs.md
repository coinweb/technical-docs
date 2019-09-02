---
layout: post
title:  "Reorganizations, failed PoW chains, and L2 mounts"
date:   2019-09-02 11:11:54 +0200
categories: sharding internal architecture blockchain distributed mounting
---

### Intro

Reorganization events is an crucial topic for blockchain architectures and consensus systems.  Coinweb using L2 chains that are inside L1 chains and work across multiple chains, this is especially important.

Coinweb runs on top of proof-of-work consensus systems (PoW), as well as proof-of-stake (PoS) consensus.  The latter usually use consensus algorithms in the BFT family, dBFT, pBFT or variations.  The latter consensus algorithms have _finality_  while PoW consensus has _eventual consistency_.

This article is about PoW L1 chains only.

#### Attacked and failed PoW chains

In casual parlance we talk about a chain being _attacked_  when _large_ reorganizations occur.  The L1 data
structure rarely has a concept of attack and no consistency problems arise during an attack.  The problems
caused by attacks are always related to some _external system_ that does not operate under the consensus
system of the L1 chain.  The typical example is a _double spend_  where some goods or services are exchanged
for L1 coins and a later reorganization makes the transaction disappear.
Exchanges are particularly exposed to this.

Coinweb explicitly defines attacks and failures of a PoW chain.

Broadly speaking, an L1 PoW chain in Coinweb can be in three states:  Normal, Attacked or Failed.  

#### Normal and Attacked states

The normal L1 PoW chain goes back and forth between the Normal and Attacked states.  In the Normal state, _anchors_ for the L1 chain posted on neighborhood chains are not in conflict with each other.

In the Attacked state, there are conflicts between these _anchors_ and they point to _orphan_ L1 tips, tips that never become part of the L1 canonical chain.
These are sometimes called uncles, granduncles etc.  Based on the occurrance of these alternative L1 tips,
we do a _parameter estimation_ for a model of the PoW chain.

In a simple model, the number of blocks appearing in a given time span follows a Poisson process.
This means that it is possible for a miner to find a few blocks before the rest of the network sees these blocks.  
Though multi-block orphans are quite unlikely to happen.  A model taking into consideration network delays and 
random noise can be created and estimated, for example using a Kalman filter. 

#### Failed state

A L1 PoW chain enters the failed state when an _unlikely_ reorganization happens.  The model we discussed
previously will assign probabilities to various reorg events, and for a given small ε probability, we define that
if such an event happens, the chain enters the failed state.

When an L1 chain enters failed state, the embedded L2 chain will be _moved_ to a neighbor chain in a neighborhood graph reduction event.

From a CAP viewpoint, the failed state keeps consistency at the expense of availability.  However, after moving the L2 chain to a (better) L1 chain, availability is restored while keeping consistency.

From a consensus protocol point of view, Coinweb implements a dynamic checkpoint system for the L1 chain so that
if a reorg event happens beyond this checkpoint, the L1 chain enters the Failed state.