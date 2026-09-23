# OSPF (Open Shortest Path First)

**OSPF** (Open Shortest Path First) on **linkkilaatuinen** (link-state) reititysprotokolla, joka on määritelty standardina **RFC 2328**. Sen keskeinen idea on, että jokainen solmu tiedostaa koko verkon kartanon, ja reitit lasketaan käyttäen **Dijkstra-algoritmia** (myös tunnettu nimellä "shortest path first").

## Mitä OSPF opiskelee?

Tämä sivu käsittelee:

- miten OSPF-kehykset kulkevat
- miten OSPF valitsee parhaan reitin
- OSPF-area-tyyppit ja niiden merkitys

## Miksi OSPF on tärkeä?

| Tilanne | Miksi OSPF? |
|---------|-------------|
| Nopeus | Valitsee nopeimman reitin |
| Tuki | Laaja ohjain- ja verkonvalmistajan tuki |
| Monimutkailu | Skaalautuu suurille verkoille |

## OSPF-kehysvaiheet

OSPF-kommunikointi tapahtuu erilaisilla kehyksillä:

| Kehys | Selitys |
|-------|---------|
| **Hello** | Etsii naapureita |
| **DBD** | Lähettää tietoja omasta linkkialueesta |
| **LSR** | Kysyy tiettyä LSA:ta |
| **LSU** | Lähettää LSA:t |
| **LSAck** | Vastaa vastaanotetuista LSA:ista |

1. **Hello-kehys** – OSPF-solmu lähettää Hello-kehykset naapureilleen, jotta neuvotellaan naapureita (neighbor relationship).
2. **DBD (Database Description)** – Naapurit vaihtavat tietoa omasta linkkialueestaan (LSA-db).
3. **LSR (Link State Request)** – Pyydättyessä lähetetään tarkempi tieto tiettyistä LSA:ista.
4. **LSU (Link State Update)** – Toiselleen LSA:t lähetetään päivitettyinä.
5. **LSAck (Link State Acknowledgement)** – Vastataan vastaanotetuista LSA:ista vahvistus.

## OSPF-area-tyyppit

OSPF käyttää **areoja** (areas) verkon jakamiseen pienempiin osiin. Tämä vähentää naapurien välistä tiedonkulgua.

| Tyyppi | Numero | Selitys |
|--------|--------|---------|
| Backbone | 0 | Keskimmäinen kaikkiin muihihin |
| Area | 1–4095 | Liittyy backboneen |
| NSSA | 1–4095 | Eri muodossa, ei summary-LSA |

## Dijkstra (SPF) -algoritmi

Kun jokinen solmu saa LSA:t, se laskee parhaan reitin käyttamään **Dijkstra SPF -algoritmia**:

1. Valitse juumpuksi lähtee solmu (esim. se itsä).
2. Laske kaikki naapurit ja niiden kustannus (esim. linkinopeus).
3. Valitse pienin kustannus ja jatka siitä.
4. Toista kunnes kaikki solmut on käsitelty.

## OSPF-kustannus (Cost)

OSPF laskee kustannuksia linkin nopeuden perusteella:

| Nopeus | Kustannus |
|--------|-----------|

| 10 Mbps | 10000 |

| 100 Mbps | 1000 |

| 1 Gbps | 100 |

| 10 Gbps | 10 |

## OSPF-konfiguraatio (Cisco)

```text
router ospf 1
  network 10.0.0.0 0.0.255.255 area 0
  network 172.16.0.0 0.0.255.255 area 1
```

## OSPF-tyypit

| Tyyppi | Selitys |
|--------|---------|
| **Point-to-Point** | Kaksi solmua yhdistävä |
| **Broadcast** | Ethernet-verkot (esim. IP-palvelut) |
| **Non-Broadcast** | WAN-verkot (esim. Frame Relay) |
| **Point-to-Multipoint** | Useampi kohde yhtä verkkoa kohti |

## Esimerkkiverkko

```text
Area 0 (Backbone):
R1 (10.0.1.1)  --  R2 (10.0.2.2)

Area 1:
R2 (172.16.1.1)  --  R3 (172.16.2.2)
```

Tässä R1 pystyy pääsemään R3:n verkkoon (`172.16.0.0/16`) kautta R2:n – ja reitti päivittyy automaattisesti.

## OSPF:n rajoitukset

| Rajoite | Selitys |
|---------|---------|
| Suurinen muisti | Jokainen solmu pitää koko kartanon |
| Monimutkainen | Vaatii säilyttämistä ja konfigurointia |
| Ei puolta | Ei tasaa liikennetta (katsoo vain parhaan reitin) |

## Seuraavaksi

Kun olet ymmärtänyt OSPF:n perusteet, voit jatkaa [08-verkon-turvallisuus/index.md](../08-verkon-turvallisuus/index.md)-osioon, jossa käsitellään IPv4-verkon tietoturvaan liittyviä kysymyksiä.
