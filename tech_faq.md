---
layout: post

faq:

  - question: Is it spelled Coinweb or CoinWeb?
    answer: |
        We prefer spelling the project it as _Coinweb_, and its native currency _XCO_.   


  - question: What is Coinweb?
    answer: |
        Coinweb is a blockchain agnostic parallel execution layer that decouples transaction collation from execution, removing major scaling bottlenecks. It provides a declarative smart contract framework executed across multiple existing blockchains, enabling powerful cross chain, fast, and secure dApp execution. Combined with Coinwebs cross chain compatible human readable address format it allows for easy to use  dApps - for both end users and developers.


  - question: Where can I find tokenomic related information?
    answer: |
        You can take a look to the [investor deck](https://coinweb.github.io/technical-docs/assets/documents/investor_deck.pdf) document.


  - question: What's the current roadmap?
    answer: |
        The roadmap is also described on the [investor deck](https://coinweb.github.io/technical-docs/assets/documents/investor_deck.pdf) document.


  - question: Is there some code I can run today?
    answer: |
        Yes! We have a proof of concept version of a _xco-node_ and a mobile wallet app working on top of it. Notice it is currently very unstable, with
        almost daily introduction of backward incompatible changes; that said, if you are interested on given it a try, feel free to contact the devs
        at info@coinweb.io.

        We expect to get a more stable version soon, once it is ready it will be possible to download it from our site or install it from our git sources.
        Keep in touch on our mailing list or telegram channel to get notified.


  - question: Are there similar projects related to Coinweb?
    answer: |
        Though we consider our scope and goals as a whole to be quite unique, there are several projects that share common components, goals, or that have strongly 
        inspired us. Among them:

        * Chainweb: Chainweb network of blockchain inspired our mechanism for inter-blockchain communication and reorganization mechanism. Notice though conceptually similar,
          as Chainweb works directly between native level-1 blockchains, rather than over an execution layer on top of them, there are subtle differences 
          on the mechanism behavior 

        * Counterparty: To the best of our knowledge, Counterparty were the pioneers decoupling the blockchain as a pure data layer over which to build an
          execution layer.

        * Handshake: Shares part of our goals, making application such distributed DNS not just technically possible, but feasible. In their case they introduce specific
          semantic and data structures; in our case we introduce our inference engine to define similar but dev-defined semantics and data structures.

        * Cardano: As cardano, we've chosen Haskell as our programming language for the platform. Notice that in our case, our smart-contract language is neither
          haskell nor a subset of it, but rather a datalog like rule system we call `dsGraph`.

        * Cosmos: An interesting platform for inter-chain interaction. Notice that even though the goal is similar, the approach is rather different, as they rely on a
          BFT like consensus mechanism based on validators, and in our case we use deterministic evaluation and RDoC (see info about our FFV consensus for further info).


  - question: Over which blockchains can Coinweb work? Would they need some fork?

    answer: |
        Providing they are mature enough, Coinweb can work over most current blockchains as they are, without any modification or fork require to them. We plan
        to start working on top of the major chains, like BTC, ETH, BCH, LTC or DASH.

  - question: What kind of Sybil attack protection does Coinweb use? Does it use PoW (Proof of Work), PoS (Proof of Stake)? Other?

    answer: |
        As Coinweb works as a deterministic execution layer built on top of existing blockchains, Coinweb's `full-nodes` are not vulnerable to
        Sybil attacks; that's the reason Coinweb does not require a consensus level Sybil protection mechanism such PoW, PoS or a bft-like set
        of validators. To secure `light-nodes` against a potential `dsBroker` (`full-nodes` connecting `light-nodes` to the network) Sybil attack:

        * Light-nodes gather several l2-blockheaders signed by different dsBrokers.

            * Because this information is signed, they don't need to directly access each `dsBroker`, but rather they
              can access public directories (containing a big number of l2-blockheader) from central services or 
              gossip protocols.

            * Burned stakes acts as a mean of a voluntary “license” for  dsBrokers; if there are too many of them to query all, light-nodes 
              will prefer those having burned the most.

            * Proof of burn rather than proof of stake because this “license” does not work as a proof they are honest, 
              but as a proof they are not part of a recent flooding attack. (You can think of it as how karma points work on
              social networks, where in combination with other factors like account-age, helps preventing spam).

            * Notice that this “license” helps light-clients to filter out potentially spammy dsBroker, but it is not the 
              only mechanism they could use: They can keep a white-list of specially trusted dsBrokers (like well 
              known merchants), black-list nodes known to have cheated, connect to a gossip network of 
              proof-of-cheating-nodes … etc. The dsLogic system provides a native system for managing multiple 
              independent authorities with their respective claims regarding dsBrokers that can be used for this.

        * As long as there is at least one honest l2-blockheader among the gathered pool, the light-node would be 
          able to use RDoC to identify it.

        * Having the l2-blockheaders, the light-node can verify any query using merkle proof.

---

<h1>FAQ:</h1>

<section class="faq">
    <ul>
        {% for item in page.faq %}
            <li><a href="#{{ item.question | slugify }}">{{ item.question }}</a></li>
        {% endfor %}
    </ul>

    {% for item in page.faq %}
        <h2 id="{{ item.question | slugify}}">{{ item.question }}<a class="header-link" href="#{{ item.question | slugify }}">#</a></h2>
        {{ item.answer | markdownify }}
    {% endfor %}
</section>

<br/>

![]({{site.baseurl}}/assets/img/shards1.png)

![]({{site.baseurl}}/assets/img/shards2.png)













