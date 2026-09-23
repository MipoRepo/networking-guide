# Spanning Tree (verkkosilmukat)

Tämä osio käsittelee **verkkosilmuksia** – tilannetta, jossa paketit voivat kiertää verkossa ikuisesti – ja **Spanning Tree -protokollia** (STP), jokainen estää tämän. Tämä on keskeinen osa **Layer 2** -verkkoja ja perustuu **IEEE 802.1D** -standardiin.

## Mitä tämä osio käsittelee?

| Sivu | Aihe | Keskeinen kysymys |
|------|------|-------------------|
| Verkkosilmukat | Silmukat verkossa | Miksi paketit voivat kiertää ikuisesti? |
| STP | Spanning Tree Protocol | Miten estetään paketin kiertäminen? |
| RSTP | Rapid Spanning Tree | Kuinka nopeuttaa kytkennän palautumista? |

## Miksi verkkosilmukat ovat ongelma?

Verkossa, jossa on useita yhteyksiä (esim. useita switchejä), paketit voivat muodostaa **silmukan**:

```text
A → B → C → A → B → C → ... (iätisyys)
```

Tämä aiheuttaa:

| Ongelma | Seuraus |
|---------|---------|
| **Broadcast-stöö** | Verkkokuormitus kasvaa valtavasti |
| **MAC-taulun sekaantuminen** | Kytkin päivistää sijaintia jatkuvasti |
| **Frame-duplikaatit** | Sama paketti saapuu useaan kertaan |
| **CAM-taulun täyttyminen** | Kytkin lakkaa toimimasta |

## Kuinka Spanning Tree toimii?

**Spanning Tree Protocol** (STP) on IEEE 802.1D:n määrittelemä mekanismi, joka:

1. Valitsee yhden **juurisaktuorin** (root bridge) kaikista laitteista
2. Laskemaa kaikki portit **esteellä** tai **lähettäväksi** (blocking / forwarding)
3. Estää kaikki ylimääräiset polut silmukan muodostamiseen

Tämä luo **verkon kahleen** – verkon, jossa on yhtä polkua jokaisen laitteen välillä, ilman silmukoita.

## Tämä osio ja Ethernet

Spanning Tree toimii **Layer 2** -tasolla – siis siinä samassa tasossa kuin Ethernet ja kytkimet. Tämä tarkoittaa, että se vaatii kytkimen aktivoitumaan (katso [02-ethernet/switching.md](../02-ethernet/switching.md)):

- MAC-osoitteet
- Ethernet-kehys
- Portit

## Seuraavaksi

Aloitamme [verkkosilmukaiden](verkkosilmukat.md)-sivulta, jossa tarkastellaan tarkemmin miten verkossa syntyy silmukoita ja miten ne vaikuttavat.
