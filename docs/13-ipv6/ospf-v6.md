# OSPFv3

**OSPFv3** (Open Shortest Path First version 3) on **linkkilaatuinen** (link-state) reititysprotokolla, joka on suunniteltu **IPv6:lle**. Se on määritelty standardina **IETF RFC 5340** (*OSPF for IPv6*).

OSPFv3 on **itsenäinen protokolla** OSPFv2:stä (RFC 2328): ne eivät ole keskenään yhteensopivia eikä OSPFv3 ole pelkkä "OSPFv2 IPv6-yhteydessä". Protokolla käyttää samaa **Dijkstra/SPF-algoritmia** (Shortest Path First) ja aluejakauma-arkkitehtuuria kuin OSPFv2, mutta sen paketit, LSA-tyypit ja osoitteistus perustuvat IPv6-ominaisuuksiin.

## Mitä tämä sivu käsittelee?

- miten OSPFv3-kehykset kulkevat IPv6-verkossa
- miten OSPFv3 eroaa OSPFv2:stä
- OSPFv3:n uudet LSA-tyypit (Link-LSA, Intra-Area-Prefix-LSA)
- OSPFv3-konfigurointi

## Miksi OSPFv3 on tärkeä?

IPv6-verkkoissa dynaaminen reititys vaatii protokollan, joka ymmärtää IPv6-osoitteet ja -runkot. OSPFv3 täyttää tämän:

| Tilanne | Miksi OSPFv3? |
|---------|---------------|
| IPv6-verkot | Tukee IPv6-linkkiloita ja -aliverkkoja |
| Nopeus | Valitsee nopeimman reitin Dijkstra-algoritmilla |
| Skaalautuvuus | Skaalautuu suurkiin verkoihin alueilla |
| IPv6-ominaisuudet | Link-local-osoitteet, moniosoiteet, multicast |

## OSPFv3 ja verkkokerros

OSPFv3 toimii **Layer 3** -tasolla (verkkokerros), samoin kuin OSPFv2. Se liittyy suoraan:

| Protokolla | Kuvaus | Lähde |
|------------|--------|-------|
| **IPv6** (RFC 8200) | Käsittelevää paketointi | RFC 8200 |
| **ICMPv6** (RFC 4443) | Virheilmoitukset ja diagnosticointi | RFC 4443 |
| **Neighbor Discovery** (RFC 4861) | IPv6-linkkien osoitteistus | RFC 4861 |
| **IPv6 AH** (RFC 4321) | OSPFv3-autentikaatio | RFC 5340 §2.6 |

!!! info "OSPF vs OSPFv3"

    Vaikka nimet ovat samankaltaiset ja algoritmit samankaltaiset, ovat OSPFv2 ja OSPFv3 **täysin erillisiä protokollia**. Ne eivät vaihda toisensa samaan versioon — ne voidaan ajaa rinnakkain samassa laitteessa.

## OSPFv3:n perustiedot

OSPFv3 kulkee suoraan IPv6:n päällä:

| Määrite | Arvo | Selitys |
|---------|------|---------|
| **Protokokollanumero** | 89 | Se same as OSPFv2 – IPv6 *Next Header* = 89 |
| **Multicast-ryhmät** | `FF02::5`, `FF02::6` | AllSPFRouters, AllDRouters |
| **Portti** | (ei käytetä) | OSPF on protokollanumero, ei TCP/UDP |
| **Reitintaso** | Link-local | Käyttää IPv6 link-local-osoitteita |

Multicast-ryhmät määritellään standardissa **RFC 2375**:

| Osoite | Ryhmä | Käyttö |
|--------|-------|-------|
| `FF02::5` | AllSPFRouters | Kaikki OSPFv3-routers (Hello, DBD, LSU, LSACK) |
| `FF02::6` | AllDRouters | Vain Designated Router (DR) ja Backup Designated Router (BDR) |

## OSPFv3-kehysvaiheet

OSPFv3 käyttää **viisestä kehostaka** samoin kuin OSPFv2, mutta ne kuljetetaan IPv6-paketoinnin kautta. Kaikki kehykset kuljetetaan IP-protokollanumero 89 (ei UDP/TCP-portteja):

