# IPv6-osoitteet

IPv6-osoite on **128 bittiä** (16 tavua) pitkä. Se on määritelty standardissa **RFC 4291** (*IPv6 Addressing Architecture*). Tämä sivu käsittelee osoitteiden rakennetta, erilaisia osoitetyyppejä ja niiden käyttöä.

## Osoitteen muoto (RFC 4291)

IPv6-osoite koostuu **8 oktetista**, jotka ovat 16-liukuisia lukuja. Ne esitetään heksadesimaalimuodossa ja erotellaan toisistaan kaksoispisteillä:

```text
2001:0db8:85a3:0000:0000:8a2e:0370:7334
```

| Nro | Okta | Selitys |
|-----|------|---------|
| 1 | 2001 | Global unicast -prefix |
| 2 | 0db8 | Prefix-reittämöön |
| 3 | 85a3 | Prefix-reittämöön |
| 4 | 0000 | Reittämö (subnet) |
| 5 | 0000 | Reittämö (subnet) |
| 6 | 8a2e | Interface-osoite |
| 7 | 0370 | Interface-osoite |
| 8 | 7334 | Interface-osoite |

### Lyhytmuoto (RFC 5952)

IPv6-osoitteita voidaan lyhentää kahteella tavalla:

1. **Kukin okta superetaan yhtä merkin (`0`) alkaen** – esim. `0db8` → `db8`
2. **Peräkkäiset nollakohteet superetaan** (`0000:0000:0000:0000` → `::`) – mutta vain **yksi kerta** osoitteessa

| Alkuperäinen osoite | Lyhyt muoto |
|---------------------|-------------|
| `2001:0db8:85a3:0000:0000:8a2e:0370:7334` | `2001:db8:85a3::8a2e:370:7334` |
| `fe80:0000:0000:0000:0000:0000:0000:0001` | `fe80::1` |
| `0000:0000:0000:0000:0000:0000:0000:0000` | `::` (loopback) |

!!! warning "Kaksinkertainen supistus"

    `2001:0db8:0000:0000:0000:0000:0000:0001` voidaan supistaa `2001:db8::1`,
    mutta **ei** `2001:db8:0:0:0:0:0:0:1` – kukin okta saa vain yhden supistuksen.

### Esimerkkiosoitteet

| Osoite | Selitys |
|--------|---------|
| `::` | Epätty (ei osoitetta) |
| `::1/128` | Loopback (IPv6 vastaava `127.0.0.1`) |
| `fe80::1` | Link-local osoite |
| `2001:db8::1` | Globaali unicast-osoite (dokumentaatio) |
| `fc00::1` | Unique local address (ULA) |

## Osoitetyypit (RFC 4291)

IPv6:ssa osoitteet jaetaan viiteen päätyyppiin, jotka määräytyvät osoitteen alussa olevan ** prefixin** perusteella.

### Global Unicast (2000::/3)

**Global unicast** -osoitteet ovat julkisia osoitteita, jotka ovat reitittävissä internetissä. Ne alkavat `2000::`- tai `3000::`-alueelta.

```text
2001:0db8:85a3::8a2e:370:7334
```

Tämä on dokumentaatio-osoite (RFC 3849 määrittelee `2001:db8::/32`- alueen dokumentaatiota varten).

| Alue | Prefix | Käyttö |
|------|--------|--------|
| `2000::/16` | 2000:0000 - 2000:ffff | IANA:n myottamat blokit |
| `2300::/16` | 2300:0000 - 2300:ffff | IETF:n testaukseen |
| `2600::/16` | 2600:0000 - 2600:ffff | T-Mobile US |
| `2a00::/16` | 2a00:0000 - 2a00:ffff | Euroopan operaattorit |

### Link-Local (fe80::/10)

**Link-local** -osoitteet ovat osoitteita, jotka ovat käytössä vain paikallisessa verkkoyhteydessä. Ne alkavat `fe80::`– tai `febf::`-alueelta.

```text
fe80::1ff:fe23:4567:890a
```

Link-local osoitteita käytetään:

- **Neighbor Discoveryssä** (ARP-vastaavana)
- **Reitinten välisessä viestinnässä**
- **Verkonanalyysissä**, kun ei ole global unicast -osoitetta

Link-local-osoitteen muodostus perustuu **Modified EUI-64**-muotoon (RFC 4291):

| Langite | Selitys |
|---------|---------|
| `fe80::` | Link-local prefix |
| `0370:7334` | Interface ID (EUI-64 tai satunnainen) |

### Unique Local (fc00::/7)

**Unique local addresses (ULA)** ovat yksityisiä osoitteita, jotka eivät ole reitittävissä internetissä. Ne ovat IPv4:n private-verkojen (192.168.x.x) vastaava.

| Alue | Selitys |
|------|---------|
| `fc00::/8` | Keskusvaraatut (ULA) |
| `fd00::/8` | Satunnaisesti generoidut ULA-osoitteet |

ULA-osoitteen muodostus (RFC 4193):

```text
fd[48-bittinen satunnainen etuliite]:[sub-verkko]:[osoite]
```

Esimerkiksi: `fd12:3456:789a:1::1`

### Multicast (ff00::/8)

**Multicast** -osoitteet ovat ryhmiin liittyvät osoitteet. Ne ovat IPv4:n broadcastin (joka lähettää kaikkiin) vastaava, mutta tarkempi ryhmäkäsittelyä tukevä versio.

IPv6:ssa ei ole broadcast-toimintoa — kaikki “monenko kohdistaminen” tapahtuu multicastin kautta.

| Osoite | Selitys |
|--------|---------|
| `ff02::1` | Kaikki solmut samassa verkossa |
| `ff02::2` | Kaikki reitittimet samassa verkossa |
| `ff02::1:ff00:0000` | Neighbor Solicitation -ryhmä |

### Anycast (RFC 3333)

**Anycast** -osoitteet ovat saman osoitteen kopioita useisiin eri solmukohtiin. Ne saavat paketit **läheimmästä** solmusta. Anycast ei ole erillinen osoitetyyppi, vaan **määrittelytyyppi**, joka voidaan yhdistää minkä tahansa unicast- tai link-local-osoitteen kanssa.

## Interface ID (Rajapintatunniste)

IPv6-osoitteen viimeiset **64 bittiä** muodostavat **Interface Identifier (IID)** – se on yksiläinen tunniste verkkoissa.

### Modified EUI-64 (RFC 4291)

MAC-osoitteesta voidaan muuttaa 64-bittinen IID seuraavasti:

1. Ota MAC-osoite: `00:1a:2b:3c:4d:5e`
2. Lisää `ff:fe` keskelle: `00:1a:2b:ff:fe:3c:4d:5e`
3. Käännä 7. bitti (Universal/Local –bitti): `02:1a:2b:ff:fe:3c:4d:5e`
4. Muotoa IPv6: `021a:2bff:fe3c:4d5e`

!!! info "Privacy Extensions (RFC 4941)"

    IPv6:ssa MAC-osoitteen käyttö IID-na paljastaa kiinnitettyä tietoa laitteesta. Tästä syystä **RFC 4941** määrittää **satunnaiset tai kiertyvät osoitteet**, jotka vaihtelevat ajan myötä. Tämä estää laitteen jälkiintämisen MAC-osoitteesta.

## Seuraavaksi

Seuraavaksi tarkastellaan [osoitteistusta](osoitteistus.md), jossa käsitellään IPv6-verkosten CIDR-osoitteistusta, prefixejä ja Longest Prefix Match -periaatetta.
