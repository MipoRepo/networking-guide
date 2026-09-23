# Ethernet-kehys

**Ethernet-kehys** (*Ethernet frame*) on paketti, joka kulkee Ethernet-verkon
linkkikerroksessa (OSI-kerros 2). Se on kotelo, jossa on lähettäjän ja vastaanottajan
MAC-osoitteet, datan ja virheentarkistus.

!!! info "Ethernet-kehyksen rooli"

    Ethernet-kehys on se, mitä kytkin lukee ja päättää sen perusteella, minne
    pakettia kuljetetaan. Kehyksen sisällä on kaikki tarvittava tieto kuljetuksen
    suhteen.

## IEEE 802.3 -kehysmuoto

IEEE 802.3 -standardi määrittelee dva kehyksen muotoa:

1. **Standardikäsitteinen kehys (DIX kehys)** – 32-bittinen muoto
2. **IEEE 802.3 -kehys** – 39-bittinen muoto (alkupainen muoto)

Käytännössä nämä ovat sama asia: ne ovat yhteensopivia, ja useimmissa verkkoissa
käytetään DIX-muotoa. Tässä käsittelemme DIX-muotoa, joka on yleisemmin käytetty.

### Kehyksen kentät

| Kenttä | Pituus | Selitys |
| --- | --- | --- |
| Preamble | 7 tavua | Aina vaihtuvat 1 ja 0, synkronointia varten |
| SFD | 1 TKU | Asettaa päätepisteen, merkkaa kehyksen alku |
| Määränpään MAC-osoite | 6 TKU | Vastaanottajan osoite |
| Lähettäjän MAC-osoite | 6 TKU | Lähettäjän osoite |
| EtherType | 2 TKU | Tämä sisältää mitä sisällä oleva protokolla on |
| Payload | 46–1500 TKU | Varsinainen data |
| FCS | 4 TKU | Virheentarkistus |

### Kenttien yksityiskohdat

#### Preamble (7 tavua)

Preamble on seitsemän tavua, jotka ovat aina valmiita 10101010 -malliin. Sen
tarkoitus on:

- Synkronoida vastaanottimen ja lähettimen välinen ajoitus
- Antaa vastaanottimen aikaa valmistautua vastaanottoon

#### Start Frame Delimiter (SFD, 1 TKU)

**Start Frame Delimiter** (*SFD*) on yksi tavu, joka merkkaa kehyksen alku:

```text
1 1 0 1 0 1 0 1  (SFD = 0xD5)
```

Se eroaa preamblesta, jotta vastaanottimen on helppo erottaa ne.

#### MAC-osoitteet

Määränpään MAC-osoite (6 TKU) ja lähettäjän MAC-osoite (6 TKU) ovat
48-bittisestä osoitteista. Ne ovat kuvattu
[MAC-osoitteet](mac-osoitteet.md)-dokumentissa.

!!! info "Erityis-MAC-osoitteet"

    - **Broadcast**: `FF:FF:FF:FF:FF:FF` – lähetetään kaikkiin laitteisiin
    - **Multicast**: `01:00:5E:xx:xx:xx` – lähetetään ryhmälle laitteita

#### EtherType

**EtherType** on 16-bittinen kenttä, joka kertoo, mitä sisällä oleva paketti on.
Se on keskeinen osa protokollien päällekkäisyyden välttämistä.

| EtherType | Protokolla | Selitys |
| --- | --- | --- |
| `0x0800` | IPv4 | RFC 791 |
| `0x0806` | ARP | RFC 826 |
| `0x86DD` | IPv6 | RFC 8200 |
| `0x8100` | 802.1Q | VLAN-taggaus (katso vlan.md) |

!!! info "EtherType-numeroiden ylläpito"

    EtherType-numerot ovat IANA:n ylläpitämälista. Ne antavat kytkimen tiedoksi,
    että paketti sisältää esimerkiksi IPv4- tai IPv6-kehyksen.

#### Payload (46–1500 TKU)

**Payload** on varsinainen datan sisältävä osio kehyksestä. Sen koko on vähintään
46 TKU:tä ja enintään 1500 TKU:tä.

!!! warning "Miksi minimi on 46 tavua?"

    Kun kehyksen kokonaiskoko on pienempi kuin 64 TKU:tä (mukaan luettuna
    preamble + SFD + 12 TKU:tä MAC-osoitteille + 2 TKU:tä EtherType + 46 TKU:tä
    payload + 4 TKU:tä FCS), se on **frame-tason ongelma** ( *collision* ). Tämä
    tarkoittaa, että välisegmentti (esimerkiksi puolivalmiinti Ethernet) voi
    virheellisesti tulkita paketin virheelliseksi, eli liian lyhyeksi. Siksi,
    jos payload on alle 46 TKU:tä, se täydentää siihen 0-tavuilla ( *padding* ).

#### Jumbo-kehys

**Jumbo-kehys** (*jumbo frame*) on kehys, joka voi käyttää enintään 9000 TKU:tä
payloadia (joskus jopa enemmän). Ne ovat suunniteltu erityisesti suurten datan
siirron nopeuttamiseksi, kuten esimerkiksi:

- Tiedon siirto palvelinten välillä
- Tiedon siirto tiedonlaitteiden välillä

!!! warning "Jumbo-kehysten yhteensopivuus"

    Jumbo-kehysten käyttö vaatii, että **kaikki** laitteet verkossa tukevat sitä.
    Jos joku laite ei tue sitä, se voi hylätä paketit, mikä johtaa yhteydenkatkoihin.

#### FCS (Frame Check Sequence, 4 TKU)

**FCS** (*Frame Check Sequence*) on 32-bittinen tarkistussumma (CRC), joka
auttaa vastaanottimessa havaitsemaan virheitä siirron aikana. Se lasketaan
lähettäjän puolella ja tarkistetaan vastaanottimen puolella.

| FCS-ominaisuus | Selitys |
| --- | --- |
| Pituus | 4 TKU:tä (32 bitiä) |
| Algoritmi | CRC-32 (Cyclic Redundancy Check) |
| Toiminta | Tarkistaa, että data ei ole vaurioentunut siirron aikana |

!!! info "FCS-virheiden seuraukset"

    Jos vastaanottimen FCS-tarkastus paljastaa virheen, kehys hylätaan ja
    tiedon uudelleen toimitus on lähettäjän ja yhteisen protokollan vastuulla.
    Tämä on usein toteutettu esimerkiksi TCP-protokollariviässä uudelleenlähetyksellä.
