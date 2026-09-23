# Rapid Spanning Tree Protocol (RSTP)

**RSTP** (Rapid Spanning Tree Protocol) on **IEEE 802.1W** -standardin määrittelemä mekanismi, joka parantaa Spanning Tree Protocol -protokollaa (IEEE 802.1D) nopeammin ottamalla käyttöön nopeampaa siirtymistä porttiehoissa. Tämä dokumentti perustuu standardiin **IEEE 802.1W**.

## Mikä on RSTP: n ero STP:ään?

| Ominaisuus | STP (802.1D) | RSTP (802.1W) |
| -----------| ------------- | -------------- |
| Siirtymisaika | 30–50 sekuntia | 3–6 sekuntia |
| Porttitila-ajotus | Blocking → Listening → Learning → Forwarding | Blocking/Discarding → Learning → Forwarding |
| Automaattinen toiminta | Kyllä | Kyllä |
| Portti-puute | Kyllä | Ei |

RSTP poistaa **Listening-tilan** ja yhdistää siirtymisen suoraan **Blocking → Learning → Forwarding**.

## RSTP:n porttitilat

| Tila | Selitys | Toiminto |
| ------|---------|----------|
| **Discarding** | Ei vastaanottaa/kehiä lähettä | Ei oppiminen eikä lähetys |
| **Learning** | Oppii MAC-osoitteet | Ei lähetetä |
| **Forwarding** | Lähettää ja vastaanottaa | Aktiivinen |

## RSTP:n nopeampi siirtyminen

Kun yhteys palautuu, RSTP ei odota 30 sekuntia. Sen sijaan se käyttää ** Proposal/Agreement-mekanismia**:

1. **Ehdotus (Proposal)** – portti ehdottaa siirtymistä "oikeaksi"
2. **Vastaus (Agreement)** – toinen portti vahvistaa

Tämä tehoaa yhteyden palautuksen **noin 3 sekuntiin**.

## RSTP:n porttityypit

| Tyyppi | Selitys |
| ------ | ------- |
| **Root Port** | Paras polku juurisaktuorin löytämiseen |
| **Designated Port** | Aktiivinen portti joka verkossa |
| **Blocking Port** | Estetty portti – käytetään varmistukseen |
| **Alternate Port** | Varmuuspolku juureen |
| **Backup Port** | Sama verkko kahdella portilla samassa laitteessa |

## RSTP:ssä BPDU:t

RSTP käyttää **BPDU:tä**, joita lähetetään **joka 2 sekuntia** – kaksinkertainen määrä verrattuna STP:n 30 sekuntoon.

| Bitit | Selitys |
| ----- | ----- |
| **Proposal** | Ehdotus siirtymisestä |
| **Agreement** | Hyväksyntä ehdotukselle |
| **Port Role** | Portin rooli (Root/Designated/Blocking) |

## Miksi RSTP on parempi?

| Hyöty | Selitys |
| ----- | ----- |
| **Nopeampi** | 3 sekuntia vs 30 sekuntia |
| **Vakaampi** | Ei valmistelutilaan jumiutuminen |
| **Yhteensopiva** | Työskentee myös STP:n kanssa (fallback) |
| **Resurssitehokkaampi** | Vähentää BPDU-liikennettä |

## RSTP:n konfigurointi (Cisco)

```text
! Ota RSTP käyttöön
spanning-tree mode rapid-pvst

! Tarkista tila
show spanning-tree

! Portin rooli
show spanning-tree interface gi0/1 detail
```

## RSTP:n Rajoitukset

| Rajoite | Selitys |
| --------- | ------- |
| **Ei resurssijako** | Käyttää yhä yhtä juurisaktuoria |
| **Ei tasapainota** | Yksi polku voi olla liian pitkä |
| **Ei linkkivika-asetuksia** | Vaatii erillinen mekanismi |

## RSTP vs MSTP (IEEE 802.1S)

| Mekanismi | Standardi | Käyttö |
| ---------- | ---------- | ------ |
| **RSTP** | 802.1W | Yksinkertaiset verkot |
| **MSTP** | 802.1S | Useampia VLAN-ryhmiä |

MSTP on jatkokehittely, joka yhdistää RSTP:n ja useamman instanssin yhteen. Se on tarkoitettu isoille verkoille.

## Seuraavaksi

Kun olet ymmärtänyt Spanning Tree -protokolat, siirrytään [07-reititys/index.md](../07-reititys/index.md)-osioon, jossa käsitellään IPv4-reititystä ja dynaamisia protokollia kuten OSPF.
