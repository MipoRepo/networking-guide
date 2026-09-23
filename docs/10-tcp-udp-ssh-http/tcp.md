# TCP (Transmission Control Protocol)

**TCP** (Transmission Control Protocol) on luotettava, yhteyden ottanut siirtoprotokolla, joka perustuu **RFC 9293** -standardiin. TCP taataan datan kokonaisuutta ja järjestystä, mikä tekee siitä ihannetun tiedostojen ja sähköpostien siirtoon.

## Mitä tämä sivu käsittelee?

- **TCP-headerin rakenne** – portit, järjestysnumero, tilat
- **Kolme-tason käsi** – SYN, SYN-ACK, ACK
- **Ohjennus ja virhekäsittely** – miten liikenne säädyntyy

## TCP-headeri

TCP-paketin oletusmuodossa on 20–60 tavua:

| Kenttä | Selitys | Esimerkki |
|--------|----------|-----------|
| **Source Port** | Lähettäjän portti | 54321 |
| **Destination Port** | Vastaanottajan portti | 80 |
| **Sequence Number** | Byte-järjestysnumero | 1001 |
| **Acknowledgment Number** | Vastausnumero | 1002 |
| **Data Offset** | Otsikon pituus | 5 (20 tavua) |
| **Flags** | SYN, ACK, FIN, RST | SYN, ACK |
| **Window Size** | Sallittu siirtoraja | 65535 |
| **Checksum** | Tarkastus | (laskutoimitus) |

## Kolme-tason käsi (Three-Way Handshake)

TCP-yhteyden avaaminen tapahtuu kolmessa vaiheessa:

1. **SYN** – Lähettäjä lähettää SYN-pyynnön porttiin 80
2. **SYN-ACK** – Palvelin vastaa SYN-ACK:lla
3. **ACK** – Lähettäjä vahvistaa yhteyden

```
Lähettäjä       Palvelin
   |    → SYN →       |
   | ← SYN + ACK ←    |
   |   ACK →          |
   |        ↑         |
   → Yhteys avattu ↑
```

## TCP:n tilat

TCP-yhteydellä on seitsemän tilaa:

| Tila | Selitys | Tapahtuma |
|------|----------|-----------|
| **CLOSED** | Ei yhteyttä | Alkus tila |
| **SYN-SENT** | Odotetaan vastausta | SYN lähetetty |
| **SYN-RECEIVED** | Vastaanotettu SYN | SYN vastaanotettu |
| **ESTABLISHED** | Aktiivinen yhteys | ACK vastaanotettu |
| **FIN-WAIT-1** | Lähetetty FIN | Suljetus aloitettu |
| **FIN-WAIT-2** | Odotetaan vastausta | FIN-ACK vastaanotettu |
| **TIME-WAIT** | Odotetaan mahdollisten viivalaistettujen pakettien | 2 * MSL aikaa |

## Ohjennus (Flow Control)

TCP käyttää **Ikkunsohjennusta** (Sliding Window) liikenteen sääteemiseen:

1. Lähettäjä lähettää tietyn määrän dataa
2. Vastaanottaja lähettää ACK vastaanotetuista
3. Jos ACK ei tulla, lähettäjä hidastaa tai lopettaa

!!! info "Go-Back-N vs Selective Repeat"

    - **Go-Back-N**: Jos paketti menetyetään, lähetetään kaikki paketit uudelleen
    - **Selective Repeat**: Vain menetyetty paketti lähetetään uudelleen

## Virhekäsittely

TCP tarkistaa virheet ** tarkistuksella** (checksum). Jos virhe löydetään:

| Tapahtuma | Toimenpide |
|-----------|------------|
| Corrupt packet | Vastaanottaja unohdtaa paketin |
| Duplicate | Vastaanottaja lähettää saman ACK:n |
| Timeout | Lähettäjä lähettää uudelleen |

## Portit

TCP käyttää **16-bittisiä portteja** (0–65535):

| Alue | Selitys | Esimerkit |
|------|---------|-----------|
| 0–1023 | Selkokäyttiset (Well-known) | 80 (HTTP), 22 (SSH) |
| 1024–49151 | Rekisteroidut | 3306 (MySQL) |
| 49152–65535 | Dynaamiset/epävakat | Sovellusvalinnat |

## Esimerkkikäsittely (Wireshark)

```text
Frame 1: 74 bytes
Ethernet II, Src: 00:11:22:33:44:55, Dst: 66:77:88:99:aa:bb
Internet Protocol Version 4, Src: 192.168.1.100, Dst: 10.0.0.1
Transmission Control Protocol, Src Port: 54321, Dst Port: 80
    [TCP Flags: 0x002 (SYN)]
    [Sequence: 1001]
```

## TCP:n rajoitukset

| Rajoite | Selitys |
|---------|--------|
| Head-of-line blocking | Jos yksi paketti viivästyy, kaikki jäljellä olevat viivästyyvät |
| Overhead | Jokainen yhteys tarvitsee tilaa ja järjestystä |
| No broadcast | TCP ei tue jakautamista (käytä UDP) |

## Seuraavaksi

Seuraavaksi tarkastellaan [udp.md](udp.md), jossa käsitellään UDP-protokollaa ja sen käyttöä.
