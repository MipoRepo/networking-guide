---
name: quality
description: Määrittää tietoverkkodokumentaation laadun, teknisen oikeellisuuden, johdonmukaisuuden ja verifioinnin vaatimukset.
---

# Quality Rules

## Tarkoitus

Varmista, että tietoverkkojen dokumentaatio on ennen julkaisemista:

- teknisesti oikeaa
- luotettavaa
- johdonmukaista
- selkeää
- rakenteellisesti ehjää
- tarkoituksenmukaista

## Tekninen oikeellisuus

Kaikkien teknisten väitteiden tulee perustua luotettavaan tietoon.

Tarkista erityisesti:

- protokollien toimintaperiaatteet
- verkkokerrosten käsitteet
- IP-osoitteistus
- aliverkot
- reititys
- Ethernet
- VLAN
- ARP
- DHCP
- DNS
- NAT
- TCP ja UDP
- IPv6
- BGP
- verkkolaitteiden toiminta
- tietoturvaan liittyvät väitteet

Älä hyväksy teknisesti epäilyttävää väitettä vain siksi, että se vaikuttaa uskottavalta.

Jos tieto on epävarmaa, ilmaise epävarmuus tai tarkista asia luotettavasta lähteestä.

## Lähteet

Suosi teknisten väitteiden tarkistamiseen ensisijaisesti:

- IETF RFC:t
- IEEE-standardit
- Linuxin virallinen dokumentaatio
- verkkolaitteiden valmistajien virallinen dokumentaatio

Lähteen tulee tukea sitä väitettä, johon sitä käytetään.

Älä keksi lähteitä, viitteitä tai standardien sisältöä.

Jos eri lähteet ovat ristiriidassa, selvitä ristiriidan syy ennen lopullisen väitteen kirjoittamista.

## Terminologia

Terminologian tulee olla johdonmukaista koko dokumentaatiossa.

Tarkista:

- suomenkieliset tekniset termit
- englanninkieliset vastineet
- lyhenteet
- protokollien nimet
- standardien nimet
- verkkolaitteiden nimet

Käytä vakiintuneita termejä.

Älä vaihda termiä kesken dokumentaation ilman teknistä syytä.

## Selkeys

Tekninen sisältö tulee kirjoittaa niin, että lukija pystyy seuraamaan asian etenemistä.

Tarkista:

- käsitteet esitellään ennen niiden käyttöä
- lauseet ovat ymmärrettäviä
- kappaleet käsittelevät yhtä kokonaisuutta
- syy ja seuraus ovat oikein
- esimerkit tukevat teoriaa
- vaikeat käsitteet selitetään tarvittaessa

Älä lisää tekstiä vain dokumentin pituuden kasvattamiseksi.

## Rakenne

Tarkista dokumentin:

- pääotsikko
- otsikkohierarkia
- kappalejako
- listat
- taulukot
- koodilohkot
- kuvat
- linkit
- admonition-rakenteet

Rakenteen tulee tukea sisällön ymmärtämistä.

Älä käytä otsikkotasoja pelkkänä visuaalisena tyylikeinona.

## Markdown

Markdownin tulee olla syntaktisesti ehjää.

Tarkista erityisesti:

- otsikot
- listat
- taulukot
- linkit
- kuvat
- koodilohkot
- sisennykset
- admonition-rakenteet

Jokainen avattu koodilohko on aina suljettava vastaavalla sulkevalle merkinnällä.

Älä jätä koodilohkoja avoimiksi.

Jos Markdown-tiedosto sisältää Markdown-esimerkkejä, varmista myös niiden aitausten oikea rakenne.

## MkDocs Material

Varmista, että käytetyt MkDocs Material -ominaisuudet ovat projektin konfiguraation mukaisia.

Tarkista tarvittaessa:

- admonitionit
- Markdown-laajennukset
- koodilohkot
- kuvat
- sisäiset linkit
- otsikot
- muut käytössä olevat Material-ominaisuudet

Älä muuta `mkdocs.yml`-tiedostoa ilman teknistä tai käyttäjän pyytämää syytä.

## Linkit

Tarkista sisäiset linkit aina, kun muutokset voivat vaikuttaa niihin.

Varmista:

- kohdetiedosto on olemassa
- suhteellinen polku on oikein
- linkin kohde vastaa linkin tarkoitusta
- vanhentuneita polkuja ei käytetä

Älä muuta toimivia linkkejä ilman syytä.

## Kuvat

Tarkista:

- kuvatiedoston olemassaolo
- suhteellinen polku
- Markdown-syntaksi
- alt-teksti
- kuvan tarkoituksenmukaisuus

Alt-tekstin tulee kuvata kuvan sisältöä tai tarkoitusta.

Älä lisää kuvia vain koristeeksi.

## Esimerkit

Esimerkkien tulee olla teknisesti mahdollisia ja vastata dokumentissa esitettyä teoriaa.

