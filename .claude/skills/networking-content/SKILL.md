---
name: networking-content
description: Kirjoita ja muokkaa teknisesti luotettavaa suomenkielistä tietoverkkodokumentaatiota projektin rakenteen ja lähdeperiaatteiden mukaisesti.
---

# Networking Content

## Tarkoitus

Tuota tietoverkkoihin liittyvää teknistä sisältöä projektin MkDocs Material -dokumentaatioon.

Tavoitteena on rakentaa selkeä, itsenäinen ja teknisesti luotettava tietopohja, joka auttaa ymmärtämään verkkoteknologioiden toimintaa eikä ainoastaan luettele niiden ominaisuuksia.

## Sisällön periaate

Selitä mahdollisuuksien mukaan:

- mitä teknologia tai käsite on
- miksi sitä tarvitaan
- miten se toimii
- missä sitä käytetään
- miten se liittyy muihin verkkoteknologioihin
- mitä ongelmaa se ratkaisee
- mitkä ovat sen rajoitukset ja riskit

Etene käsitteistä toimintaan ja toiminnasta käytännön esimerkkeihin.

Älä täytä sisältöä tarpeettomalla tekstillä.

## Kohderyhmä

Kirjoita teknisesti täsmällisesti mutta ymmärrettävästi.

Oleta, että lukija haluaa ymmärtää verkkoteknologian toimintaperiaatteen eikä vain opetella määritelmää ulkoa.

Kun tekninen asia on monimutkainen:

1. esittele käsite
2. selitä sen toimintaperiaate
3. kuvaa tarvittaessa viestintä- tai käsittelyvaiheet
4. anna käytännön esimerkki
5. käsittele olennaiset rajoitukset tai poikkeukset

Älä yksinkertaista asiaa tavalla, joka tekee selityksestä teknisesti väärän.

## Terminologia

Kirjoita ensisijaisesti suomeksi.

Käytä vakiintunutta englanninkielistä teknistä termiä suomenkielisen termin rinnalla silloin, kun se helpottaa ymmärtämistä tai vastaa alan yleistä terminologiaa.

Esimerkiksi:

- kytkin (switch)
- reititin (router)
- virtuaalinen lähiverkko (VLAN)
- osoitteenmuunnos (NAT)
- verkkotunnusjärjestelmä (DNS)
- siirtokerroksen protokolla (transport protocol)

Älä keksi uusia suomenkielisiä termejä vakiintuneiden termien tilalle.

Lyhenteen ensimmäisen esiintymän yhteydessä kirjoita tarvittaessa koko nimi.

## Tekninen täsmällisyys

Tarkista erityisesti:

- OSI- ja TCP/IP-mallien käsitteet
- Ethernet
- MAC-osoitteet
- VLAN
- ARP
- IPv4
- IPv6
- aliverkot
- DHCP
- DNS
- NAT
- reititys
- TCP
- UDP
- HTTP
- SSH
- WLAN
- Spanning Tree
- palomuurit
- BGP

Erota toisistaan protokolla, mekanismi, laite, palvelu, osoite, paketti, kehys ja muu tekninen käsite.

Älä käytä termejä toistensa synonyymeina, jos niiden tekninen merkitys eroaa.

## Esimerkit

Käytä käytännön esimerkkejä silloin, kun ne auttavat ymmärtämään toimintaa.

Esimerkki voi olla esimerkiksi:

- IP-osoite
- aliverkko
- reititystaulu
- Ethernet-kehys
- ARP-kysely
- DHCP-prosessi
- DNS-kysely
- TCP-yhteyden muodostaminen
- NAT-muunnos
- VLAN-konfiguraatio
- Linux-komento

Esimerkin tulee vastata selitettyä teoriaa.

Älä käytä esimerkissä sellaisia arvoja tai asetuksia, jotka voivat johtaa lukijaa harhaan.

## Komennot

Linux- ja verkkokomentoja voidaan käyttää havainnollistamiseen.

Esimerkiksi:

```bash
ip addr
ip route
ip neigh
```

Selitä tarvittaessa, mitä komento tekee ja mitä sen tulosteesta voidaan päätellä.

