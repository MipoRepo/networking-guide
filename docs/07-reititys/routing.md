# Reitityksen perusteet

**Reititys** (routing) on prosessi, jossa päätetään paketin seuraava kohde verkossa. Tämä perustuu **reititystauluun** (routing table), joka on tietokoneen tai laitteiston ylläpitämä tietorakenne. Tämä dokumentti perustuu **RFC 1812** -standardiin ja yleisiin IP-verkkojen käytäntöihin.

## Mikä on reititystaulu?

Reititystaulu on taulukko, joka kertoo, mihin lähetetään paketit eri kohdeverkkojen osalta. Se sisältää kolme keskeistä kenttää:

| Kenttä | Selitys | Esimerkki |
|--------|----------|-----------|
| **Verkko** | Kohdeverkon verkko-osoite | `192.168.1.0/24` |
| **Seuraaja** | Seuraavan solmut osoite | `10.0.0.1` |
| **Liitäntä** | Fyysisen portin nimi | `eth0` |

## CIDR-merkintäjärjestelmä

**CIDR** (Classless Inter-Domain Routing) on tapa tiivustaa IP-verkkoja lyhyen numeron avulla. Esimerkiksi:

| Merkintä | Selitys | Verkkomaski |
|---------- |--------|-------------|
| `/24` | 24 bittiä verkossa, 8 bittiä isännälle | `255.255.255.0` |
| `/16` | 16 bittiä verkossa, 16 bittiä isännälle | `255.255.0.0` |
| `/8` | 8 bittiä verkossa, 24 bittiä isännälle | `255.0.0.0` |

!!! info "CIDR-esimerkki"

    `192.168.1.0/24` tarkoittaa verkkoa `192.168.1.0` – `192.168.1.255`, yhteensä 256 osoitetta.

## Longest Prefix Match

Kun reititin päättää, mihin paketti lähetetään, se käyttää **Longest Prefix Match** -periaatetta:

1. Etsi kaikki reitit, jotka vastaavat kohdeosoitetta
2. Valitse **pidin verkko-osoite** (pidin /-luku)

Esimerkiksi:

| Reitti | Maski | Kohde |
|--------|-------|-------|
| `192.168.1.0/24` | /24 | Etsitty osoite |
| `192.168.0.0/16` | /16 | Samainen osoite |

Tässä /24-reitti valitaan, koska se on tarkempi.

## Esimerkkireititystaulu

Tyypillinen Linux-reititystaulu näyttää tältä:

```bash
ip route show
```

```text
default via 192.168.1.1 dev eth0
192.168.1.0/24 dev eth0 proto kernel scope link src 192.168.1.100
10.0.0.0/8 via 10.1.1.1 dev tun0
```

| Reitti | Selitys |
|--------|---------|
| `default via 192.168.1.1` | Kaikki tuntemattumat verkkomatka |
| `192.168.1.0/24` | Suora liittäntä paikallisessa verkossa |
| `10.0.0.0/8` | Kaikki 10.x.x.x -verkot lähetetään toiseen reittiin |

## Reitityksen roolit

| Rooli | Selitys |
|-------|---------|
| **Host routing** | Solmu päättää itsen lähetyksen |
| **Router routing** | Reititin päättää paketin kuljennoksen |
| **Gateway routing** | Reititin toimii portin ylittäjänä |

## Seuraavaksi

Seuraavaksi käsitellään [staattinen-reititys.md](staattinen-reititys.md), jossa nähdään miten reitit määritellään manuaalisesti.
