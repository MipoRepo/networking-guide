---
name: documentation-qa
description: Tarkistaa MkDocs Material -dokumentaation rakenteen, Markdown-syntaksin, linkit, kuvat, navigaation, terminologian ja teknisen laadun ennen julkaisua.
---

# Documentation QA

## Tarkoitus

Suorita MkDocs Material -dokumentaation laadunvarmistus ennen julkaisua tai käyttäjän pyytämää tarkistusta.

Tavoitteena on löytää dokumentaation rakenteelliset, tekniset ja sisällölliset ongelmat ilman tarpeettomia muutoksia.

## Toimintaperiaate

1. Selvitä käyttäjän pyytämän QA-tarkistuksen laajuus.
2. Tarkista vain tehtävän kannalta relevantit tiedostot.
3. Tarkista Markdown-rakenne.
4. Tarkista linkit ja kuvat.
5. Tarkista navigaatio tarvittaessa.
6. Tarkista dokumentaation tekninen ja sisällöllinen johdonmukaisuus.
7. Tunnista virheet, puutteet ja epäjohdonmukaisuudet.
8. Raportoi löydökset selkeästi.
9. Tee korjauksia vain, jos käyttäjä pyytää niitä tai tehtävä edellyttää niitä.

## QA-tasot

### Paikallinen tarkistus

Kun käyttäjä pyytää yhden tiedoston tai yhden muutoksen tarkistamista:

- tarkista vain kyseinen tiedosto
- tarkista vain suoraan siihen liittyvät resurssit
- älä tarkista koko dokumentaatiota

### Dokumenttitason tarkistus

Kun käyttäjä pyytää yhden dokumentin täydellistä QA:ta:

- tarkista koko kyseinen Markdown-tiedosto
- tarkista sen sisäiset linkit
- tarkista sen kuvat
- tarkista tarvittaessa suoraan liittyvät dokumentit
- tarkista Markdown- ja MkDocs Material -rakenteet

### Laaja dokumentaation QA

Kun käyttäjä pyytää koko dokumentaation QA-tarkistusta:

- tarkista `docs/`-rakenteen eheys
- tarkista kaikki dokumentaation Markdown-tiedostot
- tarkista `mkdocs.yml`
- tarkista navigaation ja tiedostojen vastaavuus
- tarkista sisäiset linkit
- tarkista kuvapolut
- tarkista otsikkorakenteet
- tarkista päällekkäisyydet ja ilmeiset ristiriidat
- tarkista tekninen johdonmukaisuus tarpeellisella tasolla

Älä laajenna tarkistusta repositoryn muihin osiin ilman tarvetta.

## Markdown-syntaksi

Tarkista erityisesti:

- otsikot
- listat
- taulukot
- linkit
- kuvat
- korostukset
- koodilohkot
- sisennetyt rakenteet
- admonition-laatikot

Jokainen avattu koodilohko on aina suljettava.

Tarkista erityisesti tilanteet, joissa Markdown-tiedosto sisältää Markdown-esimerkkejä.

Älä hyväksy rikkinäistä tai avointa koodilohkoa.

## Otsikkorakenne

Tarkista, että:

- dokumentilla on tarkoituksenmukainen pääotsikko
- otsikkotasot muodostavat loogisen hierarkian
- otsikkotasoja ei käytetä pelkkään visuaaliseen korostamiseen
- otsikot kuvaavat niiden alla olevaa sisältöä
- otsikkorakenne on yhdenmukainen muun dokumentaation kanssa

Älä muuta otsikkorakennetta vain tyylisyistä, jos nykyinen rakenne on toimiva.

## Linkit

Tarkista sisäiset Markdown-linkit.

Varmista:

- kohdetiedosto on olemassa
- suhteellinen polku on oikein
- linkki ei osoita vanhaan tai väärään tiedostoon
- linkin teksti vastaa kohdetta

Tarkista ulkoiset linkit vain silloin, kun tehtävä tai QA-laajuus sitä edellyttää.

Älä vaihda toimivia linkkejä ilman syytä.

## Kuvat

Tarkista Markdown-kuvien yhteydessä:

- tiedostopolku
- tiedoston olemassaolo
- suhteellinen polku
- alt-teksti
- kuvan tarkoituksenmukaisuus

Alt-tekstin tulee kuvata kuvan sisältöä tai tarkoitusta.

Älä pidä koristeellista kuvaa teknisenä sisältönä.

## MkDocs Material

Tarkista tarvittaessa:

