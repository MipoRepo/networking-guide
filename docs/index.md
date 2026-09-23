# Tietoverkot – tekninen tietopohja

Tämä on itsenäinen, tekninen tietopohja verkkoyhteyksiin, verkko-arkkitehtuuriin ja
verkkoprotokolliin liittyvistä käsitteistä. Sen tarkoitus on tarjota **selkeä, tarkka ja
käytännöllinen lähde tietoverkkojen keskeisistä mekaniikoista** – sekä opiskelijalle
johkaisevalle verkko-ohjelmistokehittäjälle että DevOps-arkkitehdiställe.

Dokumentaatio poikkeaa kurssista: siinä ei ole aikatauluja, suoritusohjeita,
harjoitustehtäviä tai tenttivaatimuksia. Se on käännetty opetukselliseksi
viitekesikoksi, jonka avulla verkkuustoteetuksia ja niiden välistä vuorovaikutusta
voi oppia ja kerrata itsenäisesti.

---

## Mitä tämä dokumentaatio kattaa?

Sisältö on järjestetty 14 osioon, jotka muodostavat loogisen kokonaisuuden
fyysisistä verkoista sovelluksenä pidettyn internetin reititykseen asti.

| Osio | Otsikko | Keskeiset aiheet |
| ------ | ------- | --------------- |
| 01 | Johdatus tietoverkkoihin | Verkon peruskäsitteet, OSI- ja TCP/IP-mallit, standardit, IANA/RIR-järjestelmä |
| 02 | Ethernet, kytkintä ja VLANit | Ethernet-kehys, MAC-osoitteet, kytkimet, VLAN, 802.1Q taggaus |
| 03 | IPv4-osoitteet, aliverkot ja ARP | IPv4-osoitteet, aliverkot (subnet), subnetointi, ARP, broadcast |
| 04 | DHCP ja staattinen reititys | DHCP-prosessi, oletusyhdyskäytävä, staattinen reititys, reititystaulu |
| 05 | Verkkolaitteet ja kaapelointi | Kytkin, reititin, palomuuri, verkkokortti, kaapelointi ja mediarodit |
| 06 | Spanning Tree | Verkkosilmukat, STP, RSTP –silmukankäynnin ehkäminen |
| 07 | IPv4-reititys | Reitinimistö, OSPF, staattinen ja dynaaminen reititys |
| 08 | Verkon segmentointi ja palomuurit | Verkkosegmenttien erottaminen, palomuurit, liikenteensuodatus |
| 09 | IPv4 NAT | NAT, staattinen NAT, dynaaginen NAT, PAT –osoitteistumismaskeeraus |
| 10 | TCP, UDP, SSH ja HTTP | OSI:n 4.–7. kerrot, portit, TCP-yhteys, UDP, SSH, HTTP |
| 11 | Palvelimet, päätelaitteet ja WLAN | Palvelinrokit, päätelaitteet, WLAN 802.11, langaton verkko |
| 12 | DNS | Nimipalvelu, DNS-hierarkia, tietueet (A, AAAA, CNAME, jne.) |
| 13 | IPv6 | IPv6-osoitteet, muotoilu, osoitteistus, dual-stack |
| 14 | Border Gateway Protocol (BGP) | BGP, autonomous system, reitit, internetin reititys |

---

## Viite- ja verkkomallit

Ennen yksittäisten protokollien syventymistä on hyvä ymmärtää, miten verkot jaetaan
kerroiksi ja mitkä viitekehyt varaavat yhteydet. Tämä dokumentaatio perustuu kahteen
vakiintuneeseen malliin:

### OSI-malli (7 kerrosta)

| Kerros | Nimi | Keskeiset protokollat ja laitteet |
| ------ | ---- | ------ |
| 7 | Sovellus (Application) | HTTP, SSH, DNS, SMTP, FTP |
| 6 | Esitys (Presentation) | SSL/TLS, salaus, koodaus |
| 5 | Istunto (Session) | NetBIOS, RPC, istuntosäätely |
| 4 | Kuljetus (Transport) | TCP, UDP |
| 3 | Verkko (Network) | IP, ICMP, ARP, reititys |
| 2 | Siirto (Data Link) | Ethernet, MAC, kytkin, silta |
| 1 | Fyysinen (Physical) | Kaapelit, mediat, taajuuksit, modulaatio |

!!! info "Lisätietoa: OSI-malli"

    OSI-malli (Open Systems Interconnection) on teoreettinen viitekehys, joka jakaa
    verkkoyhteyden seitsemään kerrokseen. Vaikka se itsessään ei ole protokolla –
    valaistu eikä suoraan toteuta – sitä käytetään laajalti opetuksessa ja verkkojen
    vianmääräyksessä. Jokainen kerros vastuuttaa oman osionsa: fiksinen kerros voi
    päivitettää ilman, että se rikkoo muita kerroksia. Tämä "kerrostettu" lähestymistapa
    on keskeinen verkkoarkkitehtuurin periaate.

    Lähde: ISO/IEC 7498-1, IETF RFC 1006.

### TCP/IP-malli (4–5 kerrosta)