Älä esitä ympäristöstä riippuvia tuloksia yleispätevinä faktoina.

Älä sisällytä salasanoja, API-avaimia, yksityisiä avaimia tai muuta arkaluonteista tietoa.

## Taulukot

Käytä taulukoita, kun tietoa on luontevaa verrata rinnakkain.

Sopivia käyttötarkoituksia ovat esimerkiksi:

- TCP vs. UDP
- IPv4 vs. IPv6
- hub vs. switch
- reititin vs. palomuuri
- staattinen vs. dynaaminen reititys
- yksityiset vs. julkiset IPv4-osoitteet

Älä käytä taulukkoa silloin, kun asia tarvitsee normaalin selityksen.

## Kaaviot ja kuvat

Käytä kaavioita tai kuvia, kun niiden avulla voidaan havainnollistaa esimerkiksi:

- verkkotopologiaa
- paketin kulkua
- protokollan toimintaa
- kerrosten välistä toimintaa
- osoitteenmuunnosta
- reititystä
- VLAN-segmentointia
- DHCP- tai DNS-prosessia

Kuvan tulee lisätä ymmärrystä eikä toimia pelkkänä koristeena.

Jos kaavion tekninen rakenne voidaan esittää täsmällisesti tekstinä tai Mermaid-kaaviona, suosi sitä silloin, kun se sopii projektin nykyiseen toteutustapaan.

## Lähteet

Käytä teknisten väitteiden tarkistamiseen ensisijaisesti luotettavia lähteitä:

- IETF RFC:t
- IEEE-standardit
- Linuxin virallinen dokumentaatio
- verkkolaitteiden valmistajien virallinen dokumentaatio

Jos lähdemateriaali ja tekninen ensisijainen lähde ovat ristiriidassa, älä automaattisesti seuraa lähdemateriaalia.

Tarkista ristiriita ja esitä teknisesti perusteltu tieto.

Älä keksi lähteitä tai lähdeviitteitä.

## Lähdemateriaalin muuntaminen

Lähdemateriaali toimii dokumentaation tietolähteenä.

Älä kopioi lähdemateriaalia sellaisenaan.

Muodosta sen perusteella itsenäinen tekninen selitys.

Älä siirrä dokumentaatioon:

- kurssiaikatauluja
- tehtävänantoja
- harjoituksia
- tenttejä
- arviointia
- suoritusohjeita
- hallinnollisia ohjeita
- videoita
- videolinkkejä

Jos lähdemateriaalissa on teknisesti epäselvä tai vanhentunut väite, tarkista se ennen julkaisemista.

## Sisällön rajaus

Pidä dokumentti käyttäjän pyytämän aiheen sisällä.

Jos aihe on esimerkiksi ARP:

- käsittele ARP:n tarkoitus
- käsittele sen toimintaperiaate
- käsittele ARP-cache
- käsittele tyypillinen ARP-kysely ja vastaus
- käsittele olennaiset rajoitukset ja tietoturvanäkökohdat

Älä samalla kirjoita kokonaista IPv4-, Ethernet- tai verkkoturvallisuuslukua, ellei käyttäjä pyydä sitä.

Jos toinen aihe tarvitsee erillisen dokumentin, viittaa siihen tarvittaessa sisäisellä Markdown-linkillä.

## Dokumentin rakenne

Sopiva tekninen dokumentti voi käyttää esimerkiksi rakennetta:

# Aihe

Lyhyt johdanto.

## Mikä on X?

Peruskäsite.

## Miksi X tarvitaan?

Ongelma ja tarkoitus.

## Miten X toimii?

Toimintaperiaate ja tarvittaessa vaiheet.

## Esimerkki

Konkreettinen tapaus.

## Rajoitukset ja erityistapaukset

Olennaiset poikkeukset, rajat ja riskit.

## Yhteenveto

Lyhyt yhteenveto vain silloin, kun se aidosti auttaa lukijaa.

Älä pakota jokaista dokumenttia tähän rakenteeseen. Käytä rakennetta aiheen ehdoilla.

## MkDocs Material

Hyödynnä projektissa käytössä olevia MkDocs Material -ominaisuuksia tarkoituksenmukaisesti.

Admonition voidaan esimerkiksi esittää:

