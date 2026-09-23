# IPv6

**IPv6** (*Internet Protocol version 6*) on Internet-protokollan kuudes versio, joka on suunniteltu korvaamaan IPv4:n (RFC 791) 32-bittisistä osoitteista. IPv6 käyttää **128-bittisiä osoitteita**, joiden avulla on riittävästi osoitteita nykyään ja tulevaisuudessa käytettäväksi. Se on määritelty **IETF RFC 8200**:ssa (aiemmin RFC 2460).

IPv6 on kehittynyt useiden prosessien läpi:

1. **Alkuperäinen tavoite** – ratkaista IPv4-osoitteiden loppumisen ongelma
2. **Laajempi näkökulma** – parantaa skaalautuvuutta, suorituskykyä ja turvallisuutta
3. **Nykyinen standardi** – IPv6 on laajalti käytössä internetissä

## Mitä tämä osio käsittelee?

| Sivu | Aihe | Keskeinen kysymys |
|------|------|-------------------|
| IPv6-osoitteet | 128-bittiset osoitteet | Miten osoitteet rakentuvat? |
| Osoitteistus | CIDR ja prefixit | Miten verkot jaetaan aliverkkoihin? |
| Dual-stack | IPv4 ja IPv6 rinnalla | Miten siirtyminen toteutetaan käytännössä? |
| OSPFv3 | IPv6-dynaaminen reititys | Miten OSPFv3 reititsee IPv6-verkossa? |

## Miksi IPv6 on syntynyt?

### IPv4:n rajoitukset (RFC 791)

| Rajoite | Selitys |
|---------|---------|
| **Osoitteet 32 bitiä** | ~4,3 miljantia osoitetta |
| **Käytetty lähes kaikki** | Nykypäivänä noin 93 % osoitteista on käytössä |
| **NAT pakollinen** | Yksityiset verkot vaativat NAT-ongelman (katso [09-ipv4-nat](../09-ipv4-nat/nat-perusteet.md)) |

### IPv6:n etuhedot

| Etu | Selitys |
|-----|---------|
| **Luku merta osoitteita** | 2¹²⁸ mahdollista osoitetta (noin 3,4 × 10³⁸) |
| **Ei tarvetta NATille** | Jokainen laite saa oman julkisen osoitteen |
| **Parempi reititys** | Prefix-pohjainen reititys |
| **Integroitu turvallisuus** | IPsec tukea (RFC 8200) |

## IPv6-osoitteen rakenne (RFC 4291)

IPv6-osoite on 128 bittiä (16 tavua), joka esitetään 8-okseleenä, jotka erotellaan toisistaan:

```text
2001:0db8:85a3:0000:0000:8a2e:0370:7334
```

### Lyhytmuoto (RFC 5952)

- **Erottele se kahdeksaan okseen** kaksoispisteillä
- **Katkaise nollat** oktetista (mutta vähintään yksi nollamerkki)
- **Käytä piena kirjainta** (a–f)
- **Voit kokonaan supistaa yhden nollan okseetta** (`0000` → `0`)

Esimerkkiverkko:

```text
2001:0db8:85a3:0000:0000:8a2e:0370:7334
```

Lyhyenä:

```text
2001:db8:85a3::8a2e:370:7334
```

!!! info "Osoitteiston supistukset"

    `2001:0db8::8a2e:0370:7334` on sallittu, mutta suositus on supistaa jokainen oktti mahdollisimman pitkälle: `2001:db8::8a2e:370:7334`.

## IPv6-osoitetyypit

| Tyyppi | Muoto | Selitys |
|--------|-------|---------|
| **Global unicast** | `2000::/3` | Julkinen osoite – reitittävä internetissä |
| **Link-local** | `fe80::/10` | Paikallinen verkkolinkki – käytetään ARP-vastaan olevan Neighbor Discovery:n kanssa |
| **Unique local** | `fc00::/7` | Yksityinen osoite – vastaamaan IPv4:n `192.168.x.x` |
| **Multicast** | `ff00::/8` | Monenkäyttäjäinen – vastaamaan IPv4:n broadcasteja |
| **Loopback** | `::1/128` | Itse viittaus – vastaamaan IPv4:n `127.0.0.1` |

## IPv6 ja verkkokerros

IPv6 toimii **Layer 3** -tasolla (verkkokerros) samoin kuin IPv4. Se on yhteydessä suoraan:

| Protokuoli | Kuvaus | Lähde |
|------------|--------|-------|
| **ICMPv6** (RFC 4443) | Virheilmoitukset ja diagnosticointi – vastaa ICMP:itä IPv4:ssä | RFC 4443 |
| **Neighbor Discovery** (RFC 4861) | ARP-vastaava – löytää MAC-osoitteet | RFC 4861 |
| **Router Advertisement** | ILMOITUS REITITTIMISTA – reititin ilmoittaa itsensä | RFC 4861 |

!!! info "Neighbor Discovery (ND)"

    IPv6:n vastine ARP:lle on Neighbor Discovery Protocol (NDP). Se käyttää ICMPv6-viestejä (`Router Solicitation`, `Router Advertisement`, `Neighbor Solicitation`, `Neighbor Advertisement`) sen sijaan, että käyttäisi erillistä ARP-kyselyä. Tämä tekee IPv6:sta **stateful**- ja **stateless**-osoitteistuksia tukevampi protokolla.

## IPv6:n osoitteistus (SLAAC)

IPv6:ssa osoitteiden osoittaminen tapahtuu yleensä kahdella tavalla:

1. **SLAAC** (*Stateless Address Autoconfiguration*, RFC 4862) – reititin antaa verkoston, laite muodostaa osoitteensa itsenäisesti
2. **DHCPv6** (RFC 3315) – keskitetty osoitteistus

## Dual-stack

Siirtymisessä IPv4:stä IPv6:een usein käytetään **dual-stackia** – jolloin laite tukee molempia samanaikaisesti. Tämä on turvallinen siirtomuoto, koska se ei rikkaa yhteensopivuutta vanhempien laitteiden kanssa.

## Seuraavaksi

Seuraavaksi tarkastellaan [IPv6-osoitteet](ipv6-osoitteet.md), jossa käsitellään 128-bittisen osoitteen rakennetta, oktettien muotoa ja erilaisia osoitetyyppejä.
