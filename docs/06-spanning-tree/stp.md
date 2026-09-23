# Spanning Tree Protocol (STP)

**Spanning Tree Protocol** (STP) on IEEE 802.1D-standardin määrittelemä mekanismi, joka estää verkkosilmuat Layer 2-verkoissa. Se on olennainen osa Ethernet-verkkoja, joihin kuuluu useampia kytkimiä. Tämä dokumentti perustuu **IEEE 802.1D**.

## Mikä STP on?

STP toimii seuraavasti:

1. Valitsee yhden laitteen **juurisaktuoraksi** (Root Bridge)
2. Laskee kaikki portit kolmeen tilaan:
   - **Blocking** – Ei hyväksy kehykiä
   - **Listening** – Odottaa
   - **Learning** – Oppii MAC-osoitteet
3. Lähettää **Forwarding** – lähettää ja vastaanottaa kehyksiä

Tämä luo **verkon kahlen** – verkon, jossa on yhtä polkua jokaisen laitteen välillä ilman silmukoita.

## Miksi STP on tärkeä?

| Ilman STP:ta | STP:llä |
|-------------|---------|
| Verkkosilmukat → broadcast-stöö | Silmukat estetään |
| Kaksinkertaiset kehykset | Yksikainen polku jokaiselle |
| CAM-taulun täyttyminen | Taulu pysyy vakaana |
| Verkon kaatuminen | Verkko pysyy toiminnassa |

## STP:n 5 perusvaihetta

Kun STP käynnistyy, kytkimet siirtyvät näissä vaiheissa:

| Vaihe | Selitys | Kesto |
|-------|---------|-------|
| **Blocking** | Ei lähetetä/kehoa vastaanottamista | 20 s |
| **Listening** | Kuuntelee BPDU:ita | 15 s |
| **Learning** | Oppii MAC-osoitteet | 15 s |
| **Forwarding** | Aktiivinen lähetys/vastaanotto | - |
| **Blocking** | Palataan estämään (jos virhe) | - |

Kokonainen siirtyminen voi kestää jopa **30 sekunttia** – tämä on yksi STP:n huonoista.

## BPDU (Bridge Protocol Data Unit)

BPDU on viesti, jota kytkimet vaihtivat toistensa kanssa. Se sisältää:

| Kenttä | Selitys |
|--------|---------|
| **Root ID** | Juurisaktuorin MAC-osoite |
| **Cost** | Polun kustannus |
| **Bridge ID** | Lähettävän laitteen ID |
| **Port Priority** | Portin prioriteetti |

## Root Bridge -valinta

Kytkimet valitsevat juurisaktuorin seuraavien kriteerien perusteella:

1. **Lyhin polku** (cost) – matalin kustannus
2. **Portti-prioriteetti** – pienempi on parempi
3. **Portti-ID** – pienempi on parempi

!!! info "Root Bridge -asettus"

    Root Bridge asetetaan yleensä käsin suurimmalla prioriteetilla: `spanning-tree vlan 10 priority 4096`

## STP:n porttityypit

| Tyyppi | Selitys | Esimerkki |
|--------|---------|-----------|
| **Root Port** | Paras polku juurisaktuorin löytämiseen | 1 per laitteisto |
| **Desiginated Port** | Aktiivinen portti joka verkossa | 1+ per verkko |
| **Blocking Port** | Estetty portti – käytetään varmistukseen | 0+ |

## Esimerkikonfigurointi (Cisco)

```text
! aseta STP käyttöön
spanning-tree mode pvst

! aseta juurisaktuori
spanning-tree vlan 1-4094 priority 4096

! tarkista status
show spanning-tree
show spanning-tree interface gi0/1
```

## STP:n rajoitukset

| Rajoite | Selitys |
|---------|---------|
| ** Hit auttaminen | 30 sekunttia – ei oikeuta |
| **Kaksinkertainen** | Yksi juurisaksi, yksi polku – ei resurssitehokkaampi |
| **Ei tasapainoa** | Liian useat portit voivat olla estossa |

## Seuraavaksi

Kun olet ymmärtänyt STP:n perusteet, tarkastellaan [rstp.md](rstp.md), jossa Rapid Spanning Tree Protocol (IEEE 802.1W) parantaa siirtymisen nopeutta.
