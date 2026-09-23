# Mitä on tietoverkko?

**Tietoverkko** (*data network*) on laitteiden ja laitteistojen ryhmä, joka on
yhteydessä toistensa kanssa tiedon vaihtamista varten. Tietoverkon perusidea on
yksinkertainen: *yhdistää lähetti ja vastaanottajan siten, että tieto voi kulkea
yhdestä paikasta toiseen.*

---

## Verkon peruskäsitteet

### Solmu (Node)

**Solmu** (*node*) on mikä tahansa laitteisto, joka on yhteydessä verkkoon ja kykenee
välittämään tai vastaanottamaan paketteja. Esimerkkejä ovat:

- Päätelaitteet (työasemat, älypuhelimet, älykellot)
- Palvelimet (tiedostopalvelimet, web-palvelimet)
- Välityslaitteet (kytkimet, reitittimet, palomuurit)
- Siirtymättömät laitteet (esim. esineiden Internetin anturit)

Jokainen solmu on yksilöiltu **-verkko-osoitteella** (*network address*) –
myöhemmän osioissa tarkasteltavassa IPv4- tai IPv6-muodossa.

### Yhteys (Link)

**Yhteys** (*link*) on kanava, jolla kaksi solmua voivat vaihtella tiedon. Yhteys
voi olla:

- **Langallinen** (langallinen Ethernet, optinen kaapeli)
- **Langaton** (WiFi, Bluetooth, langattomat verkot)

Solmut ja yhteydet muodostavat verkkografin, jossa jokainen solmu on solmu, joka
on yhdistetty yhteydelle. Tämä on tärkeä käsite, koska verkon suorituskyky ja
luotettavuus riippuvat yhteyksien kapasiteetista ja topologiasta.

### Paketti (Packet)

**Paketti** (*packet*) on verkossa kulkeva ainekohtainen yksikkö, joka sisältää:

1. **Päädata** (*payload*) – todellinen siirrettävä tiedosto tai viesti
2. **Otsaketiedot** (*header*) – lähettäjän ja vastaanottajan osoitteet, paketin
   koko, virhenumerot ja muut hallintotiedot
3. **Loppukortti** (*trailer* tai *footer*) – joskus virhekäsittelyn tiedot (esim. FCS)

!!! info "Lisätietoa: Pakettiverkointi"

    Paketointi on keskeinen periaate. Sen sijaan, että koko tiedosto kulkeekseen
    yhden yhteyden kautta, se jaetaan pienempiin paketteihin, jotka kulkevat riippum
    toisistaan. Tämä mahdollistaa:

    - **Reittien monipuolisuuden:** eri paketit voivat kieppua eri reiteillä.
    - **Virhekäsittelyn:** yksittäisten paketin virhe ei korota koko tiedostoa.
    - **Kapasiteetin hallinnan:** pakettien koon ja nopeuden voi säätää eri sovelluksille.

    Tämä on erityisen tärkeää, kun otetaan huomioon, että verkon läpikulku ei ole
    yhtenäinen – paketit voivat kulkea eri reiteillä ja kokemina eri viiveinä.

### Protokolla (Protocol)

**Protokolla** (*protocol*) on sääntöjoukko, joka määrittelee, miten laitteet
viestivät keskenään. Protokollat määrittelevät:

- Miten paketit muotoillaan (muoto/struktuuri)
- Milloin ja miten lähetetään tiedon
- Miten vastaanotetaan ja prosessoidaan tiedot
- Miten käsitellään virheet ja uudelleenlähetys

Esimerkkejä ovat Ethernet (käsittelee fyysisen siirron), IPv4 (osoitteistus ja
reittiminen), TCP (luotettava kuljetus) ja HTTP (sovellussuhtelu).

---

## Digitaalisen tiedon esitys

### Bitti ja tavu

- **Bitti** (*bit*, engl. *binary digit*) on digitaalisen tiedon pienin yksikkö.
  Se voi saada arvon 0 tai 1.
- **Tavu** (*byte*) koostuu 8 bitistä. Tämä on standardi, jonka oikeus on
  useimmassa nykyaikaisissa järjestelmissä (katso IEEE Std 100, IETF RFC 1122).

!!! info "Lisätietoa: Bitin ja tavun väliestä"

    Historiallisesti tavun koko on ollut järjestelmäkohtainen (eri valmistajat ovat
    käyttäneet 6-, 7-, 8- ja jopa 9-bittisitä tavuja). ISO/IEC 80000-13 -standardi
    määrittelee tavun 8 bittinä virallisen mittayksikönä. Vaikka joissain järjestelmissä
    (esim. jotkut tavoitteet) käytetään 7-bittisia tavuja ASCII-koodauksessa,
    nykyään 8-bittinen tavu on vallitseva standardi.

### Binäärijärjestelmä

