# Päätelaitteet (End Devices)

**Päätelaite** (end device) on laitteisto, joka liittyy suoraan verkkoon ilman väliketjua. Päätelaitteet ovat verkon käyttäjiä – ne lähettävät ja vastaanottavat paketteja, mutta eivät yleensä ole ne reitittimiä.

## Mitä tämä sivu käsittelee?

- **Päätelaitetyypit** – PC:t, läppärit, päätelaitteet
- **Verkkoissa ottaminen** – protokollat ja konfigurointi
- **Sijainti verkossa** – Layer 2 vs Layer 3

## Päätelaitetyypit

| Tyyppi | Selitys | Esimerkki |
|--------|---------|-----------|
| **Työasema** | Pöytäkirjoitin tai läppäri | Windows, Linux |
| **Tabletti** | Kosketusnäyttöinen laite | iPad, Android-tabletti |
| **Älypuhelin** | Matkapuhelin | iPhone, Android |
| **IoT-laite** | Verkkoistettu älylaite | Älykkäät säätimet, kameraat |

### Työasema (PC/läppäri)

Työasema on yleinen päätelaite, joka yhdistää verkkoon seuraavilla:

1. **Verkkokortti** (NIC) – fyysinen yhteys
2. **IP-osoite** – verkon osoite
3. **Oletusreitti** – kuinka päästä ulos verkosta

### Esimerkkikonfiguraatio (Linux)

```bash
# Näytä verkkokortit
ip addr show

# Lisää IP-osoite
ip addr add 192.168.1.100/24 dev eth0

# Lisää oletusreitti
ip route add default via 192.168.1.1
```

## Verkkoissa ottaminen (Network Onboarding)

Päätelaitteet ottavat automaattisesti verkkoon käyttäen:

1. **DHCP** – hakee IP-osoitteen (katso [04-dhcp-routing/index.md](../04-dhcp-routing/index.md))
2. **ARP** – hakee MAC-osoitteen (katso [03-ipv4/index.md](../03-ipv4/index.md))
3. **DNS** – kääntää nimet IP-osoitteiksi

## Päätelaitteiden ominaisuudet

| Ominaisuus | Selitys |
|------------|---------|
| **User Agent** | Selain, sovellus, mailasiakas |
| **Socket** | TCP-yhteys porttiin |
| **API** | Rajapinta palvelimiin (esim. REST API) |

## Esimerkkikäsittely

Tyypillinen päätelaitteen verkkoyhteys:

```text
1. DHCPDISCOVER → 255.255.255.255:67
2. DHCPOFFER ← 192.168.1.1:67
3. DHCPREQUEST → 192.168.1.100
4. DHCPACK ← 192.168.1.1
```

## IoT-laitteet

| Ominaisuus | Selitys |
|------------|---------|
| **Rajoitettu resurssi** | Vähän muistia/prosessoria |
| **Protokolla** | HTTP, MQTT, CoAP |
| **Turvallisuus** | Usein heikko (ei salaa) |

!!! warning "IoT-turvallisuus"

    Monet IoT-laitteet eivät tue salattuja yhteyksiä (TLS/SSL). Ne voivat olla altisia skannaukselle ja hyökkäyksille.

## Päätelaitteiden valinta verkkoon

| Tarve | Suositus |
|-------|----------|
| Työasema | LAN-yhteys (Ethernet + DHCP) |
| Mobiili | WLAN (WPA2/3 + DHCP) |
| IoT-laitteet | VLAN-rajattu verkko |

## Päätelaitteiden rajoitukset

| Rajoite | Selitys |
|---------|--------|
| Resurssit | Vähän prosessoria/muistoa |
| Salaus | Usein puuttuu TLS-tuki |
| Päivitys | Ei helppoa päivitettyä |

## Seuraavaksi

Seuraavaksi tarkastellaan [wlan-access-point.md](wlan-access-point.md), jossa käsitellään WLAN-access pointeja, SSID:itä, kanavia ja sihtautumista.
