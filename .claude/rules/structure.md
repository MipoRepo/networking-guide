---
name: structure
description: Määrittää tietoverkkodokumentaation tiedosto-, otsikko-, navigaatio- ja Markdown-rakenteen periaatteet.
---

# Structure Rules

## Tarkoitus

Määritä projektin dokumentaation rakenteelliset periaatteet.

Rakenteen tulee tehdä dokumentaatiosta:

- helposti navigoitava
- johdonmukainen
- ylläpidettävä
- laajennettava
- teknisesti selkeä

## Dokumentaation juurihakemisto

Dokumentaatio sijaitsee:

`docs/`

Älä luo `docs/`-hakemiston rinnalle vaihtoehtoista dokumentaatiorakennetta.

## Pääaiheet

Dokumentaatio rakentuu seuraavista pääaiheista:

1. Johdatus tietoverkkoihin
2. Ethernet, kytkentä ja VLAN
3. IPv4, aliverkot ja ARP
4. DHCP ja staattinen reititys
5. Verkkolaitteet ja kaapelointi
6. Spanning Tree
7. IPv4-reititys
8. Verkon turvallisuus
9. IPv4 NAT
10. TCP, UDP, SSH ja HTTP
11. Palvelimet, päätelaitteet ja WLAN
12. DNS
13. IPv6
14. BGP

Säilytä olemassa oleva pääaiheiden rakenne.

Älä luo uusia pääaiheita ilman käyttäjän pyyntöä tai perusteltua rakenteellista tarvetta.

## Hakemistot

Pääaiheet sijoitetaan nykyisen projektirakenteen mukaisiin hakemistoihin:

```text
docs/
├── 01-johdatus/
├── 02-ethernet-kytkenta-vlan/
├── 03-ipv4-aliverkot-ja-arp/
├── 04-dhcp-ja-staattinen-reititys/
├── 05-verkkolaitteet-ja-kaapelointi/
├── 06-spanning-tree/
├── 07-ipv4-reititys/
├── 08-verkon-turvallisuus/
├── 09-ipv4-nat/
├── 10-tcp-udp-ssh-http/
├── 11-palvelimet-paatelaitteet-wlan/
├── 12-dns/
├── 13-ipv6/
└── 14-bgp/
```

Noudata projektissa jo käytössä olevia tiedostonimiä ja hakemistoja.

Älä nimeä olemassa olevia tiedostoja uudelleen ilman käyttäjän pyyntöä.

## Tiedostojen rajaus

Yksi Markdown-tiedosto käsittelee yhtä selkeästi rajattua aihetta tai siihen läheisesti liittyvää kokonaisuutta.

Älä yhdistä toisistaan riippumattomia aiheita samaan tiedostoon vain tiedostomäärän vähentämiseksi.

Älä myöskään pilko yhtä selkeää kokonaisuutta tarpeettoman moneen tiedostoon.

## `index.md`

Pääaiheen `index.md` toimii kyseisen aihealueen johdantona tai sisältösivuna, jos sellainen on projektin rakenteessa.

Älä muuta sen roolia ilman käyttäjän pyyntöä.

## Otsikkohierarkia

Markdown-tiedostossa käytä loogista otsikkohierarkiaa:

```markdown
# Pääotsikko

## Alaotsikko

### Alakohta
```

Käytä `#`-tasoa dokumentin pääotsikolle.

Älä hyppää otsikkotasoja ilman perusteltua syytä.

Älä käytä otsikoita pelkkään tekstin visuaaliseen suurentamiseen.

## Dokumentin alku

Dokumentti alkaa selkeällä pääotsikolla.

Sen jälkeen voidaan esittää lyhyt johdanto, joka kertoo:

- mistä dokumentissa on kyse
- miksi aihe on merkityksellinen
- mitä dokumentissa käsitellään

Älä aloita teknistä dokumenttia tarpeettomalla metatekstillä.

## Sisällön eteneminen

Rakenteen tulee edetä mahdollisuuksien mukaan:

1. peruskäsite
2. tarkoitus
3. toimintaperiaate
4. rakenne tai komponentit
5. käytännön toiminta
6. esimerkki
7. rajoitukset tai erityistapaukset

Järjestystä voidaan muuttaa aiheen mukaan, jos tekninen kokonaisuus sitä edellyttää.

## Linkitys

Käytä sisäisiä Markdown-linkkejä dokumenttien välillä.

Esimerkiksi:

```markdown
[IPv4-osoitteet](../03-ipv4-aliverkot-ja-arp/ipv4-osoitteet.md)
```

Linkin tulee osoittaa olemassa olevaan ja tarkoituksenmukaiseen dokumenttiin.

Älä luo linkkejä kuvitteellisiin tiedostoihin.

## Navigaatio

Projektin navigaatio määritellään `mkdocs.yml`-tiedostossa.

Kun uusi dokumentti lisätään navigaatioon:

- käytä olemassa olevaa rakennetta
- sijoita sivu oikeaan pääaiheeseen
- säilytä nykyinen järjestys
- muuta vain tarvittava `nav:`-kohta

Älä järjestä muuta navigaatiota uudelleen ilman käyttäjän pyyntöä.

Jos tehtävä koskee vain Markdown-tiedostoa, älä muuta `mkdocs.yml`-tiedostoa.

## Kuvat