| Kehys | Selitys | Vastaava |
|-------|---------|----------|
| **Hello** | Etsii naapureita | Hello (OSPFv2) |
| **DBD** (Database Description) | Vaihtaa tietoa LSDB:stä | DBD (OSPFv2) |
| **LSR** (Link State Request) | Kysyy tiettyjä LSA:ta | LSR (OSPFv2) |
| **LSU** (Link State Update) | lähettää LSA-päivitykset | LSU (OSPFv2) |
| **LSAck** | Vahvistaa vastaanotetut LSA:t | LSACK (OSPFv2) |

## Naapurisuhteet ja tilat

OSPFv3 naapurien muodostaminen perustuu samoihin vaiheisiin kuin OSPFv2. OSPFv3 käyttää **IPv6 link-local-osoitteita** (esim. `fe80::1`) naapurien tunnistukseen.

| Tila | Selitys |
|------|---------|
| **Down** | Ei ole yhteyttä naapuriin |
| **Attempt** | Yritetään yhteyttä NBMA-verkolla |
| **Init** | Käsiteltiin Hello-kehys, ei ole Full-yhteyttä |
| **2-Way** | Naapuri näkyy molemminpuollisesti |
| **ExStart** | Neuvotellaan master/slave -suhteesta |
| **Exchange** | Vaihdellaan LSDB-tietoja |
| **Loading** | Tyydyttämällä puuttuvat LSA:t |
| **Full** | Naapurisuhteessa valmis, tietokannat synkattu |

| Tila | Selitys |
|------|---------|
| **Down** | Ei yhteyttä |
| **2-Way** | Naapuri näkyy molemminpuolisesti |
| **ExStart** | Neuvotaan master/slave -asennosta |
| **Exchange** | Vaihdetaan tietokantoja (LSA-Info) |
| **Loading** | Haetaan puuttuvat LSA-tiedot |
| **Full** | Tietokanta on täysin synkattu |

!!! info "Kaksipuolisuus"

    2-Way-tilassa OSPFv3 tarkistaa **isäntätunnisteen** (Router ID) naapuriltaan. Jos isäntätunnukset ovat eri, suhteet muodostuvat automaattisesti.

## OSPFv3 LSA-tyypit (RFC 5340)

OSPFv3 tukee jokaisuus lisää LSA-tyyppiä kuin OSPFv2. Tämä johtuu siitä, että IPv6-osoitteiden ja maskien hallinta vaikeutuu OSPFv2:n rakenteessa.

| Numero | Tyyli | Kuvaus |
|--------|-------|--------|
| **1** | **Router-LSA** | Routerin verkko-topologia (linkit) |
| **2** | **Network-LSA** | Moni pääsy verkko (esim. Ethernet) |
| **3** | **Inter-Area-Prefix-LSA** | Alueiden välillä osoitteet |
| **4** | **Inter-Area-Router-LSA** | Alueiden väliset reitit (esim. ASBR) |
| **5** | **AS-External-LSA** | Ulkoiset reitit AS:n ulkopuolelta |
| **7** | **NSSA-LSA** | NSSA-alueen ulkoiset reitit |
| **8** | **Link-LSA** | **Uusi** – linkin IPv6-prefix ja interface ID |
| **9** | **Intra-Area-Prefix-LSA** | **Uusi** – IPv6-osoitteet alueen sisällä |

!!! info "Link-LSA (tyyppi 8)"

    Link-LSA on OSPFv3-erityinen tyyppi. Se antaa:
    1. **Router ID** – reitittimen tunniste
    2. **Advertised Prefix** – linkin IPv6-verkko (esim. `2001:db8::/64`)
    3. **Options** – tukeleet IPv6-ominaisuuksiin

    Link-LSA:ta käytetään Neighbor Discovery -vastaavassa roolissa – se ilmoittaa linkin osoitteet naapureille.

!!! info "Intra-Area-Prefix-LSA (tyyppi 9)"

    Tämä tyyppi kantaa **IPv6-osoitteita alueen sisällä**. Se poikkeaa OSPFv2:stä, jossa osoitteet olivat osa Router-LSA:ta. Tämä erottelu mahdollistaa useamman IPv6-verkon yhtä interfacea kohti (multi-addressing).

