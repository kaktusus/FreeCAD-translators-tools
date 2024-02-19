# Narzędzia projektu Wiki 2 Docusaurus 

Katalog zawiera narzędzia, które opracowuję do wdrożenia projektu: [[GSoC2023] Upgrade the documentation system](https://forum.freecad.org/viewtopic.php?style=4&t=78143 )

* Skrypt: `get_content.sh` jest narzędziem do wygenerowania zestawienia tytułów wszystkich stron Wiki dotyczących FreeCAD, które mogą zostać zaimportowane na nową platformę.
* Skrypt: `get_Wiki2.sh` służy do pobierania treści wybranych stron. Może pracować w trybie "automatycznym" gdy przygotujemy listę tytułów do pobrania. Skrypt do uruchomienia wymaga parametru _(tytuł istniejącej strony)_ lub dwóch. W drugim przypadku pierwszym parametrem musi być `lista`, a drugim nazwa pliku z zapisanymi tytułami do pobrania. Wtedy skrypt rozpocznie pracę automatyczną i przystąpi do pobierania wszystkich tytułów. Pobrane strony zapisane zostaną w katalogu o nazwie podanego pliku zawierającego tytuły do pobrania _(podanej jako drugi parametr)_.
* Skrypt: `Wiki2Docu4.sh` to konwerter formatu ***html*** _(MediaWiki)_ na ***markdown*** _(Docusaurus)_, który opracowuję. w chwili obecnej do uruchomienia potrzebuje parametru z podaniem nazwy pliku do przeprowadzenia konwersji.

---
Powiązane tematy na forum FreeCAD: [export pages to a file](https://forum.freecad.org/viewtopic.php?style=4&t=85327)
Repozytorium GitHub projektu: [FreeCAD-documentation-docusaurus](https://github.com/FreeCAD/FreeCAD-documentation-docusaurus/blob/main/README.md)
Narzędzia zewnętrzne: [Markdown Live Preview](https://markdownlivepreview.com/)
