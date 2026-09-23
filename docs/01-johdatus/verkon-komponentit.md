# Verkon komponentit

Verkosta muodostavat useimmittensa kolme perusryhmää:

1. **Päätelaitteet** (*end devices*) – käyttäjän tai sovelluksen päätepisteet
2. **Välityslaiteet** (*intermediate devices*) – kuljettavat paketteja eteenpäin
3. **Media** (*transmission media*) – fyysiset kanavat, joilla tiedoita kuljetetaan

Tämä jako on perusta verkkojen rakentamisessa. Jokainen komponentti on tarkoitettu
toimimaan yhdessä muiden kanssa muodostaen kokonaisen tiedonsiirtoketjun.

---

## Päätelaitteet (End Devices)

**Päätelaitteet** (*end devices*) ovat laitteita, jotka ovat verkon ääripäässä. Ne
ovat joko:

- **Lähettäjiä tai vastaanottajia** tiedon siirrossa
- **Pyytäjiä tai palveluttajia** sovelluksissa

Esimerkkejä ovat:

| Laite | Selitys | Verkkoprotokolla |
| ---- | ------- | --------------- |
| Työasema | Henkilön käyttämä tietokone | TCP/IP |
| Älypuhelin | Matkapuhelin, jossa on verkkoyhteys | TCP/IP, HTTP |
| Palvelin | Tarjoaa palveluita muiille laitteille | TCP/IP, HTTP, SSH |
| Verkkokamera | Lähettää videokuvaa verkkoon | RTSP, ONVIF |
| UPS | Estapeli-virtalähde, joka voi raportoida tilan | SNMP |
| Tulostin | Verkku- tai langallinen tulostin | IPP, SMB |
| Älyanturi | IoT-laitteisto, esim. lämpötilan mittaaja | MQTT, CoAP |

!!! info "Lisätietoa: Päätelaitteiden rooli verkossa"

    Päätelaitteet ovat useimmissa tapauksissa **lähteitä ja kohdetta** tiedonsiirrolle.
    Esimerkiksi kun selaat verkkosivua, selain on päätelaite, joka lähettää
    HTTP-pyynnön palvelimelle, joka on toinen päätelaite.

    Päätelaitteiden keskeinen rooli on muodottaa yhteyttä käyttäjän ja sovelluksen
    välillä verkon ja palvelun välillä. Ne ovat myös usein verkon **polttoaine** –
    ilman päätelaitteita verkko olisi tyhjä rakenteilta.

## Välityslaiteet (Intermediate Devices)

**Välityslaiteet** (*intermediate devices*) ovat laitteita, jotka ovat osa
verkon kuljetusketjua. Ne eivät ole lähteitä tai vastaanotto-aineita, mutta
ne ohjaavat paketteja eteenpäin ja näin muodostavat verkon.

Tärkeimmät ovat:

### Kytkin (Switch)

**Kytkin** (*switch*, engl. *network switch*) on laitteisto, joka yhdistää useita
verkon linkkejä yhteen. Se toimii **Data Link -kerroksen** (OSI-kerroksen 2)
määräyksissä ja käyttää **MAC-osoitteita** päätettääksensä, minne paketit lähetetään.

### Reititin (Router)

**Reititin** (*router*) on laite, joka yhdistää eri verkkoja yhteen ja päättää
paketin kulkureitin **Network -kerroksessa** (OSI-kerroksen 3). Se käyttää
**IP-osoitteita** päätettääkseen, minne paketit lähetetään.

### Palomuuri (Firewall)

**Palomuuri** (*firewall*) on turvallisuuslaite, joka tarkastelee verkossa kulkevaa
liikennettä ja päättää, onko se sallittua vai esto-moodissa. Se toimii usein
kohti- tai läpikäynninä.

### Langaton pääsy (Wireless Access Point)

**Access Point** (*WAP*) on laite, joka tarjoaa langattoman yhteyden verkkoon. Se
muuntaa langallisen verkon langattomiksi yhteyksiksi.

!!! info "Lisätietoa: Välityslaitteiden kerrosmäärä"

    Jokainen laitetyyppi toimittaa eri kerroksessa:

    - **Kytkin** (Linkki/Physical, kerros 1–2): Päättää MAC-osoitteiden perusteella.
    - **Reititin** (Network, kerros 3): Päättää IP-osoitteiden perusteella.
    - **Palomuuri** (Linkki–Application, kerros 2–7): Voi päättää kaikissa kerroksissa.
    - **Access Point** (Linkki, kerros 1–2): Tarjoaa fyysisen langattoman yhteyden.

    Tämä on erityisen tärkeää ymmärtää, koska se määrittelee, mitkä tiedot ovat
    käytettävissä päätöksenteossa.

## Verkkokortti (Network Interface Card, NIC)

