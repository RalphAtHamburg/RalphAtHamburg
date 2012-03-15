--- 
title: Middleman f&uuml;r statische Webseiten
date: 2012/03/15
TODO: Umlaute gehen aufgrund eines Bugs nicht UTF-8 and ASCII-8BIT encoding
---
Wenn man es gewohnt ist Webanwendungen mit RubyOnRails zu entwickeln, guckt man ziemlich dumm drein, wenn man auf einmal eine komplexe statische Webseite bauen muss. Die ganzen M&ouml;glichkeiten sein Projekt zu strukturieren, die vielen Helper Methoden und jede Menge weiterer Features fehlt einem pl&ouml;tzlich. Doch zum Gl&uuml;ck gibt es [Middleman](http://middlemanapp.com/).

Middleman ist ein Generator f&uuml;r statische Webseiten. Salopp gesagt handelt es sich um RubyOnRails, bei dem von der MVC Architektur nur die View Schicht &uuml;brig geblieben ist. Modell und Controller fehlen. Zudem unterst&uuml;tzt Middleman eine Vielzahl Templatesprachen (Haml, Sass, Compass, Slim, CoffeeScript, und viele mehr). Die Komprimierung von .js und .css Dateien sowie zur Erzeugung von Sprites  runden den Entwicklungszyklus ab. Hier jetzt einige Bereiche, in denen Middelman bei der Erstellung von statischen Webprojekten helfen kann.

Elemente, die auf mehreren Seiten vorkommen, wie z.B. Navigation, Fu&szlig;zeile, kann man in eigene Dateien auslagern und als `partial` in die Seiten einf&uuml;gen. 

    :::erb
    <header>
      <%= image_tag 'logo.png' %>
      <%= partial 'menu' %>
    </header>
  
Auch Stylesheet Dateien lassen sich einfach auf mehre Dateien aufteilen. So verliert man nicht mehr den &Uuml;berblick in 1000 Zeilen langen CSS Dateien. Beim Erstellen der Seite fasst Middelman alles zu einer Datei zusammen und spart somit unn&ouml;tige Requests.

Innerhalb der Seiten hat man vollen Zugriff auf die Sprache Ruby. So kann man leicht &uuml;ber Variablen z.B. den active Zustand von Men&uuml;s steuern. (Codebeispiele in Haml und mit RubyOnRails tag helper) 
    
    :::haml
    %li= link_to 'Home', 'index.html', :class => ('active' if @home)
    %li= link_to 'About', 'about.html', :class => ('active' if @about)  
    %li= link_to 'Contact', 'contact.html', :class => ('active' if @contact)  

Komplexere Logik l&auml;&szlig;t sich in Helper Methoden auslagern. Weiterhin stehen einem die  RubyOnRails Helper Tags zur Verf&uuml;gung.

F&uuml;r die Internationalisierung von Seiten kann man die Rails I18n API nutzen. Dabei werden alle Strings in eine yaml Datei ausgelagert. 

    :::yaml
    de:  
      title:   
        headline: "SocialWeb Development"  
        subheadline: "Beratung Entwicklung"  
        kontakt: "Kontakt"   
        impressum: "Impressum"  
    
Auf den Seiten angesprochen werden sie in der Form `t("title.headline")`. Dank der M&ouml;glichkeit Ruby einsetzen zu k&ouml;nnen, lassen sich auch Grafiken oder andere nicht textuelle Features sprachabh&auml;ngig anpassen.


    :::haml
    %div
      = image_tag 'pic-de.jpg' if locale == :de
      = image_tag 'pic-en.jpg' if locale == :en

F&uuml;r jede weitere Sprache ist es lediglich n&ouml;tig, die entsprechende Sprachdatei in den Ordner `locales` zu legen. Middleman generiert dann alle n&ouml;tigen statischen Seiten.

Middleman kommt mit vorkonfigurierten leeren Projekten (z.B. HTML5). Auf Github gibt es eine ganze Menge fertiger Projekte, wie z.B. [Middleman Bootstrap](https://github.com/nathos/middleman-bootstrap) welches auf Boilerplate, Compass und dem Suzy Grid basiert. Eigene Projekte lassen sich einfach in einem Verzeichnis unter `~/.middleman` ablegen. Dann kann man mit `middleman init myproject` gleich mit einem leeren Rahmen loslegen.

Dies sind nur einige Beispiele daf&uuml;r, was man mit Middleman machen kann. Die M&ouml;glichkeiten Middleman bietet sind schon gewaltig. Ich habe Middleman gerade in einem komplexen Projekt eingesetzt und werde es f&uuml;r statische Seiten jetzt immer nehmen. Middleman wir seit 2010 entwickelt, die zur Zeit aktuelle Version ist 2.0. Middleman 3.0 ist aber schon im Beta.

Links:  
[HAML](http://haml-lang.com/),  [SASS](http://sass-lang.com/),  [Compass](http://compass-style.org/)