Tarkista esimerkiksi:

- IP-osoitteet
- aliverkon maskit
- reititystaulut
- porttinumerot
- protokollat
- komentojen syntaksi
- konfiguraatiot

Älä esitä ympäristöstä riippuvia arvoja yleispätevinä faktoina.

## Sisällön rajaus

Dokumentaation tulee pysyä määritellyssä aiheessa.

Älä lisää:

- kurssiaikatauluja
- tehtävänantoja
- harjoituksia
- tenttejä
- arviointikriteerejä
- suoritusohjeita
- hallinnollisia ohjeita
- videoita
- videolinkkejä

Älä laajenna yksittäistä tehtävää tarpeettomasti.

## Päällekkäisyys

Vältä tarpeetonta tiedon toistamista.

Kun sama asia on jo käsitelty muualla:

- viittaa tarvittaessa kyseiseen dokumenttiin
- käsittele vain nykyisen aiheen kannalta tarpeellinen osa
- älä kopioi kokonaisia selityksiä

Lyhyt kertaus on sallittu, jos se parantaa ymmärrettävyyttä.

## Johdonmukaisuus

Tarkista tarvittaessa dokumenttien välinen johdonmukaisuus.

Kiinnitä huomiota:

- termeihin
- käsitteisiin
- osoitteisiin
- protokollien kuvauksiin
- otsikkorakenteisiin
- linkitykseen
- esitystapaan

Jos ristiriita löytyy, älä arvaa kumpi tieto on oikea. Tarkista tekninen lähde tarvittaessa.

## Muutosten verifiointi

Tarkista muutoksen laajuuden mukaan.

### Pieni muutos

Tarkista:

- muuttunut kohta
- Markdown-syntaksi
- koodilohkot
- linkit tarvittaessa

### Yksittäinen dokumentti

Tarkista:

- koko dokumentin rakenne
- tekniset väitteet tarvittavalla tasolla
- terminologia
- linkit
- kuvat
- Markdown
- MkDocs Material -rakenteet

### Laaja muutos

Tarkista lisäksi:

- dokumenttien välinen johdonmukaisuus
- navigaatio
- tiedostopolut
- päällekkäisyydet
- tekniset ristiriidat

## Build

MkDocs-build voidaan suorittaa, kun muutos tai QA-tehtävä sitä edellyttää.

Buildia ei tarvitse suorittaa triviaalin tekstimuutoksen vuoksi.

Jos buildia ei suoritettu, älä väitä sen onnistuneen.

Jos build epäonnistuu:

- tunnista virheen syy
- ilmoita virhe
- älä peitä epäonnistumista muilla muutoksilla

## Kontekstin hallinta

Käytä pienintä tarvittavaa kontekstia.

Älä lue koko repositorya pienen muutoksen vuoksi.

Älä lue kaikkia `docs/`-tiedostoja ilman tarvetta.

Älä lue `materiaali/`-hakemistoa ilman tarvetta.

Älä lue vanhoja `todo/sisalto-todo*.md`-versioita tavallisen muutoksen tai QA:n yhteydessä.

Laajassa dokumentaatiotehtävässä noudata projektin `CLAUDE.md`-tiedostossa määriteltyä todo-prosessia.

## Muutosten periaate

Tee pienin muutos, joka korjaa havaitun ongelman tai täyttää käyttäjän pyynnön.

Älä tee samalla asiaan liittymättömiä parannuksia.

Säilytä toimiva sisältö, rakenne ja konfiguraatio.

## Älä tee näitä ilman käyttäjän pyyntöä

- Älä kirjoita dokumentaatiota kokonaan uudelleen.
- Älä muuta projektin rakennetta.
- Älä järjestä navigaatiota uudelleen.
- Älä refaktoroi CSS:ää.
- Älä muuta `mkdocs.yml`-tiedostoa ilman tarvetta.
- Älä poista sisältöä automaattisesti.
- Älä suorita raskaita tarkistuksia triviaalin muutoksen vuoksi.
- Älä lue koko repositorya ilman tarvetta.
- Älä lue vanhoja todo-versioita.
- Älä aloita seuraavaa todo-tehtävää automaattisesti.
- Älä tee käyttäjän pyytämättömiä parannuksia.

## Laadun vähimmäisvaatimus

Dokumenttia voidaan pitää tarkistuksen osalta valmiina, kun:

- tekniset väitteet ovat perusteltuja
- terminologia on johdonmukaista
- rakenne on looginen
- Markdown on ehjä
- kaikki koodilohkot on suljettu
- tarvittavat linkit toimivat
- tarvittavat kuvat löytyvät
- MkDocs Material -rakenteet ovat oikein
- sisältö pysyy määritellyssä rajauksessa
- tarkistuksen laajuus on dokumentoitu oikein

Älä väitä koko projektin olevan laadunvarmistettu, jos tarkistus koski vain osaa projektista.