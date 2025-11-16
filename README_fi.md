# FreeCAD-translators-tools
Hyödyllisiä bash- skriptejä FreeCAD kääntäjille
---

## QMconvert2.sh
FreeCADin [viikottaisten kehitysversioiden](https://github.com/FreeCAD/FreeCAD-Bundle/releases/tag/weekly-builds) kanssa, jotka ovat ***AppImage*** -muodossa, meillä on nyt mahdollisuus testata ne käännökset välittömästi. Ilman tarvetta odottaa seuraavan testiversion julkaisusykliä, joka sisältäisi päivitetyt käyttöliittymän käännökset.

Käännökset [FreeCAD](https://www.freecad.org/index.php?lang=fi) -ohjelmalle tehdään [Crowdin](https://crowdin.com/project/freecad/fi) -alustalla. Lataa päivitetyt käyttöliittymän tekstitiedostot valitsemallasi kielelläsi sieltä.

Tämä on toinen versio bash -skriptistä, joka on suunniteltu valmistelemaan käännetyt kielitiedostot QT-kehitysympäristölle, jolle FreeCAD perustuu. Pohjimmiltaan skripti on luotu helpottamaan kääntäjien työtä, jotta he voivat kokeilla käyttöliittymään tehtyjen käännösten laatua paikallisessa ympäristössä. Skripti mahdollistaa myös paikallisen käännöstyön, kuten ulkoisten työpöytien kääntämisen, jotka eivät vielä ole integroitu FreeCADin -lisäosiin. Tällaisissa tapauksissa skripti voi olla hyödyllinen.

### Mitä tämä skripti tekee?:
* Varmistaa, että tiedostonimi noudattaa ennalta määriteltyjä käytäntöjä _(esim. iso alkukirjain)_,
* Lisää kielikoodin _(ja mahdollisesti aluekoodin)_ tiedostonimeen, joka luetaan lähdetiedoston otsikosta,
* Kääntää tiedostot ***lrelease***-työkalua käyttäen, jos se on asennettuna järjestelmään,
* Siirtää tiedostot käännöstiedostojen sijaintiin FreeCADin hakemistorakenteessa,
* Pystyy käsittelemään minkä tahansa määrän lähdekooditiedostoja, jotka sijaitsevat nykyisessä hakemistossa.

### Paikallisen ympäristön valmistelu skriptiä varten.
Jos työskentelet Debian-käyttöjärjestelmässä, tarvitset seuraavan paketin:
```
qttools5-dev-tools
```
Tämä paketti sisältää QT-työkalut, mukaan lukien tarvittavan lrelease-työkalun.

### Valmistele lähdekooditiedostot käännöksiä varten.
Voit ladata `.ts`-tiedostot sinua kiinnostavasta käyttöliittymän osasta Crowdin-projektialustalta, [FreeCAD](https://crowdin.com/project/freecad/fi) tai [FreeCAD -lisäosat](https://crowdin.com/project/freecad-addons). Jos sinulla ei ole omaa käyttäjätiliä, tarvitset ystävän, jolla sellainen on.

![Kuinka ladata lähdekooditiedosto](/images/download_2024-02-15_13-56.webm)
Jos työskentelet ulkoisen työpöydän kanssa ***FreeCAD-addons*** -repositorion ulkopuolelta, sinun on luotava käännöstiedostot paikallisesti itse.

### Työskentely skriptin kanssa.
Toimintatapa on suoraviivainen. Kopioi skriptitiedosto hakemistoon, jonne olet ladannut lähdekooditiedostot. Anna sille tarvittavat `+x` -käyttöoikeudet ja kutsu sitten sitä konsolista.

![Skriptin toiminta](/images/QMConvwet2_2024-02-15_14-53.webm)
#### Lataa skripti täältä.
[QMConvert2](/bash_scripts/QMconvert2.sh)


##Päivitys 16.11.2025

Tämä on jälleen uusi muutos paikallisten käännöstiedostojen sijaintiin.
Uusimmasta julkaisusta alkaen uusi kohdehakemisto on:
`~/.local/share/FreeCAD/v1-1/translations`
Siksi skripti täytyy päivittää.

Ohjelmassa on mahdollista tarkistaa nykyinen määrityshakemisto Python-konsolin kautta:

```
App.getUserAppDataDir()
```

Kyseiseen hakemistoon tulee luoda `translations`-kansio paikallisille käännöstiedostoille.