- admonition-rakenteet
- koodilohkot
- Markdown-laajennukset
- otsikot
- sisäiset linkit
- kuvat
- muut projektissa käytetyt Material-ominaisuudet

Varmista, että käytetyt rakenteet ovat yhteensopivia projektin nykyisen MkDocs Material -konfiguraation kanssa.

Älä muuta `mkdocs.yml`-tiedostoa pelkän QA-tarkistuksen aikana ilman perusteltua syytä.

## Navigaatio

Kun QA sisältää navigaation tarkistuksen:

- tarkista `mkdocs.yml`
- tarkista `nav:`-rakenteen YAML-syntaksi
- tarkista navigaation tiedostopolut
- tarkista, että viitatut Markdown-tiedostot ovat olemassa
- tunnista dokumentit, jotka puuttuvat navigaatiosta, jos tarkistuksen laajuus sitä edellyttää
- älä järjestä navigaatiota uudelleen ilman käyttäjän pyyntöä

## Tekninen sisältö

Tarkista dokumentaation tekninen johdonmukaisuus.

Kiinnitä huomiota erityisesti:

- terminologiaan
- protokollien nimiin
- osoitteisiin
- aliverkkoihin
- protokollien toimintaperiaatteisiin
- verkkolaitteiden toimintaan
- esimerkkien oikeellisuuteen
- syy-seuraussuhteisiin
- ristiriitaisiin väitteisiin

Älä hyväksy teknisesti epäilyttävää väitettä vain siksi, että se esiintyy muualla dokumentaatiossa.

Jos tekninen oikeellisuus vaatii perusteellista tutkimusta, käytä `technical-review`-skillin toimintamallia.

## Terminologia

Tarkista:

- suomenkielisten termien johdonmukaisuus
- englanninkielisten teknisten termien oikeellisuus
- lyhenteiden käyttö
- protokollien nimet
- standardien nimet

Älä vaihda vakiintunutta teknistä termiä tarpeettomasti.

## Sisällön eheys

Tarkista, että:

- sisältö vastaa dokumentin otsikkoa
- käsitteet esitellään ennen niiden käyttöä
- dokumentin rakenne etenee loogisesti
- esimerkit liittyvät selitettyyn teoriaan
- olennaisia määritelmiä ei puutu
- sama asia ei ole tarpeettomasti ristiriidassa muiden tarkistettavien dokumenttien kanssa

Älä lisää uutta sisältöä vain siksi, että dokumenttia voisi laajentaa.

## Päällekkäisyys

Tunnista tarpeeton sisällön toistaminen silloin, kun QA:n laajuus sisältää useita dokumentteja.

Erota toisistaan:

- tarkoituksellinen kertaus
- lyhyt kontekstia antava selitys
- tarpeeton kopiointi
- ristiriitainen toisto

Älä poista päällekkäistä sisältöä automaattisesti.

Raportoi ongelma ja tee muutokset vain pyydettäessä.

## Lähteet

Jos dokumentaatio sisältää lähdeviitteitä tai teknisiä väitteitä, tarkista tarvittaessa lähteiden asianmukaisuus.

Suosi ensisijaisia lähteitä:

- IETF RFC:t
- IEEE-standardit
- Linuxin virallinen dokumentaatio
- verkkolaitteiden valmistajien virallinen dokumentaatio

Älä keksi puuttuvia lähteitä.

Jos QA:n tavoitteena on ainoastaan rakenteellinen tarkistus, älä tee laajaa lähdetutkimusta ilman tarvetta.

## Kurssimateriaalin rajaus

Dokumentaation ei tule sisältää teknisen tietopohjan ulkopuolista kurssihallintoa.

Tunnista tarvittaessa:

- kurssiaikataulut
- tehtävänannot
- harjoitukset
- tentit
- arviointikriteerit
- suoritusohjeet
- hallinnolliset ohjeet
- videot
- videolinkit

Raportoi tällainen sisältö, jos se on ristiriidassa projektin dokumentaatioperiaatteiden kanssa.

Älä poista sitä automaattisesti ilman käyttäjän pyyntöä.

## Build ja työkalut

Jos projektin ympäristö mahdollistaa MkDocs-buildin, sitä voidaan käyttää laajan QA:n yhteydessä.

Buildia voidaan käyttää esimerkiksi seuraavien ongelmien löytämiseen:

- rikkinäiset Markdown-rakenteet
- virheelliset linkit
- puuttuvat tiedostot
- YAML-virheet
- MkDocs Material -syntaksivirheet