Kuvat sijoitetaan projektin nykyisen kuvarakenteen mukaisesti.

Markdown-kuvan rakenne:

```markdown
![Kuvan kuvaus](../assets/images/esimerkki.png)
```

Kuvan suhteellisen polun tulee olla oikein suhteessa Markdown-tiedostoon.

Alt-tekstin tulee kuvata kuvan sisältöä tai tarkoitusta.

## Kaaviot

Kaavio voidaan toteuttaa esimerkiksi Mermaidilla, jos projekti tukee sitä.

Kaavion tulee:

- vastata teknistä sisältöä
- olla luettavissa
- käyttää johdonmukaista rakennetta
- olla osa dokumentin sisältöä eikä pelkkä koriste

Älä lisää kaaviota, jos sama asia on selkeämpi tekstinä tai taulukkona.

## Taulukot

Taulukoita käytetään, kun tietoa on tarkoituksenmukaista verrata rinnakkain.

Pidä taulukot selkeinä.

Älä sijoita pitkiä tekstikappaleita taulukon soluihin, jos normaali Markdown-rakenne olisi parempi.

## Koodilohkot

Käytä koodilohkoja komennoille, konfiguraatioille, ohjelmakoodille ja protokollaviesteille.

Esimerkiksi:

```bash
ip addr
ip route
```

Jokainen avattu koodilohko on suljettava.

Jos Markdownissa esitetään toinen Markdown-koodilohko, käytä tarvittaessa eri aitauksen pituutta, jotta rakenteet eivät rikkoudu.

## Admonition-rakenteet

MkDocs Materialin admonition-laatikoita voidaan käyttää:

- tärkeisiin huomioihin
- varoituksiin
- lisätietoon
- rajauksiin

Esimerkiksi:

```markdown
!!! info "Lisätietoa"

    Lisätietoa aiheesta.
```

Älä käytä admonitioneja tavallisten kappaleiden korvikkeena.

## Tiedostojen väliset riippuvuudet

Kun dokumentti viittaa toiseen dokumenttiin:

- käytä toimivaa suhteellista polkua
- varmista kohteen olemassaolo tarvittaessa
- vältä tarpeetonta ristiviittausten määrää

Jos dokumentti tarvitsee toisen aiheen ymmärtämiseksi olennaista taustatietoa, anna lyhyt tarvittava selitys ja linkitä laajempaan käsittelyyn.

## Päällekkäisyys

Rakenteen tulee vähentää tarpeetonta tiedon toistamista.

Sama asia voi esiintyä useassa dokumentissa lyhyenä kertauksena, mutta täydellinen selitys sijoitetaan ensisijaisesti yhteen tarkoituksenmukaiseen paikkaan.

Käytä sisäisiä linkkejä täydentämään kokonaisuutta.

## Muutosten periaate

Säilytä nykyinen rakenne, ellei käyttäjän pyyntö edellytä sen muuttamista.

Tee pienin rakenteellinen muutos, joka täyttää tehtävän.

Älä nimeä tai siirrä tiedostoja ilman tarvetta.

Älä järjestä koko dokumentaatiota uudelleen yhden muutoksen vuoksi.

## Kontekstin hallinta

Pienen rakenteellisen muutoksen yhteydessä:

- avaa vain tarvittavat tiedostot
- älä lue koko `docs/`-hakemistoa
- älä lue koko repositorya
- älä lue `materiaali/`-hakemistoa ilman tarvetta
- älä lue vanhoja todo-versioita

Laajassa dokumentointiprosessissa noudata `CLAUDE.md`-tiedoston todo-ohjeita.

## Verifiointi

Rakennemuutoksen jälkeen tarkista muutoksen laajuuden mukaan:

- tiedoston sijainti
- tiedostonimi
- otsikkohierarkia
- Markdown-syntaksi
- sisäiset linkit
- kuvapolut
- navigaatio tarvittaessa
- koodilohkojen sulkeminen

Jos muutos koskee `mkdocs.yml`-tiedostoa, tarkista myös YAML-rakenne.

## Älä tee näitä ilman käyttäjän pyyntöä

- Älä rakenna `docs/`-hakemistoa uudelleen.
- Älä nimeä kaikkia tiedostoja uudelleen.
- Älä siirrä dokumentteja ilman tarvetta.
- Älä järjestä navigaatiota uudelleen.
- Älä muuta `mkdocs.yml`-tiedostoa ilman tarvetta.
- Älä refaktoroi CSS:ää.
- Älä lue koko repositorya pienen muutoksen vuoksi.
- Älä lue vanhoja todo-versioita.
- Älä aloita seuraavaa todo-tehtävää automaattisesti.
- Älä tee käyttäjän pyytämättömiä rakenteellisia parannuksia.

## Laadun vähimmäisvaatimus

Rakenteen katsotaan olevan kunnossa, kun:

- tiedosto sijaitsee oikeassa hakemistossa
- tiedoston nimi noudattaa projektin käytäntöä
- otsikkohierarkia on looginen
- sisäiset linkit osoittavat oikeisiin kohteisiin
- kuvat käyttävät oikeita polkuja
- navigaatio vastaa rakennetta silloin, kun navigaatio kuuluu tehtävään
- Markdown-rakenne on ehjä
- koodilohkot on suljettu
- dokumentaatio ei sisällä tarpeetonta rakenteellista päällekkäisyyttä