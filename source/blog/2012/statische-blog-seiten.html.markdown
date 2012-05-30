---
title: Blogbeitr&auml;ge als statische Seiten
date: 2012/05/23
---

Schon &ouml;fters habe ich mich gefragt, ob es Sinn macht, ein CMS (Wordpress ect.) einzusetzen, wenn sich die Inhalte der Seite nur selten &auml;ndern. Zu gro&szlig; sind die Nachteile: Man braucht eine Datenbank, meist (MYSQL), und ein CMS (meist Wordpress). Damit verliert man alle Freiheiten, die man bei der Entwicklung einer rein statische Website hat. Man muss sich jetzt zus&auml;tzlich um die Datenbank k&uuml;mmern (Backup) und sein CMS up-to-date halten. Dar&uuml;ber hinaus hat man sich auch gleich noch ein Performance Problem eingehandelt. Die Standardkonfigurationen der bekannten Hoster sind alle "out-of-the-box" recht langsam.

Wenn man also schon wei&szlig;, dass man es doch nur schafft, eine Handvoll Beitr&auml;ge pro Jahr zu schreiben, kann man sie auch gleich als statische Seiten anlegen. Erst recht, wenn man Webentwickler ist und die notwendigen Werkzeuge sowieso auf dem Rechner hat.

Das geht bequemer als man glaubt, da es Tools zur Unterst&uuml;tzung gibt. Eins davon ist [Middleman](http://middlemanapp.com/), mit dem auch diese Seite erstellt ist.

Zuerst erstellt man ein Template f&uuml;r die Blog Seite(n) und baut es in die Website ein. F&uuml;r die gew&uuml;nschten Seitentypen erstellt man einfach Templates, z.B.:

    :::ruby
    blog_year_template
    blog_month_template
    blog_day_template

Dabei stehen einem eine Reihe von Helper Methoden zur Verf&uuml;gung. 

    :::ruby
    is_blog_article?
    current_article_date
    current_article_title
    current_article_metadata
    current_article_tags
    blog_tags
    current_tag_data
    current_tag_articles
    current_tag_title

Steht die Struktur erst einmal, kann man anfangen, seine Beitr&auml;ge zu schreiben.

Die Beitr&auml;ge werden im Middleman Projekt in einer festen Ordnerstruktur abgelegt, z.B.:

    blog/2012/05
    
Man kann auch einfach `middleman article 'Statische Blog Seiten'` eintippen, Middleman erstellt dann die entsprechende Datei  an der richtigen Stelle.

Es ist noch nicht einmal n&ouml;tig, die Beitr&auml;ge in HTML zu verfassen. Man kann alles in **Markdown** schreiben. Die Formatierungsm&ouml;glichkeiten reichen f&uuml;r ein Blog vollopmmen aus. Middleman unterst&uuml;tzt dabei  verschiedene Markdown Engines.

Jetzt ist also der richtige Zeitpunkt, sich einen dieser ultraschicken, minimalistischen, stylischen Markdown Editoren wie [iaWriter](http://www.iawriter.com/) oder [ByWord](http://bywordapp.com/) zuzulegen. Dank iCloud uUnterst&uuml;tzung kann man so von &uuml;berall mit iPhone oder iPad an seinen Beitr&auml;gen arbeiten. Ein simpler Texteditor tut es nat&uuml;rlich such.

Ein Artikel in Markdown sieht dann so aus:

	---
	title: Statische Blog Seiten
	date: 2012/05/23
	tags: blogging, middleman, static, development
	---

	# Hello World

	lorem ipsum .....

	* one
    * two

		def foo
			bar
		end

	lorem ipsum .....

Mit dem Befehl `middleman build` wird anschlie&szlig;end die statische Website gebaut, die man dann nur noch auf den Server hochladen muss. Noch einfacher geht das mit dem [rakefile](https://gist.github.com/1902178#file_rakefile) von [Scott W.Bradley](http://scottwb.com/blog/2012/02/24/middleman-deployment-rakefile/). Damit ist nur noch der Befehl `rake deploy` einzutippen.

Fehlt schlie&szlig;lich noch die Kommentarfunktion. Die kann man gut outsourcen, z.B. auf [disqus](http://disqus.com). Und schon hat man eine schlanke performante Seite ohne unn&ouml;tigen Overhead.

Das gleiche gilt nat&uuml;rlich auch f&uuml;r andere (quasi) statische Webseiten, bei denen der Inhalt nicht unbedingt aus einer Datenbank kommen muss.
