# Subnetointi

**Subnetointi** (subnetting) on menettely, jossa iso verkko jaetaan pienempiin loogisiin aliverkkoihin. Tämä mahdollistaa osoitteiden tehokkaan varaamisen, liikenteen erottelun ja paremman hallinnan.

## Mikä subnet-maski on?

**Subnet-maski** (subnet mask) on 32-bittinen luku, joka erottaa IPv4-osoitteessa olevan verkon osan (network) käyttäjäosasta (host). Se ilmoitetaan joko desimaaleina tai CIDR-muodossa.

Esimerkiksi:

| Muoto | Arvo |
|-------|------|
| Desimaalimuoto | `255.255.255.0` |
| CIDR | `/24` |
| Binäärimuoto | `11111111.11111111.11111111.00000000` |

Binäärimuodossa maski kertoo, mitkä bitit ovat "verkon" (1) ja mitkä "käyttäjän" (0).

## CIDR-muoto ja VLSM

CIDR (Classless Inter-Domain Routing, RFC 4632) antaa joustavuuden aliverkkoihin. Se mahdollistaa myös VLSM:n (Variable Length Subnet Mask), jossa eri aliverkoille annetaan eri maskit.

Esimerkiksi verkosta `192.168.1.0/24` voidaan tehdä:

| Aliverkko | Maski | CIDR | Käyttäjäosoitteet |
|-----------|-------|------|--------------------|
| 192.168.1.0 | 255.255.255.128 | /25 | 126 |
| 192.168.1.128 | 255.255.255.128 | /25 | 126 |

Tämä antaa kaksi yhtä suurta aliverkkoa. Vaihtoehtoisesti voimme tehdä erikokoiset aliverkonnit:

| Aliverkko | Maski | CIDR | Käyttäjäosoitteet | Tarkoitus |
|-----------|-------|------|--------------------|------------|
| 192.168.1.0 | 255.255.255.192 | /26 | 62 | Suurten laitteiden verkko |
| 192.168.1.64 | 255.255.255.192 | /26 | 62 | Toinen suuri verkko |
| 192.168.1.128 | 255.255.255.240 | /28 | 14 | Pienempi verkko |
| ... | ... | ... | ... | ... |
| 192.168.1.144 | 255.255.255.248 | /29 | 6 | Piste-seuraavat yhteydet |

## Kuinka subnetointi lasketaan?

### 1. Valitse verkko ja haluttavat koot

Esimerkiksi haluamme jakaa `10.0.0.0/24` kolmeen osaan: 60, 30 ja 6 laitteelle.

### 2. Valitse sopivat maskit

| Käyttö | Laitteet | Tarvittu maski | CIDR | Varatut osoitteet |
|--------|----------|----------------|------|-------------------|
| Verkko A | 60 | 255.255.255.192 | /26 | 64 |
| Verkko B | 30 | 255.255.255.224 | /27 | 32 |
| Verkko C | 6 | 255.255.255.248 | /29 | 8 |

### 3. Määritä aliverkot

| Aliverkko | Alku | Loppu | Maski |
|-----------|------|-------|-------|
| Verkko A | 10.0.0.0 | 10.0.0.63 | /26 |
| Verkko B | 10.0.0.64 | 10.0.0.95 | /27 |
| Verkko C | 10.0.0.96 | 10.0.0.103 | /29 |

Jäljelle jäävä tila: `10.0.0.104` – `10.0.0.255` (tai jatka jakamista).

## Superverkko (Aggregation)

Superverkko on käänteinen operaatio subnetoinnille. Se yhdistää useita pieniä verkkoja yhdeksi isoksi. Esimerkiksi:

```text
192.168.1.0/25 + 192.168.1.128/25 = 192.168.1.0/24
```

Tämä vähentää reititystauluja ja parantaa tehokkuutta.

## Miksi subnetointi on tärkeä?

| Hyöty | Selitys |
|-------|---------|
| Tasa- ja turva | Liikenne erottuu eri osastoihin |
| Osoitteiden säästö | Vähemmän osoitteita on käytetty |
| Reititystaulun koko | Pienempi taulu eri aliverkoilla |
| Hallinta | Helpompi päivittää aliverkko kerrallaan |

## Seuraavaksi

Kun olet ymmärtänyt aliverkot ja subnet-maskin, siirrytään [arp.md](arp.md), jossa käsitellään ARP-protokollaa IPv4-osoitteiden ja MAC-osoitteiden välisten käännösten osalta.
