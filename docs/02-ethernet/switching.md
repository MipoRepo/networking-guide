# Kytkintä (Switching)

**Kytkintä** (*switching*) on prosessi, jossa paketit kuljetetaan verkon
sisällä päätöslaitteiden välillä. Tätä toteuttavat yleensä **kytkimet**
(*switches*), jotka ovat linkkikerron (OSI-kerros 2) päättävä laitteistoita.

!!! info "Kytkimen ja silta (bridge) ero"

    Kytkin on teknisesti ottaen monitoimiasema silta.
    - **Silta** (*bridge*) yhdistää kaksi verkkoa
    - **Kytkin** on moniportteinen silta – se voi liittää useita verkkoja yhteen

## MAC-osoitekirjasto (MAC Address Table)

Kytkin pitää **MAC-osoitekirjan** (*MAC address table*), jossa on tiedossa:

- **Mihin porttiin** kukin MAC-osoite on kytketty
- Tämä on tärkeää päättääksesi, minne pakettia kuljetetaan

Esimerkiksi, jos verkkokortti MAC-osoitteella `00:1A:2B:3C:4D:EE` on
liitetty kytkinporttiin 3, niin:

```text
MAC Address          | Portti
---------------------|--------
00:1A:2B:3C:4D:EE    | Fa0/3
00:1A:2B:3C:4D:FF    | Fa0/14
01:00:5E:00:00:01    | (ryhmälähetykset kaikkiin)
```

### Kuinka MAC-osoitekirja täyttyy?

Kytkin oppii MAC-osoitteet **oppimalla läpikäynnin aikana**. Kun paketti saapuu
johonkin porttiin, kytkin tarkistaa lähettäjän MAC-osoitteen ja tallentaa sen
yhdessä siitä portin numeron kanssa. Tämä prosessi on:

```text
1. Laite lähettää paketin (lähettäjän MAC = 00:1A:2B:3C:4D:EE)
2. Paketti saapuu kytkinporttiin 3
3. Kytkin tallentaa: "00:1A:2B:3C:4D:EE on portissa 3"
4. Jos vastaanottaja on tunnettu → lähetä suoraan valitsemalleen portille
5. Jos vastaanottaja on tuntematon → lähetä kaikkiin paitsi lähettäjän portille
```

### Oppimisen poistumismäki (Aging)

MAC-osoitteet eivät ole ikuisia – ne poistuvat tietolistasta, jos niitä ei
ole kuultu aikakatkaisun ( *aging time* , yleensä 300 sekuntia). Tämä estää
vanhojen laitteiden muistamisen tarpeen, kun ne eivät enää ole verkossa.

!!! warning "Vanhentuneet osoitteet voivat aiheuttaa virheitä"

    Jos MAC-osoitekirja ei poista vanhoja tietoja, paketit saattavat lähettää
    vanoihin portteihin, missä laitetta ei ole. Tämä johtaa paketin menetykseen
    ( *black hole* ) – se saattaa kulkea varusteeseen, joka ei vastaa.

## Kuinka kytkin päättää pakettien kulkeneen

Prosessi on seuraava:

1. **Vastaanottajan MAC-osoite tarkistetaan**
2. **Jos se on MAC-osoitekirjassa:**
   - Lähetä paketti suoraan siihen porttiin, johon osoite liittyy
3. **Jos sitä ei ole tietolistassa:**
   - Lähetä paketti kaikkiin portteihin paitsi lähettäjän porttiin
     ( *unknown unicast flooding* )
4. **Lisäys oppimista varten onnistuneeseen lähettämään**

!!! info "Tuntematon unicast flooding"

    Kun kytkin ei tiedä, minne paketti kuljetettavaksi, se "paisuttaa" (
    *floods* ) sitä kaikkiin portteihin paitsi lähettäjän porttiin. Tämä on
    oikeellinen toiminta – se antaa vastaanottajalle mahdollisuuden vastata, jolloin
    kytkin oppii vastaanottajan MAC-osoitteen.

## Collistion Domainit (Collision Domains)

**Collistion Domainit** (*collision domains*) ovat verkkoyhteyksiä, joissa
paketit voivat tulla toistensa kanssa yhteyttä ( *collision* ). Ne ovat
keskeinen osa Ethernetin puolen vätimeen ( *half-duplex* ) toimintaa.

| Tilanne | Selitys |
| --- | --- |
| **Half-duplex** | Paketit voivat tulla toistensa kanssa yhteyttä – yhteys on jaettu |
| **Full-duplex** | Paketit eivät voi tulla toistensa kanssa yhteyttä – yhteys on täysin yksivälinen |

!!! info "Collistion Domainit ja kytkimet"

    Kytkimet ovat **collistion-rajautetut** (*collision-separating*): jokainen
    portti on oma collistion-ydmainsa. Tämä tarkoittaa, että kaksi laitetta, jotka
    ovat kytkettyä eri portteihin, eivät voi saada toistensa kanssa yhteyttä –
    kytkin varmistaa tämän.

## Kytkimen porttiyhteys

Kytkimen portit ovat yleensä:

- **Access-portti** – liitetty yhteen VLAN-verkkoon
- **Trunk-portti** – liitetty useisiin VLAN-verkkoihin (katso [Trunkking](trunking.md))

| Portin tyyppi | Selitys |
| --- | --- |
| Access | Vastaanottaa ja lähettää paketit yht bahosti VLAN-verkosta |
| Trunk | Vastaanottaa ja lähettää useita VLAN-paketteja tagattuina |
| Hybrid | Yhdistää access- ja trunk-ominaisuudet |

!!! tip "Käytännön neuvo: Porttityylin valinta"

    Valitse access-portti päätelaitteille, jotka eivät tarvitse VLAN-tunnistetta
    (esim. työasema), ja trunk-portti silloin, kun paketit kuljetetaan
    monen VLAN-verkon kautta (esim. toisen kytjimen tai reitittimen välillä).