```markdown
!!! info "Lisätietoa"

    Tässä voidaan esittää olennainen lisätieto.
```

Käytä admonition-laatikoita vain silloin, kun ne parantavat tiedon hahmottamista.

## Markdown

Noudata Markdownin ja MkDocs Materialin syntaksia.

Jokainen avattu koodilohko on aina suljettava.

Tarkista erityisesti:

- otsikkohierarkia
- listat
- taulukot
- linkit
- kuvat
- koodilohkot
- admonition-rakenteet
- sisäiset viittaukset

Älä jätä Markdown-rakenteita avoimiksi tai rikkinäisiksi.

## Kontekstin hallinta

Käytä mahdollisimman pientä tehtävän kannalta riittävää kontekstia.

Kun käyttäjä pyytää yhden dokumentin kirjoittamista:

- lue kyseinen tiedosto, jos se on olemassa
- lue vain tarvittava lähdemateriaali
- tarkista vain tarvittavat tekniset lähteet
- älä lue koko repositorya

Älä lue kaikkia `docs/`-tiedostoja vain yhden aiheen vuoksi.

Älä lue `todo/`-tiedostoja tavallisen sisältötehtävän yhteydessä.

Jos käyttäjä pyytää jatkamaan laajaa todo-ohjattua sisältöprosessia, noudata `CLAUDE.md`-tiedostossa määriteltyä todo-prosessia.

## Päällekkäisyys

Vältä saman teknisen tiedon tarpeetonta toistamista useissa dokumenteissa.

Kun asia on jo käsitelty toisessa dokumentissa:

- viittaa siihen
- selitä nykyisen aiheen kannalta vain tarvittava osa
- älä kopioi koko selitystä uudelleen

Päällekkäisyys on hyväksyttävää silloin, kun lyhyt kertaus on lukijan ymmärtämisen kannalta tarpeellinen.

## Turvallisuus

Kun aihe liittyy tietoturvaan, kuvaa tekniset mekanismit täsmällisesti.

Käsittele tarvittaessa:

- uhkamalli
- hyökkäyspinta
- suojausmekanismi
- rajoitukset
- väärinkäytön seuraukset

Pidä sisältö koulutuksellisena ja puolustuksellisena.

Älä sisällytä tarpeettomia toimintaohjeita todellisiin järjestelmiin tunkeutumiseen.

## Verifiointi

Ennen työn valmistumista tarkista:

- tekniset väitteet
- terminologia
- esimerkkien oikeellisuus
- Markdown-syntaksi
- koodilohkojen sulkeminen
- sisäiset linkit tarvittaessa
- ettei sisältö sisällä kurssin hallinnollista materiaalia
- ettei tehtävän ulkopuolista sisältöä ole lisätty

Laajassa dokumentissa tarkista tarvittaessa myös lähteet ja kokonaisuuden looginen eteneminen.

## Älä tee näitä ilman käyttäjän pyyntöä

- Älä lue koko repositorya.
- Älä lue kaikkia `docs/`-tiedostoja.
- Älä lue `materiaali/`-hakemistoa kokonaan.
- Älä lue vanhoja todo-versioita.
- Älä muuta `mkdocs.yml`-tiedostoa ilman tarvetta.
- Älä muuta navigaatiota ilman tarvetta.
- Älä refaktoroi CSS:ää.
- Älä järjestä dokumentaation rakennetta uudelleen.
- Älä kirjoita käyttäjän pyytämän aiheen ulkopuolista sisältöä.
- Älä tee koko dokumentaation QA-tarkistusta pienen sisältömuutoksen yhteydessä.
- Älä aloita seuraavaa todo-tehtävää automaattisesti.
- Älä tee käyttäjän pyytämättömiä parannuksia.

## Muutosten periaate

Tee pienin muutos, joka täyttää käyttäjän pyynnön.

Säilytä olemassa oleva sisältö, rakenne, tyyli ja konfiguraatio silloin, kun niitä ei tarvitse muuttaa.

Jos kirjoitat uuden dokumentin, noudata projektin nykyistä rakennetta.

Älä laajenna tehtävän laajuutta ilman perusteltua teknistä tarvetta.