| Kerros | Nimi | Ekvivalentti OSI-kerrelle | Protokollat |
| ------ | ---- | ------------------------ | ----------- |
| 4 (5.) | Sovellus | 5–7 | HTTP, DNS, SSH, SMTP |
| 3 | Kuljetus | 4 | TCP, UDP |
| 2 | Internet | 3 | IP, ICMP, ARP |
| 1 | Linkkikäytävä | 1–2 | Ethernet, WiFi, MAC |

!!! info "Lisätietoa: TCP/IP-malli"

    TCP/IP-malli on käytännön käyttöinen malli, jota noudattaa nykyinen Internet.
    Se on tiivis: neljässä ( tai viidessä ) kerroksessa kattaa sen, mitä OSI-malli
    ottaa seitsemään. TCP-varmistettu siirto ja UDP-nopea, ilmainen siirto ovat
    tärkeitä kuljetuskerroksen mekanismeja. Internet-kerros vastaa IP-osoitteistusta
    ja reititystä. Tämä on se malli, joka on toteutettu kaikissa moderneissa
    käyttöjärjestungeissä ja verkkoympäristöissä.

    Lähde: IETF RFC 1122, RFC 791.

---

## Miten käyttää tätä dokumentaatiota

1. **Uudelleenoppimiskierros** – Aloita osiosta 01 ja edeten järjestissä. Jokainen
   osio sisältää oman aloitus-sivunsa (`index.md`), joka esittelee kyseisen osion
   kokonaisuus. Sisäiset linkit ohjaavat liittyvistä käsitteistä.

2. **Haku tietyistä käsitteistä** – Hyödynnä MkDocs Material -teeman oikean laidan
   hakua. Esimerkiksi hakusanat `ARP`, `subnet mask`, `802.1Q` tai `OSPF` palauttavat
   kaikki asiaan liittyvät sivut.

3. **Viite sivun reunassa** – Jokaisella sivulla on oikean sivemenetettä sisällysluettelo,
   joka näyttää tämän osion rakenteen. Käytä sitä hypätäksesi eri osiin.

!!! tip "Suositeltu aloituspolku"

    Jos et ole aiemmin tutustunut verkkoihin, suositellaan seuraavaa järjestystä:

    01 → 02 → 03 → 04 → 07 → 10 → 12 → 13 → 14

    Tämä polku kattaa kaikki perusmuodotukset (Ethernet, IP, reititys, sovellus- ja
    nimipalvelu) ennen kuin siirrytään monimutkaisempiin aiheisiin (NAT, palomuurit, BGP).

---

## Lähteet ja viitteet

### Päälähde

* **JAMK Tietoverkot – verkko-ohjelmistokehitys-opintojakso**
  URL: <https://tietoverkot.pages.labranet.jamk.fi/>

  Tämän dokumentaation tekniset tiedot ja käsitteistot on kirjoitettu uudelleen
  selkeästä teknisestä lähteestä, jotta sisällöt ovat nykyaikaisia ja itsenäisiä.
  Lähteessä viitataan IEEE-standardiin, IETF RFC:iin ja valtiollisiin dokmenteihin.

### Viite- ja standardoituslähteet

| Lähde | Tyyppi | Kuvaus |
| ----- | ------ | -------- |
| **IETF RFC -dokumentit** | Standardi | Internet Engineering Task Forcein standardit, esim. RFC 791 (IPv4), RFC 826 (ARP). |
| **IEEE-standardit** | Standardi | Esim. IEEE 802.3 (Ethernet), IEEE 802.11 (WLAN), IEEE 802.1Q (VLAN-taggaus). |
| **Linux-verkosto-ohjeet** | Käytännön opasteet | `ip`, `route`, `iptables`-työkalujen dokumentaatio. |
| **IANA / RIR-järjestöt** | Organisaatio | IP-osoitteiden ja autonomous system -numeroiden globaali koordinaatio. |

!!! info "Lisätietoa: Lähteiden luotettavuus"

    Dokumentaation lähteinä toimivat pääasiassa IETF RFC -dokumentit sekä IEEE:n
    standardit – ne ovat avoimia, kansainvälisiä tekisiä standardeja, jotka ovat
    itsenäisiä opetussisällöistä. Niiden tavoitteena on tarjota tarkka, täsmällinen
    ja vakiintunut kuvaus protokollisten toiminnasta. Tällaisten lähteiden kanssa
    on työskenneltäessä tulee muistaakseen, että standardit päivittyvät vuosittain,
    ja että tietty protokollan versio voi olla vanhentunut.

---

## Sanasto

Tämä dokumentaatio käyttää suomenkielisiä käsitteitä, joiden päällä on englanninkieliset
vastineetsanat. Esimerkiksi:

* **oletusyhdyskäytävä** (*default gateway*) – reititin osoite, jonka läpi paikallinen
  aliverkko yhdistyy laajempaan verkkoon.
* **lähetysalue** (*broadcast domain*) – verkollinen alue, jossa kaikki lähetykset
  saapuvat kaikkiin liittyneisiin laitteisiin.
* **reititystaulu** (*routing table*) – taulu, jossa on tiedossa reittien päätökset
  paketin kohdeosoitteen perusteella.

---

*Tämä dokumentaatio on luokiteltu Creative Commons -lainsäädännön mukaisesti, ja sen
pohjana on tekninen lähteiden analyysi. Sisällöt ovat itsenäisiä muutoksia.*
