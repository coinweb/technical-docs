---
layout: post

faq:

  - question: Is it spelled Coinweb or CoinWeb?
    answer: |
        We prefer spelling the project it as _Coinweb_, and its native currency _XCO_.   



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