## OSPFv3 ja alueet (Areas)

OSPFv3 tukee samaa **aluejakauma-arkkitehtiota** kuin OSPFv2:

| Tyyppi | Numero | Selitys |
|--------|--------|---------|
| **Backbone** | 0 | Keskimmäinen kaikkiin muihiiin |
| **Area** | 1–4095 | Liittyy backboneen |
| **NSSA** | 1–4095 | Ei summary-LSA:tä, mahdollistaa ulkoiset reitit |

### OSPFv3-kustannus

Kuten OSPFv2, myös OSPFv3 laskee kustannukset linkinopeuden perusteella:

| Nopeus | Kustannus |
|--------|-----------|
| 10 Mbps | 10000 |
| 100 Mbps | 1000 |
| 1 Gbps | 100 |
| 10 Gbps | 10 |

!!! warning "Kustannusarvioinnin erottelu"

    OSPFv3 käyttää samaa kustannusmallia kuin OSPFv2. Kustannus lasketaan kaikkien linkkien yhteispituutena (Reference Bandwidth / Interface Bandwidth).

## OSPFv3-konfiguraatio (Cisco)

```text
ipv6 unicast-routing
!
interface GigabitEthernet0/0
  ipv6 address 2001:db8:1::1/64
  ipv6 ospf 1 area 0
!
router ospfv3 1
  af { ipv6 }
    router-id 1.1.1.1
    area 0.0.0.0 stub
  exit-af
!
interface GigabitEthernet0/1
  ipv6 address 2001:db8:2::1/64
  ipv6 ospf 1 area 1
```

## OSPFv3:n ero perusteissa vs OSPFv2

| Ominaisuus | OSPFv2 (IPv4) | OSPFv3 (IPv6) |
|------------|---------------|---------------|
| Versio | RFC 2328 | RFC 5340 |
| Osoitteet | IPv4 | IPv6 |
| Naapurin tunnistus | IPv4 | IPv6 link-local |
| Multicast | 224.0.0.5, 224.0.0.6 | FF02::5, FF02::6 |
| Autentikaatio | OSPF-headerin kentät | IPv6 AH/ESP (RFC 4321) |
| Verkko-maski | Router-LSA, Network-LSA | Poistettu (IPv6 ND hoitaa) |
| LSA-tyypit | 5–6 | 8 (mukaan matalii) |
| Reitintaso | Per-subnet | Per-link |
| Portti | Ei (protokollanumero 89) | Ei (protokollanumero 89) |

!!! info "Autentikaatio"

    OSPFv2 tukee **omia autentikaatiomekanismejaan** (yksinkertainen, MD5, HMAC). **OSPFv3 poistaa kaikki autentikaatiomekanismit OSPF-protokollista itsestään** – sen sijaan se luottaa **IPv6 Authentication Header (AH, RFC 4321)** ja **Encapsulating Security Payload (ESP, RFC 4303)** -ominaisuuksiin.

## OSPFv3:n rajoitukset

| Rajoite | Selitys |
|---------|---------|
| Suurinen muisti | Jokainen solmu pitää koko LSDB:n |
| Konfiguraatiomonimutkaisuus | Vaatii huolellisen suunnittelun alueille ja cost-asetuksille |
| Konverganssi ajon alussa | SPF-laskenta voi olla hidasta suurilla verkoilla |
| Link-local riippuvuus | OSPFv3 vaatii link-local-osoitteet jokaisessa interfaceessa |

## Seuraavaksi

OSPFv3 tarjoaa IPv6-verkkoihin tehokkaan ja skaalautuvan dynaamisen reitityksen. Se on yksi keskeisimmistä protokoleista, jotka mahdollistavat IPv6:n laajamittaisen käytön internetissä.

Seuraavaksi tarkastellaan [BGP:ää](../14-bgp/index.md), joka on protokolla, jota käytetään **autonominen järjestelmä** (Autonomous System -reittien välisessä reitityksessä internetin verkostoissa.
