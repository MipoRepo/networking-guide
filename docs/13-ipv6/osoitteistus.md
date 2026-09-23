# IPv6-osoitteistus

**Osoitteistus** (*prefix delegation*) on prosessi, jossa reititin antaa aliverkon osoitteistuksen (prefixin) aliverkkoihin. IPv6:ssa tämä perustuu **RFC 3315** (DHCPv6 Prefix Delegation) ja **RFC 3637** (DHCPv6 PD).

## Miksi osoitteistus on tärkeä?

IPv6 antaa jokaiselle verkolle 64-bittisen prefixin, jonka avulla voidaan muodostaa 2⁶⁴ osoitetta. Tämä on riittävästi, mutta voidaan jakaa useampiin aliverkkoihin.

| Tilanne | Prefix | Mahdollisia osoitteita |
|---------|--------|----------------------|
| Yksi verkko | `2001:db8::/64` | 2⁶⁴ (18 exa-osoitetta) |
| Jaettu 256 verkkoon | `2001:db8::/72` | 2⁵⁶ per verkko |
| Jaettu 65536 verkkoon | `2001:db8::/80` | 2⁴⁸ per verkko |

!!! info "SLAAC vs DHCPv6"

    IPv6:ssa osoitteistus tapahtuu yleensä joko:
    - **SLAAC** (Stateless Address Autoconfiguration, RFC 4862) – reititin antaa prefixin, ja laite muodostaa osoitteensa itsenäisesti
    - **DHCPv6 PD** (RFC 3315) – reititin saa prefixin operaattorilta ja jakaa sitä aliverkkoihin

## CIDR ja prefixit (RFC 4291)

IPv6-osoitteet jaetaan **CIDR-prefixin** perusteella samoin kuin IPv4:ssä. Prefix kertoo, kuinka monta bits on yhteisiä kaikissa osoitteissa samassa verkossa.

| Prefix | Selitys | Esimerkkiverkko |
|--------|---------|-----------------|
| `/32` | 32 bittiä yhtenäisyys | `2001:db8::/32` (~4,3 miljardia aliverkkoa /64)na) |
| `/48` | 48 bittiä yhtenäisyys | `2001:db8::/48` (~65 536 aliverkkoa) |
| `/56` | 56 bittiä yhtenäisyys | `2001:db8::/56` (~256 aliverkkoa) |
| `/64` | 64 bittiä yhtenäisyys | `2001:db8::/64` (vakiintunuosa osoitteistukselle) |
| `/128` | Yksittäinen osoite | `2001:db8::1/128` |

### Miksi /64 on vakio?

IPv6:ssa **64-bittinen prefix** on lähes aina pakollinen, koska:

1. **SLAAC vaatii sen** – Interface ID on aina 64 bittiä
2. **Neighbor Discovery** perustuu siihen
3. **Security** – lyhyemmät prefixit voivat aiheuttaa tarpeoitumistunutta (collision-free) -ongelmia

## Subnetointi (VLSM -style)

IPv6:ssa subnetointi on sautta ennen kuin se jaetaan. Esimerkiksi `2001:db8::/48` voidaan jakaa seuraavasti:

```text
2001:db8::/48 (perusprefix)
├── 2001:db8:1::/64 (verkko 1)
├── 2001:db8:2::/64 (verkko 2)
├── 2001:db8:3::/64 (verkko 3)
└── 2001:db8:4::/64 (verkko 4)
```

| Verkko | Subnet | Käyttö | Mahdolliset osoitteet |
|--------|--------|--------|----------------------|
| `2001:db8:1::/64` | 1 | Sisäverkko | 2⁶⁴ |
| `2001:db8:2::/64` | 2 | Ulkiverkko | 2⁶⁴ |
| `2001:db8:3::/64` | 3 | Palvelinverkko | 2⁶⁴ |
| `2001:db8:4::/64` | 4 | Hallinnointiverkko | 2⁶⁴ |

### Prefix Delegation (PD)

Kun operaattori antaa yhteyten, se antaa **PD:n** (Prefix Delegation), joka voi olla esimerkiksi `/56`. Reititin jakaa tämän sitten /64-osoitteiksi:

```text
Operaattori antaa: 2001:db8:abcd::/56
Reititin jakaa:
├── 2001:db8:abcd:1::/64 (lähiverkko)
├── 2001:db8:abcd:2::/64 (palvelinverkko)
└── 2001:db8:abcd:3::/64 (IoT-verkko)
```

## Longest Prefix Match (LPM)

IPv6:ssa reititys perustuu **Longest Prefix Match** -periaatteeseen (LPM), joka on samanlainen kuin IPv4:ssä. Tämä tarkoittaa, että paketit lähetetään pidemmän yhtenäisyyden perusteesta:

```text
Taulu:
::/0           → oletusreitti (kaikki)
2001:db8::/32  → yritysverkko
2001:db8:1::/64 → tarkempi aliverkko

Kysymys: mihin 2001:db8:1::100 lähetetään?
Vastaus: 2001:db8:1::/64 (pidinmä tuki)
```

| Osoite | Reitti | Selitys |
|--------|--------|---------|
| `2001:db8:1::100` | `2001:db8:1::/64` | Täsmällinen osoite |
| `2001:db8:2::100` | `2001:db8::/32` | Yritysverkko |
| `2001:db9::100` | `::/0` | Oletusreitti |

## Esimerkkiosoitteet (test-verkot)

| Osoite | Selitys | Lähde |
|--------|---------|-------|
| `2001:db8::/32` | Dokumentaatioversiot | RFC 3849 |
| `2001:10::/28` | Tutkimus- ja testiverkot | RFC 5156 |
| `2001:20::/28` | BMWG -testiverkoissa | RFC 5156 |

## Seuraavaksi

Seuraavaksi tarkastellaan [dual-stack.md](dual-stack.md), jossa käsitellään IPv4:n ja IPv6:n rinnakkaista käyttöä (dual-stack), migroi strategioita ja niiden vaikutusta verkostoon.
