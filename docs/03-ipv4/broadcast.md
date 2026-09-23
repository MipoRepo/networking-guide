# Broadcast (yleinen lähetys)

**Broadcast** (yleinen lähetys) on mekanismi, jolla pakettia lähetetään kaikille samassa verkossa tai aliverkossa oleville laitteille yhtä aikaa. Se perustuu **IPv4-osoitteen erityiskäyttöön** – osoitteeseen, jossa kaikki käyttäjäbitit ovat 1.

## Mikä broadcast-osoite on?

Broadcast-osoite on verkon viimeinen osoite. Esimerkiksi verkossa `192.168.1.0/24`:

- **Verkko-osoite**: `192.168.1.0`
- **Broadcast-osoite**: `192.168.1.255`
- **Käyttäjäalue**: `192.168.1.1 – 192.168.1.254`

Binäärimuodossa broadcast on kaikki 1:

```text
11111111.11111111.11111111.11111111   =  255.255.255.255
```

## Kaksi tyyppiä broadcasteja

| Tyyppi | Osoite | Selitys |
|--------|--------|---------|
| **Limited broadcast** | `255.255.255.255` | Lähetetään "kaikeen" – ei tule koskaan reititetä. Käytetään esimerkiksi DHCP:ssa ennen osoitteen saamista. |
| **Directed broadcast** | `x.x.x.255` (verkko + maski) | Lähetetään tiettyyn aliverkkoon. Esim. `192.168.1.255`. Voi kantaa reititystä. |

## Miksi broadcast on tarpeen?

Broadcast mahdollistaa kommunikaation tilanteen, jossa vastine osoitetta ei vielä ole:

| Käyttö | Selitys |
|--------|---------|
| **ARP** | Kysytään: "Kuka on 192.168.1.100?" – vastaa vain kyseinen laite |
| **DHCP** | Uhattu asiakas lähettää `255.255.255.255`:ään – palvelin vastaa |
| **DHCPDISCOVER** | Ensimmäinen vaihe DHCP-prosessissa |

## Broadcast ja subnet-maski

Subnet-maski määrittelee, mikä osa verkosta on "verkon" osa – ja siten mikä broadcast-osoite syntyy.

| Verkko | Maski | CIDR | Broadcast |
|--------|-------|------|-----------|
| 192.168.1.0 | 255.255.255.0 | /24 | 192.168.1.255 |
| 192.168.1.0 | 255.255.255.128 | /25 | 192.168.1.127 |
| 10.0.0.0 | 255.255.0.0 | /16 | 10.0.255.255 |

## Broadcastin rajoitteet ja turvallisuus

Broadcast voi aiheuttaa **verkkotason ongelmat**:

- **Broadcast-stm**: Liian monta broadcast-viestiä voi kaikkiin vieä kaikki sijoittuvat resurssit.
| **Suojaus**: Verkot jaetaan aliverkkoihin pienempään – näin joka broadcast koskee vain oman aliverkon laitteita.
| **Suojaus**: PIM ja IGMP-käännös estää lähetyspyynteiden leviämisen.

!!! warning "Turvallinen verkkorakenne"

    Directed broadcastit voidaan **estää reitittimissä** asetuksella `no ip directed-broadcast`. Tämä torjuu "smurf-asteita" – hyökkäyksen, jossa broadcast käytetään DoS-iskun avulla.

## Broadcast vs. Multicast

| Ominaisuus | Broadcast | Multicast |
|------------|-----------|-----------|
| Käsittely | Kaikki laitteet | Vastaanottavat ryhmän jäsenet |
| Osoite | .255 (IPv4) | 224.0.0.0 – 239.255.255.255 |
| Liikenneryhmä | Verkkokaavio | Protokolla (esim. IGMP) |

## Seuraavaksi

Kun olet ymmärtänyt broadcastin toiminnan, olet valmis siirtymään [04-dhcp-routing](../04-dhcp-routing/index.md)-osioon, jossa DNS-kyselyt ja DHCP-prosessi käsitellään yksityiskohtaisemmin.
