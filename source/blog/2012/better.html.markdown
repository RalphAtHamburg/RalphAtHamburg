Im Frontend Bereich ist Dank CSS3, HTML5, JavaScript, CSS Transitions und Responsive Design 
zur Zeit viel in Bewegung. Es wird an verschiedenen Stellen nach dem optimalen Workflow 
und nach Best Practice gesucht. Ein interessanter Ansatz ist SMACSS.

Die Hauptziele von SMACSS sind:

Mehr Semantik bei den HTML Elementen und dem Inhalt
Weniger Koppelung des CSS an die HTML Struktur

SMACSS teilt die Styles einzelne, unabhängige Layer auf:

* Base (Defaul Gestaltung, resets ...)
* Layout (Seitenaufbau, Spalten ...)
* Modules ( Listen, Text Boxen, Störer ...)
* State ( Zustände, is-actice, is-selected ..)
* Themes ( )

Ziel ist es den CSS Code konsistenter, weniger redundant und wiederverwendbarer zu gestalten. Konsequenterweise wird dabei den Klassen Selektoren mehr Gewicht beigemessen als den ID Selektoren.

At the very core of SMACSS is categorization. By categorizing CSS rules,   we begin to see patterns and can define better practices around each of these patterns.

Interessant wird es im Kapitel über Module. Module sind CSS Klassen, die an allen Stellen im HTML angewendet werden  können. Typische Module sind die Navigationsleiste, Listen, Widgets usw.

An dieser Stele wird ein Vortrag von Andy Hume interessant. Andy Hume stellt ein altes Paradigma in Frage, 
nach denen man keine beschreibenden Klassennamen verwenden soll. 
Er sieht das HTML eher als API, an die das CSS gebunden wird. Dabei fackelt er nicht lange herum, sondern
stellt gleich zu Anfang die (provokante)Frage, was denn an dieser Klasse so schlimm sein soll:

.green {
color: green;
}

Sieht man das HTML als Art API für, dann ist das eine klare eindeutige Schnittstelle.

Wenn die Gestaltung an Elemente angedockt wird, also z.B. an ein h2 Element, ist das problematisch. (Die Struktur, h1 h2 .., ist so vom SEO vorgegeben worden, sorry)

<!-- products list page -->
<div id="products-page">
<h1>Kaufe coole Klamotten Online</h1>

<h2>Jeans 501</h2>
<p>.....</p>

<h2>Hemd Hawaii</h2>
<p>.....</p>
</div>

<!-- product detail page -->
<div id="product-page">
<h1>Jeans 501</h1>
<h2>Die coole Hose für überall</h2>
<p>.....</p>
<img src=".." alt="Jeans 501" />
</div>

/* product headline */
#products-page h2,
#product-page h1 {
font-size: 24px;
color: #223322;
}

h1 und h2 haben eine unterschiedliche Bedeutung, je nachdem innerhalb welchem Kontext sie benutzt werden. 
Auf der Produnkt Listing Seite ist die Bedeutung des h1 Elements "Claim", auf der Produkt Detail Seite "Product Headline".
Aus CSS Sicht ist diese Bedeutung nicht erkennbar. Der Kommentar gilt jetzt mal nicht, 
er zeigt aber genau, wo das Problem liegt.

Zusätzlich ist die Gestaltung hier eng mit dem HTML Markup verknüpft. Wenn Seitenkomkponenten an andere Stelle verschoben werden,  bedeutet das zusätzlichen Code in der CSS Datei.

Die vorgeschlagene Lösung besteht darin, die Gestaltung nicht an Elemente, sondern an Klassen zu binden.  Womit man gleich bei den so schlimmen beschreibenden Klassenname landet.

Only include a selector that includes semantics. A span or div holds none.   A heading has some. A class defined on an element has plenty.

<!-- products list page -->
<div id="products-page">
<h1>Kaufe coole Klamotten Online</h1>

<h2 class="product-headline">Jeans 501</h2>
<p>.....</p>

<h2 class="product-headline">Hemd Hawaii</h2>
<p>.....</p>
</div>

<!-- product detail page -->
<div id="product-page">
<h1 class="product-headline">Jeans 501</h1>
<h2>Die coole Hose für überall</h2>
<p>.....</p>
<img src="" />
</div>

.product-headline {
font-size: 24px;
color: #223322;
}

Schon besser und den Kommentar können wir schon mal getrost weglassen. Oft ist es aber so, dass die Klassen in 
unterschiedlichem Bereichen anders aussehen. Auf der Produkt Detail Seite sollte die Schrift z.B. 
größer sein als auf der Listing Seite
.
When we have the same module in different sections, the first 
instinct is to use a parent element to style that module differently.

.product-headline {
font-size: 24px;
color: #223322;
}

#product-page .product-headline {
font-size: 36px;
}

Nach einem Jahr, in dem vielleicht auch noch mehrere Entwickler an Webseite gearbeitet haben, sieht die CSS Datei 
dann etwas so aus:

#product-page .product-headline,
#home-page .product-headline,
#product-of-the-month .product-headline,
#featured-page .product-headline {
font-size: 36px;
}

The problem with this approach is that you can run into specificity issues that require 
adding even more selectors to battle against it or to quickly fall back to using !important.

Wieder haben wir eine enge Bindung der Styles an die Position im HTML, was laut SMACCS zu vermeiden ist:
Was ist also das besondere an dieser Headline? Da das Produkt an einer hervorgehobenen 
Stelle angezeigt wird, soll ein größerer Font genommen werden.

Try to avoid conditional styling based on location. If you are changing the look of a 
module for usage elsewhere on the page or site, sub-class the module instead.

.product-headline {
font-size: 24px;
color: #223322;
}
.product-headline--big {
font-size: 36px;
}

<!-- product detail page -->
<div id="product-page">
<h1 class="product-headline product-headline--big">Jeans 501</h1>
<h2>Die coole Hose für überall</h2>
<p>.....</p>
<img src=".." alt="Jeans 501" />
</div>

Natürlich ist die Beschreibung auch semantisch und lautet nicht etwa: product-headline--36px-font.
Man darf gespannt sein wie sich dise Diskussion weiterentwickelt und was die nächsten "Best practice" sein werden.

Im [Twitter Bootstrap](http://twitter.github.com/bootstrap/components.html) und auch in den Google Produkten sind schon viele diesen Ideen umgesetzt.