**Verkkokortti** (*Network Interface Card*, lyh. **NIC**) on lisälaitteisto joka
asennetaan päätelaitteisiin. Se on vastuussa siitä, että laite voi liittyä
verkkoon. Verkkokortti sisältää:

- **MAC-osoitteen** – kiinteä, valmistajan asettama yksilöllinen tunnus
- **Fyysisen liittiman** – esim. RJ-45 (Ethernet) tai SMA (langaton)
- **Piirin** – joka kääntää digitaalisen tiedon analogiseksi signaalliksi

!!! info "Lisätietoa: MAC-osoitteen rooli"

    MAC-osoite on 6-tavuinen ainutlaatuinen tunnus, joka on määritelty valmistajalle
    IEEE:llä. Se on esimerkiksi tällainen:

    ```text
    00:1A:2B:3C:4D:5E
    ```

    Tämä muodostuu kahdesta osasta:
    - **OUI** (*Organizationally Unique Identifier*, 3 tavua): valmistajan tunnus
    - **NIC-aika**: valmistajan antama ainuttainen tunnus

    MAC-osoitettua tarkastellaan tarkemmin osiossa [Mac-osoitteet](../02-ethernet/mac-osoitteet.md).

## Verkko-media (Transmission Media)

**Verkko-media** (*transmission media*) ovat fyysiset kanavat, joiden kautta
signaaleja kuljetetaan. Ne jaetaan kahteen ryhmään:

| Ryhmä | Selitys | Esimerkki | Hyvät puolet | Huonot puolet |
| ----- | ------- | --------- | -------------- | --------------- |
| **Ohjaimet** | Signaali kulkee mediassa | Langallinen kaapeli | Kestävä, suojattu | Rajoitettu liikkuvuus |
| **Ohjaimattomat** | Signaali leviää ilmassaan | Langaton verkko | Helppo asennus | Haavoittuva häiriöille |

### Langalliset mediat

| Media | Selitys | Nopeus | Käyttöaluee |
| ----- | ------- | ------ | ----------- |
| **Kierroskumi** (*Twisted Pair*) | Kaksi kietoitettua juonta, usein 8-poltteinen (RJ-45) | 100 Mb/s – 10 Gb/s | Ethernet, kotiverkot |
| **Sileä varjo** (*Coaxial Cable*) | Yksi keskinen johdin ja eristin, historiallinen | 10 – 100 Mb/s | Vanhat lähiverkot |
| **Optinen putki** (*Fiber Optic*) | Valo kulkee kuidussa | 1 – 100 Gb/s | Pitkät matkat, valtavälit |

!!! info "Lisätietoa: Optisen kaapelin tiedonsiirto"

    Optinen kaapelin periaate on valon kulkeutuminen kuiduksessa. Valo kulkee
    lasin kuidun sisällä, ja se on erittäin herkkä ulkoisille häiriöille ja
    sähkömagnetillisille kentöille. Tämä tekee siitä erinomaisen valinnan
    pitkoille matkoille ja laajille tiedonsiirronopeuksille.

### Langattomat mediat

| Media | Selitys | Taajuu | Käyttöaluee |
| ----- | ------- | ------ | ----------- |
| **Langattomat verkot** (*Wireless LAN*) | WiFi-protokolla (IEEE 802.11) | 2,4 GHz, 5 GHz, 6 GHz | Kotiverkot, toimisto |
| **Langattomat verkot** (*Cellular*) | Matkapuhelinverkot (4G/5G) | 700 MHz – 6 GHz | Liikkuvat laitteet |

### Siirtotavat (Transmission Modes)

Siirtotavoissa on kolme pääasiallista mallia, jotka määrittelevät, miten tiedot
virtaa verkossa:

| Tila | Selitys | Ks. myös |
| ---- | ------- | ------- |
| **Simplex** | Data kulkee yhden suunnan (lähetti -> vastaanottaja) | Esim. TV-lähetys |
| **Half-duplex** | Data kulkee molempiin suuntiin, mutta vuorotellen | Esim. kansan radio |
| **Full-duplex** | Data kulkee yhtäaikaisesti molempiin suuntiin | Esim. puhelin |

!!! varoitus "Tärkeä huomio: Duplex-moodit"

    *Half-duplex*-verkoissa kaikki lähettäjät ja vastaanottajat jakavat saman kanavan,
    jolloin ne voivat kuulla toistensa tiedon. *Full-duplex*-verkoissa taas jokaisella
    yhteydellä on oma kaksisuuntainen kanava, mikä antaa nopeamman ja vakaamman siirron.

    Ethernet-alkupätinä *half-duplex*-moodissa on kaksinkertaisempi hallinta kuin
    full-duplex-tilassa, jossa voidaan käyttää täyden kaasun nopeutta.
