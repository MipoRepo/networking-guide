# UDP (User Datagram Protocol)

**UDP** (User Datagram Protocol) on yksinkertainen, yhteyden vaatiton siirtoprotokolla, joka perustuu **RFC 9290** -standardiin (yhdessä QUIC:n kanssa). UDP ei taata järjestystä tai uudelleenlähetystä – sen sijaan se korostaa nopeutta ja tehokkuutta.

## Mitä tämä sivu käsittelee?

- **UDP-headeri** – portit ja tarkistus
- **UDP:n ominaisuudet** – yhteyden vaatimaton, nopea
- **Käyttöesimerkit** – DNS, video, pelit

## UDP-headeri

UDP-paketin oletus on 8 tavua (yhdessä otsikointi):

| Kenttä | Selitys |
|--------|---------|
| **Source Port** | Lähettäjän portti |
| **Destination Port** | Vastaanottajan portti |
| **Length** | Paketin koko (tavuina) |
| **Checksum** | Tarkistus (valinnainen) |

## UDP:n ominaisuudet

| Ominaisuus | Selitys |
|------------|---------|
| **No connection** | Ei kolmen-tason kättä |
| **No ordering** | Paketit saapuvat järjestämättä |
| **No retransmission** | Virheissä tapauksissa ei yritetä uudelleen |

## TCP vs UDP – vertailu

| Ominaisuus | TCP | UDP |
|------------|-----|-----|
| Yhteys | Kyllä (Three-way handshake) | Ei |
| Järjestys | Kyllä | Ei takaa |
| Virheenkäsittely | Kyllä (checksum + retransmit) | Vastaanotto vain (checksum) |
| Nopeus | hitaampi | nopeampi |
| Head-of-line | Kyllä | Ei |
| Koko | isompi | pienempi |

## UDP:n käyttöesimerkit

### DNS

DNS-kyselyt lähetetään yleensä UDP:llä porttiin **53**:

```text
Client: UDP 192.168.1.100:54321 → 8.8.8.8:53
Server: UDP 8.8.8.8:53 → 192.168.1.100:54321
```

### Videoneuvottelut (VoIP)

| Protoko | Portti | Käytetty | Esimerki |
|---------|--------|----------|----------|
| RTP | 5004/5005 | Ääni/video | Zoom, Teams |
| SIP | 5060 | Istunto | VoIP-puhelut |

### Pelin siirto

Monet verkkopelit käyttävät UDP:ta, koska:

- Nopeus on tärkeämpää kuin täydellisyys
- Päivitystiivystys tarkistaa virheellisyyden

## UDP:n tarkistus

UDP tarkistuksen voidaan päättää:

- **Lähetettyen**: Jos tarkistus virheellinen, paketti hylätään
- **Vastaanotetut**: Jos tarkistus virheellinen, vastaanottaja voi lähettää ICMP-ilmoituksen

## UDP ja NAT

UDP:n yhteyden välitys NAT:in kautta voi aiheuttaa ongelmia:

| Ongelma | Selitys |
|---------|---------|
| Timeout | Istunto voi vanheta nopeasti |
| Firewall | NAT-palomuurit blokkaa usein UDP-liikennettä |

!!! tip "UDP ja WebRTC"

    WebRTC (Web Real-Time Communication) käyttää UDP:ä, mutta voi käyttää myös TCP:tä tai SCTP:tä, jos UDP puuttuu.

## Esimerkkikäsittely (Wireshark)

```text
Frame 1: 74 bytes
Ethernet II, Src: 00:11:22:33:44:55, Dst: 66:77:88:99:aa:bb
Internet Protocol Version 4, Src: 192.168.1.100, Dst: 8.8.8.8
User Datagram Protocol, Src Port: 54321, Dst Port: 53
    [Length: 54]
    [Checksum: 0x1234]
```

## UDP:n rajoitukset

| Rajoite | Selitys |
|---------|--------|
| No ordering | Paketit saapuvat järjestämättä |
| No retransmit | Virheitä ei korjattu |
| Ei flow-control | Ei säädä siirtonopeutta |

## Seuraavaksi

Seuraavaksi tarkastellaan [ssh.md](ssh.md), jossa käsitellään SSH-protokollaa ja sen käyttöä komentoyhteyksien suojaamisessa.