**Binäärijärjestelmä** (*binary*) käyttää kahden numeromerkin (0 ja 1) järjestelmää.
Jokainen bitin asema määrittelee sen arvon perusteella 2:n potenssin:

```text
Bitin arvo:     1   0   1   1   0   0   1   0
Positioitu:     7   6   5   4   3   2   1   0
Arvo:         128   0  32  16   0   0   4   0
                              = 180 desimaalina
```

### Heksadesimaalimuoto (HEX)

**Heksadesimaali** (*hexadecimal, HEX*) käyttää 16-merkkiä järjestelmää (0–9 ja
A–F). Se on tietyssä määrin käytetty verkko-osoitteiden esittämiseen (esim.
MAC-osoitteet, vaiheessa tarkastellaan tarkemmin osiossa [Mac-osoitteet](../02-ethernet/mac-osoitteet.md)).

Esimerkiksi MAC-osoite `00:1A:2B:3C:4D:5E` on esitetty heksadesimaalimuodossa.

### Tekstin koodaus

- **ASCII** (*American Standard Code for Information Interchange*): 7-bittisestä
  merkistöstä, jossa jokainen kirjain on määritelty 0–127 välillä. Esim. 'A' = 65.
- **UTF-8** (*Unicode Transformation Format - 8-bit*, IETF RFC 3629):
  Unicode-merkkistön 8-bittisessä koodauksessa, joka on nykyinen internetin
  vakiintunut standardi. Se tukee kaikkia maailman kieliä.
- **BASE64** (IETF RFC 4648): binaarisen tiedon koodaus 64-merkkiseen
  tekstimuotoon, usein käytetty sähköpostin liitteissä ja API-otentuksissa.

!!! info "Lisätietoa: Miksi UTF-8 on tärkeä?"

    Ennen kuin UTF-8 vallitsi, eri maat käyttivät omia koodauksiaan (esim. ISO
    8859-1 Länsi-Euroopassa, Shift_JIS Japanissa). Tämä johti siihen, että sama
    bittisekvenssi näytti erottavasti eri merkkejä eri kielissä. UTF-8 ratkaisee
    tämän yhdellä maailmanlaajuisella standardilla, ja se on tällä hetkell yli
    95 % kaikista web-sivuista (katso WHATWG Encoding Standard, WHATWG URL
    Standard).

### Tiedonsiirronopeus

Tiedonsiirtonopeudet ilmaistaan kahdella eri yksiköllä:

| Yksikkö | Selitys | Esimerkki |
| ------ | ------- | ------ |
| **b** (bitti) | Yksittäinen bitti | 1 Mb/s = 1 000 000 bittiä / sekunti |
| **B** (tavu) | 8 bittiä | 1 MB/s = 8 000 000 bittiä / sekunti |

!!! varoitus "Tärkeä erottelu: Mb/s vs MB/s"

    Useimmissa kotiverkoissa mainitaan nopeudet usein "100 Mbps" tai "1 Gbps",
    mutta tosiasiassa kyseessä on usein **bitit** (b), ei **tavut** (B).

    Esimerkiksi:
    - 100 Mb/s (bitit) ≈ 12,5 MB/s (tavut)
    - 1 Gb/s ≈ 125 MB/s

    Tämä erottelu on olennainen, ja se koskee kaikkia verkkoissa ja
    liitetyksiin kuuluvat standardit. Käytännössä, kun verkonopeus mainitaan,
    siitä kyse on yleensä biteistä, eli **b** merkillä.

---

## Internetin infrastruktuuri

### IANA – Internet Assigned Numbers Authority

**IANA** (*Internet Assigned Numbers Authority*) vastaa maailmanlaajuisista
IP-osoitteiden ja Autonomous System -numeroiden (ASN) jakamisesta. IANA:n
toiminta perustuu kansainväliseen yhteistyöhön IETF:n ja IEEE:n standardien
kehittämisen kanssa.

IANA jakaa osoitteet **Regional Internet Registries (RIR)** -järjestelmän kautta:

| RIR | Alue | Kattavuus |
| ---- | ---- | --------- |
| **AFRINIC** | Afrikka | Kuutinen paja-asteet |
| **APNIC** | Aasia ja Tyyninen valtameri | laaja alue |
| **ARIN** | Pohjoosaameerika, Karibia | Kanada, Yhdysvallat |
| **LACNIC** | Latinalainen Amerkia, Karibia | Koko kaakausalue |
| **RIPE NCC** | Eurooppa, Lähi-itä, Keski-Aasia | laaja alue |

!!! info "Lisätietoa: RIR-järjestelmä"

    RIR-systeemi varmistaa, että IP-osoitteita ja ASN-numeroita ei kovhdu
    kahdella tahdulla käyttöön samanaikaisesti. Jokainen RIR saa osoitteita IANA:ltä
    ja jakaa ne paikallisille operaatioille ja organisaatioille. Tämä on keskeinen
    mekanismi, joka ylläpitää internetin globaalia johdonmukaisuutta.

