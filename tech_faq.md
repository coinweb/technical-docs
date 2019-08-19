---
layout: post

faq:

  - question: Is it spelled Coinweb or CoinWeb?

    We prefer spelling the project it as _Coinweb_, and its native currency _XCO_.   


  - question: What is Coinweb?

    Coinweb is a blockchain agnostic parallel execution layer that decouples transaction collation from execution, removing major scaling bottlenecks. It provides a declarative smart contract framework executed across multiple existing blockchains, enabling powerful cross chain, fast, and secure dApp execution. Combined with Coinwebs cross chain compatible human readable address format it allows for easy to use  dApps - for both end users and developers.


  - question: Where can I find tokenomic related information?

    You can take a look to the [investor deck]({{ "assets/documents/investor_deck.pdf" | relative_url }}) document.


  - question: What's the current roadmap?

    The roadmap is also described on the [investor deck]({{ "assets/documents/investor_deck.pdf" | relative_url }}) document.


  - question: Is there some code I can run today?


    Yes! We have a proof of concept version of a _xco-node_ and a mobile wallet app working on top of it. Notice it is currently very unstable, with
    almost daily introduction of backward incompatible changes; that said, if you are interested on given it a try, feel free to contact the devs
    at info@coinweb.io.

    We expect to get a more stable version soon, once it is ready it will be possible to download it from our site or install it from our git sources.
    Keep in touch on our mailing list or telegram channel to get notified.


  - question: Are there similar projects related to Coinweb?

    Though we consider our scope and goals as a whole to be quite unique, there are several projects that share common components, goals, or that have strongly 
    inspired us. Among them:

    - Chainweb: Chainweb network of blockchain inspired our mechanism for inter-blockchain communication and reorganization mechanism. Notice though conceptually similar,
      as Chainweb works directly between native level-1 blockchains, rather than over an execution layer on top of them, there are subtle differences 
      on the mechanism behavior 

    - Counterparty: To the best of our knowledge, Counterparty were the pioneers decoupling the blockchain as a pure data layer over which to build an
      execution layer.

    - Handshake: Shares part of our goals, making application such distributed DNS not just technically possible, but feasible. In their case they introduce specific
      semantic and data structures; in our case we introduce our inference engine to define similar but dev-defined semantics and data structures.

    - Cardano: As cardano, we've chosen Haskell as our programming language for the platform. Notice that in our case, our smart-contract language is neither
      haskell nor a subset of it, but rather a datalog like rule system we call `dsGraph`.

    - Cosmos: An interesting platform for inter-chain interaction. Notice that even though the goal is similar, the approach is rather different, as they rely on a
      BFT like consensus mechanism based on validators, and in our case we use deterministic evaluation and RDoC (see info about our FFV consensus for further info).


---

<h1>FAQ</h1>

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














