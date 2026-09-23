# Verkkotyypit

Verkot luokitellaan usein sen **käyttöalueen** ja **laajuuden** perusteella.
Tämä jako auttaa ymmártämään, mitä teknologioita ja protokollia on käytössä
jossakin, sekä mitkä on verkon suunnittelun rajoitteet.

Tyypillinen luokittelu on seuraava (piirretty esimerkiksi IETF RFC 1006 ja
IEEE 802 -dokumenteista):

| Tyyppi | Lyhenne | Mittakaava | Etäisyys | Esimerkkiteknologia |
| ------ | ------- | ---------- | -------- | ------------------- |
| Henkilökohtainen alue | PAN | 10 m | Langaton | Bluetooth, USB, NFC, Zigbee |
| Lähiverkko | LAN | 100 m | Langallinen | Ethernet (IEEE 802.3), WLAN (IEEE 802.11) |
| Kampusverkko | CAN | 1 km | Useita rakennuksia | Ethernet, fiber distributed |
| Kaupunkiverkko | MAN | 10 km | Kaupungin alue | Fiber ring (FDDI, SONET) |
| Laajiverkko | WAN | Maailmanlaajuinen | Valtavät etäisyydet | MPLS, Valokuitu, Satelliitti |

---

## PAN – Personal Area Network

**Henkilökohtainen alue** (*Personal Area Network, PAN*) on pienin
verkkotyyppi, joka yhdistää laitteita pienenä alueena ympärillä käyttäjää.
Tyypillisesti se kattaa noin 10 metren säteet.

### Käyttötarkoitus ja teknologiat

| Teknologia | Taajuu | Maksimum | Käyttö |
| ---------- | ------ | -------- | ------ |
| **Bluetooth** | 2,4 GHz | 10 m | Lisäykset, kuulokkeet, näppäimet |
| **USB** | N/A | < 1 m | Kiinteät yhteydet (lataus, tiedonsiirto) |
| **NFC** | 13,56 MHz | 10 cm | Maksut, tunnistautuminen |
| **Zigbee** | 2,4 GHz | 10 m | IoT-anturit, asennukset |

!!! info "Lisätietoa: PANin rooli IoT:ssa"

    PAN-verkot ovat keskeinen osa Esineiden Internetiä (IoT, *Internet of Things*).
    Niillä kulleet anturit ja mittaimet – esimerkiksi lämpötila- tai liikeanturit –
    voivat lähettää tiedon pienellä energiankululla. Koska PAN-verkot ovat
    pieniä ja alhaisia tehoja vaativia, ne on suunniteltu usein sillä tavalla,
    että ne voivat toimia paristollauseina vuosikymmeniksi.*

    Zigbee (IEEE 802.15.4) ja Bluetooth Low Energy ovat kaksi eninta tällaista
    teknologiaa.

### Rajoitteet

- **Lyhyt kantoalue** – useimmissa tapauksissa enintään 10 metriä.
- **Rajoittunut läpikulku** – monesti vain yksi laitteisto kerrallaan.
- **Alhainen siirtonopeus** – yleensä jokaisuus (kb/s-asteissa), ei suurten tiedostojen siirtoon.

---

## LAN – Local Area Network

**Lähiverkko** (*Local Area Network*) on verkko, joka kattaa yksittäisen
rakennuksen tai pienemmän alueen. Se on yleisesti käytetty toimistoissa,
kouluissa ja kodeissa.

### LAN-teknologiat

| Teknologia | Standardi | Nopeus | Käyttö |
| ---------- | --------- | ------ | ------ |
| **Ethernet** | IEEE 802.3 | 100 Mb/s – 10 Gb/s | Langallinen päämäärä |
| **WLAN** | IEEE 802.11 | 150 Mb/s – 10 Gb/s | Langaton päämäärä (Wi-Fi 6/7) |
| **Power over Ethernet** | IEEE 802.3af/at/bt | riippuen Ethernet-nopeudesta | Sähköncrimpaus verkosta |

