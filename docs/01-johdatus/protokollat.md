# Protokollat ja viitekehyt

Verkot eivät toimi itsessään – ne vaativat **sopimuksia** ja määritelmiä siitä,
miten laitteet kommunikoivat. Nämä sopimukset ovat **protokolloja**
(*protocols*), ja ne on järjestetty usein **viitekehyeiin** (*models*), jotka
ankkuroivat protokollien toiminnan eri kerroksiin.

Tämä osio käsittelee kahta keskeistä viitekehdetta:

1. **OSI-malli** (*OSI model*) – teoreettinen 7-kerroksinen malli.
2. **TCP/IP-malli** (*TCP/IP model*) – käytännön mukainen 4–5-kerrosmalli.

---

## Mikä on protokolla?

**Protokolla** (*protocol*) on määritelmä siitä, miten kaksi tai useampi laite
viestii keskenään. Se määrittelee:

- **Mitä tietoja lähetetään** (muoto, koko, koodaus)
- **Milloin ja miten** lähetetään (aikataulu, järjestys)
- **Miten vastaanetaan ja prosessoidaan** (vastaanottaminen, tarkastus)
- **Miten virheet käsitellään** (uudelleenlähetys, virhekoodit)

Esimerkkinä:

> Kun selailen verkkosivua, selain lähettää HTTP-pyynnön. Tämä pyyntö
> purettaan **TCP:n** paketiksi, joka kantaa **IPv4-osoitteen**, joka edelleen
> kulkee **Ethernet-kehyksen** kautta fyysisen välittimen läpi.
>
> Jokainen näistä on protokolla, joka hoitaa oman osionsa.

!!! info "Protokollan ja ohjelman ero"

    Protokolla **on standardi**, eikä siksi ole ohjelmisto. Protokolla on
    yhteiset säännöt, jotka kaikki tahot noudatettaviaan. Tämä tarkoittaa, että
    eri valmistajien laitteet – vaikka ne ovatkin eri laatuiset – voivat
    kommunikoida keskenään, kun ne noudattavat samaa protokollaa.

    Esimerkiksi Ethernet (IEEE 802.3) on protokolla, joka toimii sekä
    Cisco- että HP-laitteissakin, koska ne molemmat noudattavat samaa standardia.

---

## OSI-malli

**OSI-malli** (*Open Systems Interconnection model*) on teoreettinen viitekehys,
joka jakaa verkkoyhteyden seitsemään kerrokseen. Jokainen kerros vastuuttaa
omaa osiotaan, ja alhaisempi kerros tarjoaa palveluja ylemmälle kerrokselle.

| Kerros | Nimi | Esim. paketit | Esim. laitteet |
| ------ | ---- | ------------- | -------------- |
| 7 | Sovellus | HTTP, SSH, DNS | Selaimet, palvelimet |
| 6 | Esitys | SSL/TLS, JPEG | Salauskirjastot |
| 5 | Istunto | NetBIOS | RPC |
| 4 | Kuljetus | TCP, UDP | Käyttis-kirjastot |
| 3 | Verkko | IP, ICMP, ARP | Reititin |
| 2 | Siirto | Ethernet, kehys | Kytkin |
| 1 | Fyysinen | Bitit, signaalit | Kaapeli, valo |

!!! info "OSI:n seitsemän kerrosta"

    OSI-mallin järjestelmällinen lähestymistapa on se, että jokainen kerros pystyy
    toimimaan itsenäisesti. Esimerkiksi:

    - **Fyysisessä kerroksessa** (1) tarkoitetaan fyysistä yhteyttä: kaapeli,
      signaalin muotoilu ja bittitaajuus. Tämä on juuri ne, mitä voidaan mitata.
    - **Siirtomerkissä** (2) tarkastellaan paketin virheenkorjausta ja osoitteistusta.
      Ethernet ja WiFi ovat tässä kerroksessa.
    - **Verkkokerros** (3) on IP:n toiminta – paketit saavat osoitteet ja
      päätetään reittinsä.
    - **Kuljetuskerros** (4) tarjoaa luotettavan siirron (TCP) tai nopean
      yksinkertaisen siirron (UDP).
    - **Ylemmät kerrokset** (5–7) käsittelevät istuntoja, esitystä ja sovelluksia.

    Tämä on tärkeä ajatus, koska se auttaa ymmärtämään, mitä kukin protokolla vastuuttaa.
    Esimerkiksi `ping`-komennon toiminnan ymmärtämistä varten tarvitaan
    **ICMP**-protokolla (verkkokerros), eikä se koske esimerkiksi
    **Ethernetiä** (siirtomerkki).

### Ks. myös

- [Ethernet-kehys](../02-ethernet/frame.md) – siirtomerkin paketointi
- [IPv4-osoitteet](../03-ipv4/ip-osoite.md) – verkkokeran paketointi
- [TCP ja UDP](../10-tcp-udp-ssh-http/index.md) – kuljetuskeran kahden wuai
- [HTTP](../10-tcp-udp-ssh-http/http.md) ja [SSH](../10-tcp-udp-ssh-http/ssh.md) – sovelluskeran wuai

---

## TCP/IP-malli

**TCP/IP-malli** (*Transmission Control Protocol / Internet Protocol model*) on
käytännön mukainen viitekehys, joka on ollut pohjana internetille. Se on
tiivis – neljässä (tai viidessä) kerroksessa kattaa sen, mitä OSI-malli vie
seitsemään.