### IETF – Internet Engineering Task Force

**IETF** (*Internet Engineering Task Force*) on avoin, kansainvälinen järjestö,
joka kehittää ja ylläpitää internetin arkkitehtuurin standardeja. IETF julkaisee
standardinsa **RFC** (Request for Comments) -dokumentteina, jotka ovat
tekijällisesti osa internetin toteutusta.

Tärkeitä RFC-ohjeita, jotka liittyvät tähän aiheeseen:

- **RFC 791** – *Internet Protocol (IPv4)*
- **RFC 826** – *Address Resolution Protocol (ARP)*
- **RFC 1042** – *Ethernet-pohjaisen verkon käyttö IP:n kanssa*
- **RFC 1122** – *Requirements for Internet Hosts – Communication Layers*

### IEEE – Institute of Electrical and Electronics Engineers

**IEEE** (*Institute of Electrical and Electronics Engineers*) on
tietotekniikan standardointiin tähtäävä kansainvälinen järjestö. IEEE
kehittää standardeja fyysisistä ja linkkikerron protokoloista.

Tärkeitä standardeja:

- **IEEE 802.3** – *Ethernet* (langallinen verkko)
- **IEEE 802.11** – *Wireless LAN (WLAN)* (langaton verkko)
- **IEEE 802.1Q** – *Virtual Bridged LANs (VLAN-taggaus)*
- **IEEE 802.1D** – *Spanning Tree Protocol (STP)*

### ISP – Internet Service Providers

**ISP** (*Internet Service Provider*) on yritys, joka tarjoaa internet-yhteyksiä
asiakkaille. ISP:t luokitellaan kolmeen tasoon:

| Taso | Selitys | Esimerkki |
| ---- | ------- | --------- |
| **Tier 1** | Globaalit operaattorit, jotka voivat kattaa koko maanosien liikennettä ilman muiden ISPlien maksamista | Level 3, NTT, Tata |
| **Tier 2** | Monipaikkalliset operaattorit, jotka voivat liikenteen kauas-kauempiin mutta myös paikalliseen | Paikalliset operaattorit |
| **Tier 3** | Paikalliset operaattorit, jotka tarjoavat loppukäyttäjille pääsyä | Kaukalaitosoperaattorit |

### IXP – Internet Exchange Point

**IXP** (*Internet Exchange Point*) on fyysinen sija, jossa eri ISP:t voivat
vaihtaa reititystiedoillaan keskenään. Tämä vähentää liikennettä ja parantaa
verkon suorituskykyä, koska liikenne voi kulkea suoraan toisen operaattorin
läpi.

Esimerkiksi Suomessa tärkeä IXP on **FICIX** (*Finnish Communication and
Internet Exchange*), joka on yhdistänyt useita suomalaisia operaattoreita.

### PoP – Point of Presence

**PoP** (*Point of Presence*) on fyysinen sija, josta ISP voi tarjota palvelujaan
alueellisessa verkostossaan. PoP voi sisältää reitittimiä, palvelimia ja muuta
välityslaitteistoa.

!!! info "Lisätietoa: PoP ja verkon laajuus"

    Useimmat suuret operaattorit ylläpitävät useita PoP-sija-oja eri puolilla
    maailmaa. Tämä auttaa liikenteen kulkemista lähempänä kuluttajaa, mikä
    vähentää latenssia ja parantaa käyttökokemusta.

### Ilmailuverkot (Air-gapped)

**Air-gapped verkot** (*air-gapped networks*) ovat verkot, jotka eivät ole
yhteydessä internetiin tai muihin ulkopuoliin verkoihin. Ne ovat erityisen
turvallisia ympäristöissä, kuten:

- Teollisuuslaitokset (esim. automaatit)
- Ydinvoimalat
- Sotilas- ja operaatiot ympäristöt

Koska näillä verkoilla ei ole ulkopuollista yhteyttä, niitä on vaikea hyödyntää
verkko-iskuista. Silti, tietoturva- ja logiikka-virheet voivat olla paikassa,
kun tiedot siirretään näistä verkoista erikseen.

!!! varoitus "Tärkeä huomio: Air-gap ei takaa turvaa"

    Usein ajatellaan, että "air-gapped" tarkoittaa täysin turvaa verkkoa. Tässä
    on kuitenkin rajoja: tiedonsiirto USB-mokkulalla tai muulla fyysisellä
    mediassa voi olla läpäisevä keino, jota hyödyntävät esim. Stuxnet-trojainen.
    Näin ollen air-gap onkin turvatoimenpidettä, ei pelkkää fyysistä erottelua.
