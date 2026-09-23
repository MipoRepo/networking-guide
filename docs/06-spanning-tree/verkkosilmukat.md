# Verkkosilmukat (Network Loops)

**Verkkosilmuanne** (network loop) syntyy verkossa, jossa on **useita polkuja** samasta lähettäjästä vastaanottajan välillä. Tämä voi tapahtua esimerkiksi, kun kytkimet ovat toistensa kanssa linkitetyissä silmukoissa.

## Mikä verkkosilmukka on?

Kuvitellaan kolme kytintä:

```text
Switch A — Switch B
   |           |
Switch C — — — —
```

Jos Switch C myös yhdistää Switch A:ään, syntyy silmukka: **A → B → C → A → B → ...**

## Miksi verkkosilmukat ovat ongelma?

Verkkosilmukat aiheuttavat kolme pääongelmaa:

### 1. Broadcast-stöö (Broadcast Storm)

Kun broadcast-kehys (esim. DHCP-request) kirjautuu verkkoon, se leviää jokaisessa silta kerralla. Tämä aiheuttaa eksponentin kasvun:

| Syttokset | Kertoja verkossa |
|-----------|-------------------|
| 1 | x |
| 2 | 2x |
| 3 | 4x |
| 4 | 8x |
| 10 | 1024x |

Tämä johtaa verkon kuolluksi.

### 2. MAC-taulun sekaantuminen

Kytkimen MAC-osoite-taulu päivittyy jatkuvasti saman MAC-osoitteen eri porttien kesken, mikä johtaa:

| Ongelma | Seuraus |
|---------|---------|
| Liiallinen päivitys | CAM-taulun täyttyminen |
| Osoitteen sekaantuminen | Kehys lähetetään väärin |

### 3. Frame-duplikaatit

Samainen kehys saapuu vastaanottajalle useaan kertaan – esimerkiksi TCP-yhteys voi samalleen jakaa.

## Esimerkkiluku: Kuinka paljon kasvaa?

| Sekunti | Broadcast-kertoja |
|--------|-------------------|
| 0 | 1 |
| 1 | 2 |
| 2 | 4 |
| 3 | 8 |
| 5 | 32 |
| 10 | 1 024 |
| 20 | 1 048 576 |
| 30 | 1 073 741 824 |

30 sekunnissa yksi broadcast voi muodostaa **yli miljardin kappaleen** – verkko kuollaan.

## Miksi verkkosilmukat syntyvät?

| Syy | Esimerkki |
|-----|-----------|
| **Useat linkit** | Redunttisuus – "varmuusyhteys" |
| **Kytkimen itse-yhteys** | Portti, joka palaa takaisin |
| **Laitteiston virhe** | Eksyksetyy konfigurointi |

## Verkkokytkennän redundanssi

Useimmissa tuotantoverkoissa on **redundanssi** – useampi polku yhteyttä varten. Tämä on hyvää:

- Jos yksi polku katkeaa, liikenne siirtyy toiseen

Mutta tämä on myös vaaratonta – se voi aiheuttaa verkkosilmukan.

## Ratkaisu: Spanning Tree Protocol

Verkkosilmukoiden estämiseksi kehitettiin **Spanning Tree Protocol** (STP) – IEEE 802.1D-standardi. Se auttaa:

- Valitsemaan yhden polun aktiiviseksi
- Estämään muut polut
- Palauttamaan ne, kun yhteys katkeaa

## Esimerkki: Verkkokytkin

```bash
# Näytä Spanning Tree -status (Cisco)
show spanning-tree
```

Tuloste voi näyttää:

```text
Root Bridge for VLANs: VLAN 10
Port 1 (Gi0/1) — Blocking
Port 2 (Gi0/2) — Forwarding
```

Tässä Port 1 on estänyt (ei välitä kehyksistä), ja Port 2 on aktiivinen (lähettää ja vastaanottaa).

## Seuraavaksi

Kun olet ymmärtänyt verkkosilmukoiden ongelman, tarkastellaan [stp.md](stp.md), jossa Spanning Tree Protocol (IEEE 802.1D) käsitellään yksityiskohtaisemmin.