| # | Kerros | Ekvivalentti OSI-kerrelle | Esim. protokollat |
| --- | ------ | ------------------------ | ----------------- |
| 4 | Sovellus | 5–7 | HTTP, HTTPS, DNS, SSH |
| 3 | Kuljetus | 4 | TCP, UDP |
| 2 | Internet | 3 | IP, ICMP, ARP |
| 1 | Linkki | 1 + 2 | Ethernet, WLAN, MAC |

!!! info "TCP/IP vs OSI"

    TCP/IP-mallin ja OSI-mallin ero on seuraava:

    - **Tehtävä:** OSI-malli on teoreettinen opetussyy, kun taas TCP/IP-malli
      on käytännön mukainen, joka on ollut internetin pohjana.
    - **Kerrosten määrä:** OSI on seitsemän kerrosta, TCP/IP on neljässä (tai
      viidessä).
    - **Linkkikerros:** TCP/IP yhdistää fyysisen ja siirtomerkin kerrokset yhteen,
      kun taas OSI erottaa ne.

    Tärkeitiä eroja:

    - TCP/IP-mallin **soveltuskerros** yhdistää OSI-mallin kolme ylemmän kerroksen
      (istunto, esitys, sovellus) yhteen.
    - TCP/IP-mallin **Internet-kerros** vastaa OSI-mallin verkkokerrosta, ja se
      on tarkemmin standardoitu (IPv4 RFC 791, IPv6 RFC 8200).

### TCP/IP-protokollat

| Protokolla | Lyhenne | Selitys | Kerros |
| ---------- | ------- | ------- | ------ |
| IP | Internet Protocol | Osoitteiden määrittely ja paketin kuljetus | Internet (3) |
| ICMP | Internet Control Message Protocol | Virhe- ja tilaraportit | Internet (3) |
| ARP | Address Resolution Protocol | MAC-osoitteen haku IP-osoitteen perusteella | Linkki (2) |
| TCP | Transmission Control Protocol | Luotettava, virheenkorjattu yhteys | Kuljetus (4) |
| UDP | User Datagram Protocol | Nopea yhteys ilman vahvistusta | Kuljetus (4) |
| HTTP | HyperText Transfer Protocol | Web-sivun siirto | Sovellus (5–7) |
| HTTPS | HTTP over TLS/SSL | Salattu HTTP-yhteys | Sovellus (5–7) |
| SSH | Secure Shell | Salattu pääteyhteys | Sovellus (5–7) |

!!! info "Protokollien pino (protocol stack)"

    Kun pakettia lähetetään verkkoon, se kulkee **protokollikortiossa**
    (*protocol stack*) läpi jokaisen kerroksen. Jokainen kerros lisää oman
    päätteen ( *headerin* ) paketin päälle ennen lähetystä, ja jokainen vastaanottava
    kerros poistaa päälleen vastaanotettuaan.

    Esimerkiksi, kun lähetetään HTTP-pyyntö:

    1. **Sovellus** (HTTP) muodostaa pyynnön.
    2. **Kuljetus** (TCP) lisää päänanan porttimien.
    3. **Internet** (IP) lisää päätteen lähettäjälle ja vastaanottajalle.
    4. **Linkki** (Ethernet) lisää MAC-osoitteet ja kehyksen.
    5. **Fyysinen** (Physical) muuntaa paketin signaaliksi.

    Vastaanottettaessa jokainen kerros poistaa päälleen, ja lopulta sovellus saa
    alkuperäisen HTTP-pyynnöksen.

### RFC-viitteet

TCP/IP-mallin standardit ovat määritelty IETF:n **RFC**-dokumenteissa:

| RFC | Nimi | Kuvaus |
| --- | ---- | ------ |
| RFC 791 | Internet Protocol | IPv4-protokolla |
| RFC 792 | Internet Control Message Protocol | ICMP (ping, virhetiedotteet) |
| RFC 793 | Transmission Control Protocol | TCP – luotettava kuljetus |
| RFC 768 | User Datagram Protocol | UDP – nopea kuljetus |
| RFC 2616 | HTTP/1.1 | Web-protokolla |
| RFC 826 | Address Resolution Protocol | ARP |
| RFC 2460 | Internet Protocol, Version 6 | IPv6 |

!!! warning "RFC-numeroiden päivittyneisyys"

    Tämä lista viitteisiin perusprotokoiloihin, mutta RFC-dokumentit päivittyvät
    säännöllisesti. Esimerkiksi HTTP/1.1 (RFC 2616) on korvattu HTTP/2:llä
    (RFC 7540) ja HTTP/3:lla (RFC 9114). Aina kun tarkistat protokolan yksityskyvyn,
    tarkista, että olet käyttänyt viimeisintä RFC-versiota.

---

## Lähteet

- ISO/IEC 7498-1: *Open Systems Interconnection – Basic Reference Model*
- IETF RFC 1122: *Requirements for Internet Hosts – Application and Support*
- IETF RFC 791: *Internet Protocol – DARPA Internet Program Protocol Specification*
- IEEE Std 802-2014: *IEEE Standard for Local and Metropolitan Area Networks*
- IEEE Std 802.3-2022: *IEEE Standard for Ethernet*