Älä suorita raskasta buildia triviaalin paikallisen tekstimuutoksen vuoksi.

Jos buildia ei voida suorittaa, älä väitä sen onnistuneen.

## Kontekstin hallinta

Käytä pienintä QA-tehtävän kannalta riittävää kontekstia.

Paikallisessa tarkistuksessa:

- älä lue koko repositorya
- älä lue kaikkia `docs/`-tiedostoja
- älä lue `materiaali/`-hakemistoa ilman tarvetta
- älä lue todo-tiedostoja ilman tarvetta

Laajassa QA:ssa lue vain tarkistuksen edellyttämät projektitiedostot.

Jos QA:n yhteydessä tarvitaan teknistä lähdeanalyysiä, käytä `source-analysis`-skillin toimintamallia.

## Todo-prosessi

Älä lue tai muuta `todo/sisalto-todo*.md`-tiedostoja tavallisen QA-tarkistuksen yhteydessä.

Jos käyttäjä nimenomaisesti pyytää jatkamaan todo-ohjattua dokumentaatioprosessia, noudata `CLAUDE.md`-tiedostossa määriteltyä todo-prosessia.

Älä ylikirjoita aikaisempaa todo-versiota.

Älä aloita seuraavaa todo-tehtävää automaattisesti.

## Löydösten luokittelu

Raportoi löydökset tarvittaessa seuraavilla luokilla:

- **Virhe:** rakenne tai sisältö on väärin.
- **Tekninen virhe:** tekninen väite tai esimerkki on väärä.
- **Rikkinäinen linkki:** kohdetta ei löydy tai polku on väärä.
- **Rikkinäinen kuva:** kuvaa ei löydy tai polku on väärä.
- **Rakenneongelma:** Markdown- tai dokumentaatiorakenne on virheellinen.
- **Epäjohdonmukaisuus:** sisältö poikkeaa tarpeettomasti muusta dokumentaatiosta.
- **Puuttuu:** QA:n kannalta olennainen asia puuttuu.
- **Huomio:** mahdollinen parannuskohde, joka ei ole selkeä virhe.

Älä merkitse mielipidettä tai tyylivalintaa virheeksi.

## Raportointi

Raportoi löydökset mahdollisimman tiiviisti.

Käytä tarvittaessa muotoa:

- tiedosto
- kohta
- ongelma
- vaikutus
- ehdotettu korjaussuunta

Jos ongelmia ei löydy, ilmoita selkeästi, että tarkistuksen määritellyssä laajuudessa ei löytynyt olennaisia ongelmia.

Älä väitä koko dokumentaation olevan kunnossa, jos tarkistit vain osan siitä.

## Korjaaminen

QA on ensisijaisesti tarkistus, ei automaattinen korjausprosessi.

Jos käyttäjä pyytää korjaamaan löydökset:

1. Korjaa tunnistetut ongelmat.
2. Tee pienin tarvittava muutos.
3. Säilytä muu sisältö ennallaan.
4. Tarkista korjatut kohdat uudelleen.
5. Älä tee samalla asiaan liittymättömiä parannuksia.

## Älä tee näitä ilman käyttäjän pyyntöä

- Älä kirjoita dokumentaatiota kokonaan uudelleen.
- Älä muuta projektin rakennetta.
- Älä järjestä navigaatiota uudelleen.
- Älä refaktoroi CSS:ää.
- Älä muuta `mkdocs.yml`-tiedostoa ilman tarvetta.
- Älä poista sisältöä automaattisesti.
- Älä lue koko repositorya paikallisessa QA-tehtävässä.
- Älä lue vanhoja todo-versioita.
- Älä aloita seuraavaa todo-tehtävää.
- Älä tee käyttäjän pyytämättömiä parannuksia.

## Verifiointi

QA:n lopuksi varmista, että:

- tarkistuksen laajuus vastaa käyttäjän pyyntöä
- löydökset perustuvat todellisiin ongelmiin
- Markdown-rakenne on ehjä
- kaikki koodilohkot on suljettu
- linkit ja kuvat on tarkistettu silloin, kun ne kuuluvat tehtävän laajuuteen
- navigaatio on tarkistettu silloin, kun se kuuluu tehtävän laajuuteen
- tekniset väitteet on tarkistettu tarvittavalla tasolla
- raportissa ei väitetä tarkistetuksi asioita, joita ei tarkistettu

QA ei saa laajentaa tehtävän scopea itsenäisesti.