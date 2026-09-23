# Ethernet

**Ethernet** (*Ethernet*) on maailman vanhin ja yleisimmistä käytetyistä
linkkikäytäntöä. Se on standardoitu IEEE:n standardilla **802.3**, joka on
päivittynyt vuosien saatossa monien muutostysten myötä, mutta sen ydinkäsitteet
ovat olleet säilyneet.

!!! info "Lähteiden standardit"

    Ethernetin virallinen standardi on IEEE 802.3.
    Se määrittelee sekä fyysiset että linkkikerron (Data Link) ominaisuudet:

    - **IEEE 802.3** – Ethernet-kehykset ja siirtomekanismit
    - **IEEE 802.3x** – Täyteen käänteeseen virtausta (full-duplex) virran hallintaa varten
    - **IEEE 802.3af / 802.3at / 802.3bt** – Power over Ethernet (PoE) -virran siirto

## Historia

Ethernetin kehittämisen lähti **Robert Metcalfe** XEROX PARCissa vuonna 1973.
Se oli aluksi osa **Alto-tietokonetta** ja sen tarkoitus oli yhdistää useita
työasemia yhdeensä. Se on kehittynyt monin versioin, kuten:

| Vuosi | Versio | Nopeus |
| --- | --- | --- |
| 1980 | 10 Mbps Ethernet | 10 Mb/s |
| 1992 | Fast Ethernet | 100 Mb/s |
| 1998 | Gigabit Ethernet | 1 Gb/s |
| 2002 | 10 Gigabit Ethernet | 10 Gb/s |
| 2006 | 40 / 100 Gigabit Ethernet | 40–100 Gb/s |

!!! warning "Nopeuden ja mediaan liittyvä huomio"

    Ethernetin nopeus riippuu medioista (kuiduista tai juotteista). Esimerkiksi
    1000BASE-SX (fibra) toimii eri etäisyyksillä kuin 1000BASE-T (juova). Katso lisätietoja
    alla olevasta taulusta.

## Ethernetin nopeuksia ja muotoja

Ethernet-osoitteet kahdella tavulla on:

1. **IEEE 802.3** määrittelee juodaan ja fyysisen välityksen
2. **IEEE 802.11** määrittelee langattoman yhteyden

Alla on yhteenveto Ethernetin eri muodoista:

### Langalliset muodot

| Standardi | Nopeus | Media | Etäisyys |
| --- | --- | --- | --- |
| 1000BASE-T | 1 Gb/s | Kierroskumi (Cat5e/Cat6) | 100 m |
| 1000BASE-SX | 1 Gb/s | Valo- tai infra-InfiniBAND | 220–550 m |
| 10GBASE-T | 10 Gb/s | Kierroskumi (Cat6a/Cat7) | 100 m |
| 10GBASE-SR | 10 Gb/s | Fibre | 300 m |
| 40GBASE-SR4 | 40 Gb/s | Fibre | 100 m |
| 100GBASE-SR4 | 100 Gb/s | Fibre | 70 m |

### Langattomat muodot

| Standardi | Nopeus | Taajuu | Huomio |
| --- | --- | --- | --- |
| IEEE 802.11b | 11 Mb/s | 2,4 GHz | Vanha |
| IEEE 802.11g | 54 Mb/s | 2,4 GHz | Vanha |
| IEEE 802.11n | 600 Mb/s | 2,4/5 GHz | Hyväksytty |
| IEEE 802.11ac | 3,2 Gb/s | 5 GHz | Hyväksytty |
| IEEE 802.11ax | 9,6 Gb/s | 2,4/5/6 GHz | Nykyinen (Wi-Fi 6) |

!!! info "Ethernet-tunnusluvut: BASE ja -R"

    Ethernetin standardin nimi muodostuu usein kahdesta osasta:

    - **BASE** tarkoittaa **Baseband** (kaikki kaista on käytössä yhtäaikaisesti)
    - **-T / -TX / -SX / -LX** ovat media-tyyppejä:
      - `-T` = juova (untwisted pair)
      - `-TX` = kahdenverkointi
      - `-SX` = lyhyt etäisyys (valkoinen kuidu)
      - `-LX` = pitkä etäisyys (monokrominen kuidu)

    Esimerkiksi 1000BASE-T tarkoittaa 1 Gbit/s, baseband-muotoista, juovakytkentää.

## Ethernet-osoitteet

Ethernet on yksi vakiintuneimmista osoitteistoista verkkojen historian. Sen
tärkein piirre on, että se toimii **paketoimattomana** (stateless) – jokainen laite
saa oman osoitteensa ilman keskitettyä ohjausta. Se on tärkeä ominaisuus, joka
on osa protokollan suunnittelua:

!!! info "Ethernetin suunnittelu periaatteenä on: Yksinkertainen ja skaalautuva"

    Etenkin verkot, joissa on tuhansia laitteita, Ethernet on osoittautunut
    luotettavaksi ja helppokäyttöiseksi. Se ei vaadi keskusohjattua
    osoitteistusta, kuten esimerkiksi joissakin muissakin teknologioissa.

## Ethernet-liitannat ja kytkentät

Ethernet tukee useita fyysisiä liitoskäytäntöjä:

| Liitin | Selitys | Käyttö |
| --- | --- | --- |
| RJ-45 | 8-pollinen kiinnitys | Langallinen Ethernet |
| LC | Laser Connect | Fibre-optiikka |
| SC | Subscriber Connector | Fibre-optiikka |
| ST | Straight Tip | Fibre-optiikka |

!!! tip "Käytännön neuvo"

    Valittaessa verkkoa pidä mielessä, että nopeusrajoitus asetetaan yleensä
    samaan aikaan mediaan (kuituun tai juovaan). Esimerkiksi Cat6-juova tukee
    enintään 10 Gb/s.
