# Aliverkot (Subnet)

**Aliverkko** (subnet) on suuremman verkon osa, joka on jaettu pienempiin loogisiin osiin. Tämä prosessi – **subnetointi** – mahdollistaa tehokkaan osoitteistuksen, liikenteen erottamisen ja turvallisuuden.

## Miksi aliverkot ovat tarpeen?

Kun jokainen laitteistollamme osoitteistus on yksi suuri verkko (esim. `10.0.0.0/8`), kaikki laitteet kuuluvat samaan lähetyskasvaton aliverkkoon. Tämä aiheuttaa ongelmia:

| Ongelma | Selitys |
|---------|---------|
| Liiallinen lähetyspiiri | Jokainen pakett lähetetään kaikille tuhansille laitteille |
| Taulun koko | Reititystaulu on valtava |
| Turvallisuus | Kaikki voivat nähdä kaikki |
| IP-osoitteiden vuoto | Helppo käyttää liikaa osoitteita |

Aliverkot **rajautavat lähetyksen** samaan aliverkkoon kuuluviin laitoksiin. Esimerkiksi `192.168.1.0/24` lähettää pääosin vain kyseiseen verkkoon.

## Miksi aliverkot toimivat?

Kun verkko jaetaan aliverkkoihin, jokainen aliverkko saa oman osoitevälintensä. Tämä tarkoittaa:

1. **Verkonumero** – 1. ositettu aliverkon yleisesti tiedossa osoite
2. **Subnet-maska** – 32-bittinen luku, joka erottaa verkon käyttäjän osaston
3. **Käyttäjäosio** – jokaiselle laitteelle yksiläinen osoite

Esimerkiksi:

```text
Osoite: 192.168.1.10
Maski:  255.255.255.0
Verkko: 192.168.1.0/24
```

Tässä 24 bittiä verkosta ja 8 bittiä käyttäjälle. Tämä tarkoittaa 256 osoitetta, joista 254 käytettävissä.

## Classless Inter-Domain Routing (CIDR)

CIDR on IANA:n ja IETF:n ylläpitämä standardi (RFC 4632), joka korvasi luokittelun. Se käyttää merkintää `/N`, jossa N on verkon (verkko-)bittien määrä.

| Merkintä | Maski | Käyttäjäosoitteita | Käyttötarkoitus |
|----------|-------|---------------------|------------------|
| `/8` | 255.0.0.0 | 16 777 214 | Isot organisaatiot |
| `/16` | 255.255.0.0 | 65 534 | Keskisuuret verkot |
| `/24` | 255.255.255.0 | 254 | Pienet verkot |
| `/30` | 255.255.255.252 | 2 | Piste-seuraavat yhteydet |
| `/32` | 255.255.255.254 | 0 | Yksittäinen isäntä |

!!! example "Esimerkki: /24 vs /30"

    `/24`-verkassa on 256 osoitetta. Jos organisaatiolla on vain 2 laitetta, tämä on lähes koko varauksoton – sekä turhaa tilaa kuin myös turvinä.

    `/30`-verkossa riittää 2:lle laitteille (esim. reititimen ja palomuirin välinen yhteys). Tämä on tarkka osoitteistus.

## Private-verkot (RFC 1918)

IETF määrittelee kolme private-verkkoaluetta, jotka eivät ole internetissä reitittävissä (ne vaativat NATin – ks. [09-nat/index.md](../09-nat/index.md)):

| Aliverkko | Maski | Käyttö |
|-----------|-------|--------|
| `10.0.0.0/8` | 255.0.0.0 | Yksinkertainen suurin private-verkko |
| `172.16.0.0/12` | 255.240.0.0 | Keskisuuret private-verkot |
| `192.168.0.0/16` | 255.255.0.0 | Kotiverkot |

## Aliverkko ja broadcast

Jokaisessa aliverkossa on kaksi erikoista osoitetta:

| Osoite | Selitys |
|--------|----------|
| **Verkko-osoite** | 1. osoite – esim. `192.168.1.0` |
| **Broadcast-osoite** | Viimeinen osoite – esim. `192.168.1.255` |
| **Käyttäjäosoitteet** | Ne ovat kaikki muut – `192.168.1.1` – `192.168.1.254` |

Lisätietoja broadcast-toiminnasta on kyseessä [broadcast.md](broadcast.md).

## Seuraavaksi

Seuraavaksi tarkastellaan yksityiskohtaisemmin [subnetointi.md](subnetointi.md), jossa käsitellään CIDR-merkintöjä, VLSM:ää (Variable Length Subnet Mask) ja EUI-64:ta (IPv6-osoitteiden käyttöön).
