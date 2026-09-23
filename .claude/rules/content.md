---
name: content
description: Määrittää tietoverkkodokumentaation sisällön, kirjoitustavan, rajauksen ja teknisen esitystavan.
---

# Content Rules

## Tarkoitus

Määritä tietoverkkojen dokumentaation sisällölliset periaatteet.

Dokumentaation tulee olla:

- teknisesti luotettavaa
- selkeää
- itsenäisesti ymmärrettävää
- johdonmukaista
- käytännöllistä
- suomenkielistä

Dokumentaation tarkoitus on toimia teknisenä tietopohjana, oppimateriaalina ja hakuteoksena.

## Kieli

Kirjoita ensisijaisesti suomeksi.

Käytä englanninkielistä teknistä termiä tarvittaessa suomenkielisen termin rinnalla.

Käytä alan vakiintunutta terminologiaa.

Älä käännä teknisiä termejä väkisin, jos englanninkielinen termi on alalla vakiintunut.

## Sisällön rakenne

Selitä aihe mahdollisuuksien mukaan seuraavassa järjestyksessä:

1. mikä asia on
2. miksi sitä tarvitaan
3. miten se toimii
4. missä sitä käytetään
5. miten se liittyy muihin teknologioihin
6. mitä rajoituksia tai riskejä siihen liittyy

Rakenna sisältö aihekohtaisesti. Älä pakota jokaista dokumenttia samaan rakenteeseen.

## Selitystapa

Selitä tekninen asia ensin käsitteellisesti ja sen jälkeen käytännön tasolla.

Käytä tarvittaessa:

- esimerkkejä
- taulukoita
- komentoja
- kaavioita
- kuvia
- vaiheittaisia kuvauksia

Esimerkkien tulee vastata selitettyä teoriaa.

Älä yksinkertaista teknistä asiaa tavalla, joka johtaa väärään käsitykseen.

## Tekninen täsmällisyys

Teknisten väitteiden tulee olla täsmällisiä.

Tarkista erityisesti:

- protokollien toimintaperiaatteet
- osoitteistus
- verkkokerrosten käsitteet
- pakettien ja kehysten käsittely
- reititys
- verkkolaitteiden toiminta
- tietoturvaan liittyvät väitteet

Älä esitä epävarmaa tietoa varmana.

Älä keksi teknisiä faktoja.

## Lähdemateriaalin käyttö

Lähdemateriaalia käytetään teknisen dokumentaation tietolähteenä.

Älä kopioi lähdemateriaalia sellaisenaan.

Muodosta tiedosta itsenäinen tekninen selitys.

Jos lähdemateriaali sisältää teknisesti vanhentunutta, puutteellista tai epäselvää tietoa, tarkista asia luotettavasta teknisestä lähteestä.

Älä siirrä dokumentaatioon lähdemateriaalin hallinnollista sisältöä.

## Rajaus

Dokumentaatioon ei sisällytetä:

- kurssiaikatauluja
- tehtävänantoja
- harjoituksia
- tenttejä
- arviointikriteerejä
- suoritusohjeita
- hallinnollisia ohjeita
- videoita
- videolinkkejä

Pidä sisältö käyttäjän pyytämän aiheen mukaisena.

Älä laajenna yksittäistä aihetta kokonaiseksi toiseksi aihealueeksi ilman tarvetta.

## Päällekkäisyys

Vältä tarpeetonta sisällön toistamista.

Jos asia on käsitelty toisessa dokumentissa, käytä tarvittaessa sisäistä linkkiä ja käsittele nykyisen aiheen kannalta vain tarvittava osa.

Lyhyt kertaus on sallittu, jos se auttaa lukijaa ymmärtämään nykyisen aiheen.

Älä kopioi kokonaisia aiemmin kirjoitettuja selityksiä.

## Otsikot

Käytä kuvaavia otsikoita.

Otsikoiden tulee muodostaa looginen hierarkia.

Älä käytä otsikoita pelkkään visuaaliseen korostamiseen.

## Koodit ja komennot

Käytä koodilohkoja, kun esitetään:

- Linux-komentoja
- verkkolaitteiden komentoja
- konfiguraatioita
- IP-osoitteita sisältäviä esimerkkejä
- ohjelmakoodia
- protokollaviestejä

Jokainen avattu Markdown-koodilohko on aina suljettava.

Älä jätä koodilohkoa avoimeksi.

Älä esitä ympäristöstä riippuvaa komentotulostetta yleispätevänä tuloksena.

## Taulukot

Käytä taulukoita tietojen selkeään vertailuun.

Taulukko sopii esimerkiksi:

- protokollien vertailuun
- verkkolaitteiden vertailuun
- osoitetyyppien vertailuun
- ominaisuuksien yhteenvetoon

Älä käytä taulukkoa, jos normaali tekstiselitys on selkeämpi.

## Kuvat ja kaaviot

Käytä kuvia ja kaavioita, kun ne parantavat teknisen asian ymmärtämistä.

Hyviä käyttökohteita ovat esimerkiksi:

- verkkotopologiat
- pakettien kulku
- reititys
- VLAN-segmentointi
- DHCP-prosessi
- DNS-kysely
- NAT
- protokollien toimintavaiheet

Kuvien tulee olla teknisesti täsmällisiä.

Älä lisää kuvia pelkäksi koristeeksi.

## MkDocs Material

Käytä MkDocs Materialin ominaisuuksia vain silloin, kun ne parantavat tiedon esittämistä.

Admonition-laatikoita voidaan käyttää esimerkiksi:

- lisätietoon
- tärkeään huomioon
- varoitukseen
- tekniseen huomautukseen

Älä käytä niitä mekaanisesti jokaisessa dokumentissa.

## Turvallisuus

Tietoturvaan liittyvä sisältö tulee esittää teknisesti täsmällisesti ja puolustuksellisesta näkökulmasta.

Kuvaa tarvittaessa:

- uhka
- hyökkäyspinta
- vaikutus
- suojausmekanismi
- rajoitukset

Älä lisää tarpeettomia ohjeita todellisten järjestelmien väärinkäyttöön.

## Muutosten periaate

Säilytä olemassa oleva sisältö ja rakenne, ellei käyttäjän pyyntö edellytä muutosta.

Tee pienin muutos, joka täyttää tehtävän.

Älä tee käyttäjän pyytämättömiä sisältöparannuksia.

## Laadun vähimmäisvaatimukset

Ennen sisällön valmistumista varmista:

- tekninen oikeellisuus
- selkeä suomen kieli
- johdonmukainen terminologia
- looginen eteneminen
- toimivat esimerkit
- ehjä Markdown-rakenne
- suljetut koodilohkot
- tarpeeton päällekkäisyys on vältetty
- sisältö pysyy määritellyssä rajauksessa