!!! info "Lisätietoa: Ethernetin kehitys"

    Ethernet on ollut vallitseva lähiverkko-ominaisuus yli 40 vuoden. Se on
    kehittynyt 3 Mb/s:stä (1980-luku) 100 Gb/s:ään (2020-luku). Tärkein
    piirre on se, että se on **paketoimuissuunnitelma**, jossa kaikki laitteet
    jaetaan yhtenäisenä kaikkiaan. Tämä tarkoittaa, että kaikki yhteydet
    ovat yhtäaikaisesti käytettävissä, mikä tekee siitä erinomaisen valinnan
    kiinteille verkkoille.

### Spanning Tree ja verkkosilmukat

Lähiverkossa on usein useita yhteyksiä virrank kestävyyden varmistamiseksi.
Tämä voi kuitenkin aiheuttaa **verkkosilmukia**, joilla on oma oireyhteys.
**Spanning Tree Protocol (STP, IEEE 802.1D)** ehkäisee tämän estämällä yhden
yhteyden verkossa. Tätä käsitellään tarkemmin osiossa
[Spanning Tree](../06-spanning-tree/index.md).

---

## CAN – Campus Area Network

**Kampusverkko** (*Campus Area Network*) on useiden rakennusten välillä oleva verkko,
esimerkiksi koulukampus tai työpaikan. Usein se muodostuu muutamasta
lähiverkosta (LAN) ja niiden välillä olevasta yhteydestä.

### Tyypillinen arkkitehtuuri

```text
    Rakennus A       Rakennus B       Rakennus C
       |                  |                |
       | Ethernet         | Ethernet      | Ethernet
       |                  |                |
       +------------------+----------------+
              |
        Keskushalli (Core Switch)
              |
          Reititin (WAN-rajapinta)
```

### Käyttö

- Yhdistää useita rakennuksia yhteiseen verkkoon.
- Usein käyttää fiber- tai jalatiet linjoja pitkällä etäisyydellä.
- Tarjoaa yhteisen palvelinkeskuksen ja resurssit.

!!! info "Lisätietoa: CANin verkkokortit"

    Campus-verkoissa on kolmikerainen rakenne:

    - **Access Layer** ( päätelaitteiden yhteys) – tyypillisesti 1 Gb/s -portit laitteille
    - **Distribution Layer** (reitinten ja palomuurien kerros) – 10 Gb/s -portit,
      missä useimmat kytkin ja reitinöidit ovat
    - **Core Layer** (ydinkytkin) – erittäin nopea väyläkaista (40–100 Gb/s), joka
      yhdistää kaikki distribusiovat kerrokset

---

## MAN – Metropolitan Area Network

**Kaupunkiverkko** (*Metropolitan Area Network*) kattaa yleensä koko
kaupunginalueen. Se on tyypillisesti operaattorin ylläpitämä ja siinä
käytetään usein valaisten putkina ja muissa pitkällä kantavissa teknologioissa.

### MAN-teknologiat

| Teknologia | Selitys | Nopeus |
| ---------- | ------- | ------ |
| **Fiber Distributed Data Interface** (*FDDI*) | 100 Mb/s fiber-ringi | 100 Mb/s |
| **Synchronous Optical Networking** (*SONET* / SDH) | Fiber-optiset siirrot | 155 Mb/s – 40 Gb/s |
| **MPLS** | Monipoltoinen paketinvälitys | riippuen |
| **Metro-Ethernet** | Ethernet-osoitteisto laajassa alueessa | 1 Gb/s – 10 Gb/s |

!!! info "Lisätietoa: MANin ja WANin rajat"

    Erottelee MAN:stä WAI:stä se on, että MAN on yleensä omistettu yhtä operaattorin
    tai organisaation, kun taas WAN voi kattaa useita operaattoreita. Esimerkiksi
    koulun verkko, joka kattaa useita rakennuksia samalla kunnalla, on CAN,
    kun taas sama verkko, joka yhdistää koulun eri kampukset eri kaupungeissa, on MAN.

---

## WAN – Wide Area Network

**Laajiverkko** (*Wide Area Network*) on verkko, joka kattaa laajan alueen –
maata, maanosia tai jopa koko maailman. Internet on suurin WAN.

### WAN-teknologiat

