# Dynaaminen reititys

**Dynaaminen reititys** (dynamic routing) tarkoittaa sitä, että reitit päivitetään automaattisesti protokolojen avulla. Tämä poikkeaa **staattisestä reitityksestä**, jossa jokainen reitti lisätään manuaalisesti.

Dynaaminen reititys on käytössä suuremassa verkossa, jossa manuaalinen hallinta olisi työlästä. Protokoloja ovat esimerkiksi:

| Protokolla | Standardi | Käyttö |
|------------|-----------|--------|
| RIP | RFC 2453 | Pienet verkot, yksinkertainen |
| OSPF | RFC 2328 | Suuret verkot, linkkilaatu |
| BGP | RFC 4271 | Internet, inter-domain reititys |

!!! info "Tämä on lyhyt yleiskuva"

    RIP, OSPF ja BGP käsitellään yksityiskohtaisemmin ommissa osioissaan. Tämä sivu antaa yleiskuvan niistä ja niiden käytöstä.

## Miksi dynaisinen reititys on tärkeä?

| Tilanne | Miksi dynaaminen? |
|---------|-------------------|
| Verkon muutos | Uudet verkot ilmoitetaan automaattisesti |
| Linkin kaatuminen | Reitit päivittyvät ilman manuaalista työtä |
| Suuri verkko | Ei tarvitse manuaalista reititystä jokaan |

## RIP (Routing Information Protocol)

RIP (RFC 2453) on yksinkertainen protokolla, joka ilmoittaa reitit naapureilleen. Se käyttää **hops** -lukua (solmujen lukumäärä) reitin valinnassa.

| Ominaisuus | Arvo |
|------------|------|
| Max etäisyys | 15 solmua |
| Valtaväri | Hop |
| Päivitystahti | 30 sekuntia |

RIP:ssa reitit päivittyvät 30 sekunnin välein, ja jos reitti on yli 15 solmua pitkä, se katsketaan "äärettömäksi" (infinity).

```bash
# RIP-konfiguraatio (esimerkki)
router rip
  version 2
  network 10.0.0.0
```

## OSPF (Open Shortest Path First)

OSPF (RFC 2328) käyttää **linkkiluokituksia** (link-state) reittien laskemiseen. Jokainen solmu lähettää OSPF-kehykset (Hello, DBD, LSA) naapureilleen, ja kaikki solmut muodostavat yhteisen kartanon.

Osapuoli tarkemmin [OSPF-sivulla](ospf.md).

## BGP (Border Gateway Protocol)

BGP (RFC 4271) on Internetin keskeinen protokolla. Se yhdistää eri AS-verkot (Autonomous System) yhteensä.

| Ominaisuus | Selitys |
|------------|---------|
| AS-numero | Yksiläinen verkon tunnus |
| BGP-x | "X" AS-numeroa pitkin oleva reitti |
| Next-hop | Seuraavan solmun osoite |

```bash
# BGP-konfiguraatio (esimerkki)
router bgp 65001
  neighbor 10.0.0.2 remote-as 65002
  network 192.168.1.0 mask 255.255.255.0
```

## Protokollien vertailu

| Protokolla | Hyvä puoli | Heikompi puoli | Käyttökohde |
|------------|-----------|---------------|--------------|
| RIP | Yksinkertainen | Pieni max-etäisyys | Pienet verkot |
| OSPF | Nopea, tarkka | Monimutkainen | Suuret verkot |
| BGP | Internet, AS-yhteys | Raskas konfigurointi | ISP:t, AS:t |

## Esimerkki verkosta

```text
AS 65001 (ISP-A)        AS 65002 (ISP-B)
10.0.0.0/24             172.16.0.0/24
    |                     |
    +--- BGP ---+--------+
                |
              Internet
```

Tässä BGPlaya ohjataan reittejä eri AS:iin.

## Seuraavaksi

Seuraavaksi tarkastellaan [ospf.md](ospf.md), jossa käsitellään OSPF-protokollan yksityiskohtia, kuten area-tyyppit, LSA-viestejä ja neighbours-relaatiota.
