# Kaapelointi (Cabling)

**Kaapelointi** (cabling) tarkoittaa verkkojen fylisten yhteyksien muodostamista – eli kuidujen ja liitäntöjen valinta. Tämä on **Layer 1** (fyysinen) – verkoston alin kerros. Tämä dokumentti perustuu **TIA/EIA-568**- ja **ISO/IEC 11801**-standardiin sekä **IEEE 802.3**-standardiin (Ethernet).

## Miksi kaapelointi on tärkeä?

Verkko on vain niertynyt, jos kaapelit ovat oikeita. Huono kaapelointi voi aiheuttaa:

| Ongelma | Seuraus |
|---------|---------|
| Liiallinen pituus | Tietopaketit katoavat | 
| Huono laatu | Tuokset: bittisatoja, virheitä |
| Väärä tyyppi | Ei yhteyttä olemassa ollenkaan |
| Silmänkäänteisyys | Verkko kaatuu yhden virheen takia |

## Kaapelityyppit

### Twisted Pair (kiertyvä kaksikko)

| Tyyppi | Nopeus | Pituus | Käyttö |
|--------|--------|--------|--------|
| **Cat 5e** | 100 – 1000 Mb/s | 100 m | Kotiverkot |
| **Cat 6** | 10 – 10 000 Mb/s | 55 – 100 m | Liiketalot |
| **Cat 6a** | 10 Gb/s | 100 m | Tietokonehuoneet |
| **Cat 7 / Cat 8** | 10 – 40 Gb/s | 30 m | Tietokonehuoneet |

**RJ-45** on liitäntätyyppi, joka soveltuu näihin kaapelityyppeihin.

### Kuitu (Fiber)

| Tyyppi | Nopeus | Pituus | Valo | Tyypillinen käyttö |
|--------|--------|--------|------|-------------------|
| **Multimode (OM1–OM5)** | 100 Mb/s – 400 Gb/s | 550 m – 500 m | 50/125 µm | Datalantic |
| **Single-mode (OS1/OS2)** | 1 Gb/s – 100 Gbps | km | 9/125 µm | WAN, pitkät yhteydet |

!!! info "Silmänkäänteinen valinta"

    Kuitu on parempi kauppoissa ja pitkillä matkoilla. Siksi useimmissa verkoissa on hybridi: copper paikallisissa verkoissa, kuitu pitkissä siirroissa.

## Kaapeloidien merkitseminen

Ethernet-kaapelit on merkittävästi standardoituna:

| Standardi | Määrittelee |
|-----------|-------------|
| **TIA/EIA-568** | US: n BCNS- ja liitosten standardi |
| **ISO/IEC 11801** | ISO: n kansainvälinen standardi |
| **IEC 61753** | Kuidon laatu- ja suorituskyvystandardi |

### Käytännön merkintä

| Nimi | Selitys |
|------|---------|
| **Straight-through** | Samat järjestykset molemmissa päässä (`1-2-3-6`) |
| **Crossover (cross-over)** | Poistettu järjestys (`1-2-3-6` vs `1-2-6-3`) |
| **Roll-over** | Käännetty järjestys (`1-2-3-4-5-6-7-8` vs `8-7-6-5-4-3-2-1`) |

!!! warning "X-cable"

    Nykyään automaattisen kytkennin (auto MDI/MDI-X) vuoatuksessa ei tarvitse huolehtia kytkimen tai kaapelin suunnasta – se säädetään automaattisesti.

## Ethernet-kaapelit

| Tyyppi | Standardi | Nopeus | Käytetty |
|--------|-----------|--------|----------|
| **10BASE-T** | IEEE 802.3i | 10 Mb/s | Varhatut (ajan heinä) |
| **100BASE-TX** | IEEE 802.3u | 100 Mb/s | Kotiverkot |
| **1000BASE-T** | IEEE 802.3ab | 1 Gb/s | Tavallinen |
| **10GBASE-T** | IEEE 802.3an | 10 Gb/s | Liiketalot |

## Kaapelointilaitteet

| Laite | Selitys | Käyttö |
|-------|---------|--------|
| **Patch panel** | Portit ryhmään kiinnitetty | Kytketään eri osastot yhteen |
| **Kabelimittaja (cable tester)** | Testaa kaapelit | Tarkistus ennen käyttöä |
| **Kabelimestari (Cable certifier)** | Tarkistaa kaiken | Laadun varmistus |
| **Rack** | Laitekaapia, jossa kaapelit | Rangaistus ja hallinta |

## Esimerkkilakki: 100BASE-TX

Kaapelissa 4 kapasettiia (8 juuonit). Vastaan otetaan 2+ kapasettiit:

```text
100BASE-TX pinnit:
  1,2 – Lähetys (TX+, TX-)
  3,6 – Vastaanotto (RX+, RX-)
```

Tämä tarkoittaa, että yhteys vaatii vain 2 kapasettiia 100 Mb/s -opeudella.

## Leveyden valinta (Bandwidth selection)

| Vaatimus | Suositus |
|----------|----------|
| 100 Mb/s | Cat 5e |
| 1 Gb/s | Cat 6 |
| 10 Gb/s | Cat 6a tai kuitu |
| 40+ Gb/s | Cat 8 tai kuitu |

## Seuraavaksi

Kun olet ymmärtänyt fyysisen verkon perusteet, siirrytään [06-spanning-tree/index.md](../06-spanning-tree/index.md)-osioon, jossa käsitellään verkkosilmuksia ja Spanning Tree -protokollia.