| Teknologia | Selitys | Nopeus | Käyttö |
| ---------- | ------- | ------ | ------ |
| **Valokuitu** (*Fiber*) | Valon kulkeutuminen kuidussa | 1 – 100 Gb/s | Pitkät yhteydet, operaattorit |
| **Satelliitti** | Data kulkee avaruuteen ja takaisin | 50 – 300 Mb/s | Kaukaiset alueet, puutavaranteet |
| **MPLS** | Merkitty polun paketin kuljetus | riippuen | Operaattoriverkot |
| **xDSL** | Digitaalinen langaton kaapeli | 10 – 1 Gb/s | Asiakas- ja kotiverkot |
| **Kabeli** (*Cable*) | Jakaa kaupungin kaapeliverkot | 100 – 1 Gb/s | Asiakkaat |

### Leijumattomat operaattorit

WAN-verkot ovat yleensä operaattoriverkot, ja niissä on **kolmen** tason
hierarkia (katso myös [Verkko-media](../01-johdatus/verkon-komponentit.md)):

1. **Tier 1** – Globaalit operaattorit (Level 3, NTT, Tata Communications), jotka
   omistavat ja ylläpitävät pääosan internetistä.
2. **Tier 2** – Keskitasoiset operaattorit, jotka voivat kauppailla liikenteestä
   Tier 1 -operaattoreiden kanssa, mutta myivät myös paikallisia palveluita.
3. **Tier 3** – Paikalliset operaattorit, jotka tarjoavat pääsyä loppukäyttäjille.

!!! info "Lisätietoa: How the Internet Works"

    Kun selaat verkkosivua, kysely etenee näin:

    1. **Selaimesi** lähettää HTTP-pyynnön paikallisessa verkossasi (esim. WLAN:ssa).
    2. **Reitittimesi** ohjaa paketin paikalliselta verkulta **paikalliseen operaattorin** (Tier 3) verkkoon.
    3. **Tier 3 -operaattori** välittää paketin **Tier 2 -operaattorille**.
    4. **Tier 2 -operaattori** välittää paketin **Tier 1 -operaattorille**.
    5. **Tier 1 -operaattori** reitittää paketin maailman eri puoliin.
    6. Paketti etenee **IXP:ssä** (Internet Exchange Point), jossa eri operaattorit
       vaihtavat tiedonsiirron keskenään.
    7. Lopullinen vastaus seuraa saman tien päin käyttäjää.

    Tämä kokonaisuus toimii **reititysprotokollien** (BGP, OSPF) avulla, joita
    käsitellään tarkemmin osioissa [Verkon segmentointi ja palomuurit](../08-verkon-turvallisuus/index.md)
    ja [BGP](../14-bgp/index.md).

---

## Vertailu verkkotyypeistä

| Piirre | PAN | LAN | CAN | MAN | WAN |
| ------ | --- | --- | --- | --- | --- |
| **Säde** | 10 m | 100 m | 1 km | 10 km | 10 000+ km |
| **Omistaja** | Käyttäjä | Organisaatio | Organisaatio | Operaattori | Operaattori tai useampi |
| **Nopeus** | kb/s – Mb/s | 100 Mb/s – 10 Gb/s | 1 – 10 Gb/s | 10 – 100 Gb/s | riippuen |
| **Välitys** | Langaton | Langallinen | Langallinen | Langallinen | usein fiberi |
| **Verkkokäyttö** | Bluetooth, USB | Ethernet, WLAN | Multi-rakennus | Fiberjuhlat | Internet, MPLS |
| **Kustannus** | Matala | Matala | Kohtalainen | Korkea | Korkea |
| **Virhetoistuvuus** | Korkea | Matala | Matala | Matala | Riippuen operaattorista |

!!! varoitus "Tärkeä huomio: Verkkotyypit eivät ole rajoittuneet"

    Tämä jako on **periaateellinen**, eikä se ole tiukkaan määritelty. Esimerkiksi,
    modernit kaupunkiverkot (MAN) voivat käyttää myös langattomia linkkejä, ja
    joissain tapauksissa PAN-verkot voivat ulottua pidemmälle kuin 10 metriä.
    Lisäksi, monet nykyaset varat (esim. 5G-verkot) ylittävät perinteiset
    rajat – ne toimivat samanaikaisesti useissa verkkotyypeissä (PAN, LAN ja WAN).
