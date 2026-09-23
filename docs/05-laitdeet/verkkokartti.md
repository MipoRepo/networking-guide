# Verkkokortti (NIC – Network Interface Card)

**Verkkokortti** (Network Interface Card, lyh. NIC) on laitteisto, joka mahdollistaa laitteiston yhteyden verkkoon. Se on verkkokytkinnän **Layer 1** (fyysinen) ja osittain **Layer 2** (linkitys) – laitteisto. Tämä dokumentti perustuu **IEEE 802.3** -standardiin (Ethernet).

## Mikä verkkokortti on?

Verkkokortti on:

| Komponentti | Selitys |
|-------------|---------|
| **Liitos** | PCIe / USB / M.2 – fyysinen liitos |
| **PHY** (Physical Layer) | Muuntaa digitaalisen tiedon sähkösignaaliksi |
| **MAC** (Media Access Control) | Osoite, kehysten luominen |
| **Muisti (buffer)** | Tilapäistö paketeille |
| **ROM (firmware)** | BIOS/EFI – laitteen alkukonfigurointi |

## Miksi verkkokortti on tärkeä?

Verkkokortti on rajapiirsi – se on se kohta, jossa digitaalinen tieto muuttuu sähkösignaaliksi. Ilman sitä tieto ei kulje verkolle.

## MAC-osoite

Jokaisella verkkokortilla on ainutlaatuinen MAC-osoite – 48-bittinen tunnus, joka on kirjoitettu ROMiin (EEPROMiin). Sen voi tarkistaa näin:

```bash
ip link show eth0
cat /sys/class/net/eth0/address
```

Esimerkkatuloste:

```text
00:11:22:33:44:55
```

!!! info "OUI-osoite"

    MAC-osoitteen kolme ensimmäistä tavua (00:11:22) ovat valmistajan tunnus (OUI – Organizationally Unique Identifier). Tämä on IANA:n ylläpitämä rekisteri.

## Nopeudet

Ethernet-verkkokortit ovat kehittyneet valtavalla vauhilla:

| Nopeus | Vuosi | Standardi | Selitys |
|--------|-------|-----------|---------|
| 10 Mb/s | 1990 | 10BASE-T | Alkuperäinen Ethernet |
| 100 Mb/s | 1995 | 100BASE-TX | Nopeampi |
| 1 Gb/s | 1998 | 1000BASE-T | Gigabit Ethernet |
| 10 Gb/s | 2002 | 10GBASE-T | Paketintason nopeus |
| 25/40/100 Gb/s | 2010+ | useat | Tietysti |

### Half-duplex vs Full-duplex

| Tila | Selitys | Hyöty |
|------|---------|-------|
| **Half-duplex** | Lähetä ja vastaanota vuorotellen | Edullisempi, vanhempi |
| **Full-duplex** | Lähetä ja vastaanota samanaikaisesti | Kaksinkertainen, vähemmän törmäyksiä |

## Autonegoisointi (Auto-Negotiation)

Verkkokortit neuvottelevat automaattisesti toistensa kanssa: "Mitä nopeuksia tukee?" Tämä on standardoitu IEEE:ssä **802.3u** (Fast Ethernet). Jos yhteys epäonnistuu, molemmat laskeutuvat 10 Mb/s:ään.

## Portin valinta (port selection)

PCI-verkkokortit saavat fyysiset portit eri tavoin:

| Tyyppi | Selitys |
|--------|---------|
| **RJ-45** | Kuparikaapeli (802.3) – yleinen |
| **SFP** (Small Form-factor Pluggable) | Vaihdettava moduuli (kuitu/fiber) |
| **QSFP** | Quad SFP – 40/100 Gb/s |

## Seuraavaksi

Kun olet ymmärtänyt verkkokortin roolin, siirrytään [kaapelointiin](kaapelointi.md), jossa käsitellään verkon fyysisiä yhteyksiä – kaapelit, kuitu ja mediat.
