# Kaapelointi (Cabling)

**Kaapelointi** (cabling) tarkoittaa verkkojen fylisten yhteyksien muodostamista – eli kuidujen ja liitinten valinta. Tämä on **Layer 1** (fyysinen) – verkon alin kerros. Tämä dokumentti perustuu **TIA/EIA-568**- ja **ISO/IEC 11801**-standardiin sekä **IEEE 802.3**-standardiin (Ethernet).

## Miksi kaapelointi on tärkeä?

Verkko on vain kiinnitetty, jos kaapelit ovat oikeita. Huono kaapelointi voi aiheuttaa:

| Ongelma | Seuraus |
|---------|---------|
| Liiallinen pituus | Paketit katoavat |
| Huono laatu | Lisää bittisatoja, virheitä |
| Väärä tyyppi | Ei yhteyttä olemassa ollenkaan |

## Kaapelityyppit

### Twisted Pair (kiertyvä kaksikko)

| Tyyppi | Nopeus | Pituus | Käyttö |
|--------|--------|--------|--------|
| **Cat 5e** | 100 – 1000 Mb/s | 100 m | Kotiverkot |
| **Cat 6** | 10 – 10 000 Mb/s | 55 – 100 m | Liiketalot |
| **Cat 6a** | 10 Gb/s | 100 m | Tietokonehuoneet |
| **Cat 7 / Cat 8** | 10 – 40 Gb/s | 30 m | Tietokonehuoneet |

**RJ-45** on liitintyyppi, joka soveltuu näihin kaapelityyppeihin.

### Kuitu (Fiber)

| Tyyppi | Nopeus | Pituus | Valo | Käyttö |
|--------|--------|--------|------|--------|
| **Multimode (OM1–OM5)** | 100 Mb/s – 400 Gb/s | 550 m – 500 m | 50/125 µm | Paikalliset verkot |
| **Single-mode (OS1/OS2)** | 1 Gb/s – 100 Gbps | km | 9/125 µm | WAN, pitkät yhteydet |

!!! info "Valinta"

    Kuitu on parempi kauempoissa ja pitkillä matkoilla. Siksi useimmissa verkoissa on hybridi: kupari paikallisissa verkoissa, kuitu pitkissä siirroissa.

## Kaapelien merkitseminen

Ethernet-kaapelit on merkittävästi standardoituna:

| Standardi | Määrittelee |
|-----------|-------------|
| **TIA/EIA-568** | US:n BCNS- ja liitostandardi |
| **ISO/IEC 11801** | ISO:n kansainvälinen standardi |
| **IEC 61753** | Kuidon laatu- ja toimintakyvyn standardi |

### Käytännön merkintä

| Nimi | Selitys |
|------|---------|
| **Straight-through** | Samat järjestykset molemmissa päässä (1-2-3-6) |
| **Crossover** | Käännetty järjestys (1-2-3-6 vs 1-2-6-3) |
| **Roll-over** | Käännetty järjestys (1-2-3-4-5-6-7-8 vs 8-7-6-5-4-3-2-1) |

!!! warning "X-cable"

    Nykyään automaattinen MDI/MDI-X-ominaisuus tarkistaa ja säätää kaapelin automaattisesti – et tarvitse huolehtia järjestyksestä.

## Ethernet-kaapelit

| Tyyppi | Standardi | Nopeus | Käytetty |
|--------|-----------|--------|----------|
| **10BASE-T** | IEEE 802.3i | 10 Mb/s | Historiallinen |
| **100BASE-TX** | IEEE 802.3u | 100 Mb/s | Kotiverkot |
| **1000BASE-T** | IEEE 802.3ab | 1 Gb/s | Tavallinen |
| **10GBASE-T** | IEEE 802.3an | 10 Gb/s | Liiketalot |

## Kaapelointilaitteet

| Laite | Selitys | Käyttö |
|-------|---------|--------|
| **Patch panel** | Portit ryhmään kiinnitetty | Kytketään eri osastot yhteen |
| **Cable tester** | Testaa kaapelit | Tarkistus ennen käyttöä |
| **Cable certifier** | Tarkistaa kaiken | Laadun varmistus |
| **Rack** | Laitekaapia, jossa kaapelit | Järjestys ja hallinta |

## Seuraavaksi

Kun olet ymmärtänyt fyysisen verkon perusteet, siirrytään [06-spanning-tree/index.md](../06-spanning-tree/index.md)-osioon, jossa käsitellään verkkosilmuksia ja Spanning Tree -protokollia.
