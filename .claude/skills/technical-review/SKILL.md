---
name: technical-review
description: Tarkistaa tietoverkkojen dokumentaation teknisen oikeellisuuden, terminologian, loogisuuden ja lähteisiin perustuvat väitteet.
---

# Technical Review

## Tarkoitus

Tarkista tietoverkkojen dokumentaation tekninen oikeellisuus ennen julkaisemista.

Tavoitteena on löytää tekniset virheet, epätarkkuudet, vanhentuneet väitteet, ristiriidat ja epäselvät kuvaukset.

## Toimintaperiaate

1. Lue käyttäjän määrittämä Markdown-tiedosto tai kyseinen dokumentaatioalue.
2. Keskity tarkistettavaan sisältöön.
3. Tunnista tekniset väitteet.
4. Tarkista niiden oikeellisuus luotettavia teknisiä lähteitä vasten tarvittaessa.
5. Tarkista käsitteiden ja termien johdonmukaisuus.
6. Tarkista, että toimintaperiaatteet on kuvattu loogisesti.
7. Tunnista puuttuvat olennaiset rajoitukset tai poikkeukset.
8. Raportoi löydökset selkeästi.
9. Tee korjaukset vain, jos käyttäjä pyytää korjaamaan dokumentaation.

## Tarkistettavat asiat

### Tekninen oikeellisuus

Tarkista esimerkiksi:

- protokollien toimintaperiaatteet
- osoitteistus
- reititys
- Ethernet
- VLAN
- ARP
- DHCP
- NAT
- TCP ja UDP
- DNS
- IPv6
- BGP
- verkkolaitteiden toiminta
- tietoturvaan liittyvät tekniset väitteet

Älä hyväksy teknistä väitettä vain siksi, että se vaikuttaa uskottavalta.

### Terminologia

Tarkista:

- suomenkieliset termit
- englanninkieliset vastineet
- lyhenteet
- protokollien nimet
- standardien nimet
- käsitteiden yhdenmukainen käyttö

Älä vaihda vakiintunutta teknistä termiä tarpeettomasti.

### Loogisuus

Tarkista, että:

- käsitteet esitellään ennen niiden käyttöä
- syy ja seuraus ovat oikein
- prosessien vaiheet ovat oikeassa järjestyksessä
- eri teknologioiden väliset suhteet ovat oikein
- esimerkit vastaavat selitettyä teoriaa

### Rajaukset ja poikkeukset

Tarkista, sisältääkö dokumentaatio tarvittaessa olennaiset:

- rajoitukset
- poikkeustapaukset
- oletukset
- turvallisuusnäkökohdat
- käytännön ongelmat

Älä lisää yksityiskohtia vain yksityiskohtien vuoksi.

## Lähteet

Käytä teknisen oikeellisuuden tarkistamiseen ensisijaisesti:

- IETF RFC:t
- IEEE-standardit
- Linuxin virallinen dokumentaatio
- verkkolaitteiden valmistajien virallinen dokumentaatio

Jos lähteet ovat ristiriidassa, selvitä ristiriidan syy ja tuo se esiin.

Älä esitä epävarmaa tietoa varmana.

## Kontekstin hallinta

Käytä mahdollisimman pientä tarvittavaa kontekstia.

Jos käyttäjä pyytää yhden Markdown-tiedoston tarkistamista:

- lue vain kyseinen tiedosto
- tarkista vain sen kannalta relevantit lähteet
- älä käy koko repositorya läpi

Jos tarkistus edellyttää toisen tiedoston lukemista, lue vain kyseinen tiedosto.

Älä lue koko `docs/`-hakemistoa ilman käyttäjän pyyntöä.

Älä lue `todo/`-tiedostoja tavallisen teknisen tarkistuksen yhteydessä.

## Markdown

Jos tarkistettava tiedosto sisältää Markdown-koodilohkoja:

- jokainen avattu ` ``` `-lohko on suljettava vastaavalla ` ``` `-merkinnällä
- älä jätä koodilohkoa avoimeksi
- tarkista koodilohkojen syntaksi
- säilytä koodilohkojen sisältö, ellei siinä ole teknistä virhettä tai käyttäjä pyydä muutosta

## MkDocs Material

Tarkista tarvittaessa:

- Markdown-syntaksi
- MkDocs Material -syntaksi
- admonition-rakenteet
- otsikkorakenne
- sisäiset linkit
- koodilohkot
- kuviin liittyvät polut

Älä muuta `mkdocs.yml`-tiedostoa pelkän teknisen tarkistuksen vuoksi.

## Korjaaminen

Jos käyttäjä pyytää korjaamaan löydetyt ongelmat:

1. Korjaa vain tunnistetut ongelmat.
2. Säilytä alkuperäinen rakenne mahdollisuuksien mukaan.
3. Älä tee samalla muita parannuksia.
4. Älä muuta asiaan liittymätöntä sisältöä.
5. Tarkista korjauksen jälkeen muuttunut kohta uudelleen.

## Älä tee näitä ilman erillistä pyyntöä

- Älä tarkista koko repositorya.
- Älä tarkista kaikkia `docs/`-tiedostoja.
- Älä muuta navigaatiota.
- Älä järjestä dokumentaatiota uudelleen.
- Älä kirjoita sisältöä kokonaan uudelleen.
- Älä refaktoroi CSS:ää.
- Älä muuta `mkdocs.yml`-tiedostoa ilman tarvetta.
- Älä suorita täydellistä documentation QA -prosessia.
- Älä aloita seuraavaa todo-tehtävää.
- Älä tee käyttäjän pyytämättömiä parannuksia.

## Verifiointi

Teknisen tarkistuksen lopuksi varmista:

- löydetyt tekniset ongelmat on tunnistettu
- korjaukset ovat teknisesti perusteltuja
- termit ovat johdonmukaisia
- Markdown-rakenne on ehjä
- jokainen ` ``` `-koodilohko on suljettu
- tarkistus ei ole muuttanut asiaan liittymätöntä sisältöä

## Raportointi

Raportoi vain tehtävän kannalta olennaiset löydökset.

Käytä tarvittaessa muotoa:

- **Virhe:** teknisesti väärä väite
- **Epätarkkuus:** väite tarvitsee täsmennystä
- **Puuttuu:** olennainen tekninen tieto puuttuu
- **OK:** kohta on teknisesti kunnossa

Älä kirjoita pitkää raporttia, jos käyttäjä pyytää vain nopean tarkistuksen.