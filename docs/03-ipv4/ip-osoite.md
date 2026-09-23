# IPv4-osoite

IPv4-osoite on **32-bitainen lukuarvo**, joka tunnistaa verkossa olevan laitteen. Se on IANA:n (Internet Assigned Numbers Authority) ylläpitämän IPv4-osoitteavälin (IPv4 address space) aliluku. Tämä dokumentti perustuu **IETF RFC 791**.

## Mikä IPv4-osoite on?

IPv4-osoite on 32-bittinen luku, joka esitetään neljänä desimaalilukuna erotettuna pisteillä:

```text
0.0.0.0 – 255.255.255.255
```

Jokainen luku (oketti) voi olla arvossa 0–255. Osoitteen binäärimuoto on esimerkiksi:

```text
11000000 10101000 00000001 00000001   =  192.168.1.1
```

## IPv4-osoitteiden muodot

IPv4-osoitteet annetaan kolmessa muodossa:

| Muoto | Esimerkki | Käyttö |
|-------|-----------|--------|
| Desimaalimuoto | `192.168.1.1` | Ihmisten luettava muoto |
| Binärimuoto | `11000000.10101000.00000001.00000001` | Tekniset laskelmat (verkko- ja käyttäjäosat) |
| Hexadeimaalimuoto | `0xC0A80101` | Verkonnassa; esimerkiksi ohjelmoinnissa |

## Osoitteiden luokittelu (Historical Classful)

Historiallisesti IPv4-osoitteet jaettiin luokkiin A–E. Tämä luokittelu **on deprekatoitu**, mutta se on tärkeä konteksti vanhemmille järjestelmille.

| Luokka | Binäärimuoto | Alue | Verkot | Käyttö |
|--------|--------------|------|--------|--------|
| A | 0xxxxxx.xxxxxxxx.xxxxxxxx.xxxxxxxx | 1.0.0.0 – 127.255.255.255 | 128 | Suuret organisaatiot |
| B | 10xxxxxx.xxxxxxxx.xxxxxxxx.xxxxxxxx | 128.0.0.0 – 191.255.255.255 | 16384 | Keskisuuret verkot |
| C | 110xxxxx.xxxxxxxx.xxxxxxxx.xxxxxxxx | 192.0.0.0 – 223.255.255.255 | 2097152 | Pienet verkot |
| D | 1110xxxx.xxxxxxxx.xxxxxxxx.xxxxxxxx | 224.0.0.0 – 239.255.255.255 | – | Multicast |
| E | 1111xxxx.xxxxxxxx.xxxxxxxx.xxxxxxxx | 240.0.0.0 – 255.255.255.255 | – | Eksplikaatio (ei käytetty) |

!!! info "Esimerkki: Luokan tarkistus"

    Osoite `192.168.1.1` alkaa binäärimuodossa `110...` → se on **luokka C**.
    Osoite `10.0.0.1` alkaa `00001010...` → se on **luokka A**.

    Nykyään kuitenkin käytetään **CIDR-merkintöjä** (esim. `10.0.0.0/8`), jotta ei ole riippuvainen luokittelusta.

## Erityisosoitteet

Joissain tilanteissa tiettyjä osoitteita käytetään erityismerkityksellä:

| Osoite | Merkitys |
|--------|----------|
| `0.0.0.0` | "Tuntematon" – ei voida määrittää tarkkaa osoitetta |
| `127.0.0.1` | Loopback – viittaa itse lähettavaan laitteeseen |
| `169.254.0.0/16` | Link-local – automaattinen osoitteiden valinta (APIPA) |
| `192.168.0.0/16`, `172.16.0.0/12`, `10.0.0.0/8` | Private – sisäiset verkot (katso [aliverkot.md](aliverkot.md)) |

## Kuinka IP-osoite liittyy?

| Dokumentti | Liitos |
|-----------|--------|
| [arp.md](arp.md) | Kääntää IP → MAC-osoitteeksi lähiverkossa |
| [subnetointi.md](subnetointi.md) | Jakaa osoitteavälin aliverkkoihin |
| [broadcast.md](broadcast.md) | Lähetys kaikille samassa aliverkossa |

## Lähde

- **RFC 791** – Internet Protocol (1981) – määrittelee 32-bittisestä osoitteesta
- **RFC 1918** – Address Allocation for Private Networks – määrittelee private-alueet (`10/8`, `172.16/12`, `192.168/16`)
- **RFC 3979** – Multicast osoitteet (luokka D)
