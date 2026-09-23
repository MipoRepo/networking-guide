# DNS-perusteet

**DNS** (Domain Name System) on verkko, joka kääntää nimiä (esim. `example.com`) IP-osoitteisiin (esim. `93.184.216.34`). Se toimii kuin Internetin "kirjakauppa" – kun kysytetään kirjaimellisella nimellä, saadaan takaisin numero (IP-osoite).

## Mitä tämä sivu käsittlee?

- **Resurssitietueet** – A, AAAA, MX, CNAME, NS, SOA
- **Nimiavaruus** (domain name) – miten nimet muodostuvat
- **DNS-puu** (DNS hierarchy) – miten puu toimii

## Domain Name System

Domain Name System on hierarkkinen järjestelmä:

```text
Root (.)
    |
  com
    |
example.com
    |
www.example.com
```

### Domain Name -rakennetus

Verkon nimi koostuu eri osista, jotka ovat eroteltu pisteillä (labelit):

| Osa | Selitys |
|-----|---------|
| `www` | Alinimi (hostname) |
| `example` | Aliverkko- tai omistajanimi |
| `com` | TLD (Top-Level Domain) |
| *(tyhjä)* | Root (piste lopussa) |

## Resurssitietueet (Resource Records)

DNS-palvelimet pitävät **resurssitietueet** (RR, Resource Records), jotka kuvaavat erilaisia tietoja:

| Tyyppi | Selitys | Esimerkki |
|--------|---------|-----------|
| **A** | IPv4-osoite | `example.com → 93.184.216.34` |
| **AAAA** | IPv6-osoite | `example.com → 2606:2803:230:0:0:0:0:1` |
| **MX** | Sähköpostipalvelin | `example.com → mail.example.com` |
| **CNAME** | Canoli nimike | `www.com → example.com` |
| **NS** | Nimipalvelin | `example.com → ns1.example.com` |
| **SOA** | Start of Authority | Informaatio domainista |
| **PTR** | Käänteinen haku (reverse DNS) | `93.184.216.34 → example.com` |

### Esimerkkikysely

Kysytään A- tietue:

```bash
dig A example.com
```

```text
;; ANSWER SECTION:
example.com. 300 IN A 93.184.216.34
```

| Kenttä | Selitys |
|--------|---------|
| `example.com.` | Kysytty nimi |
| `300` | TTL (aika eloon) |
| `IN` | Internet (luokka) |
| `A` | Tyyppi |
| `93.184.216.34` | Arvo |

## TTL (Time To Live)

TTL on aika, jonka DNS-kirja saa olla voimassa ennen kuin sen tulee päivittyä:

| TTL | Selitys |
|-----|---------|
| Korkea (86400) | Vähän päivityksiä |
| Matalan (300) | Usein päivityksiä |

!!! info "TTL:n valinta"

    Korkea TTL:llä DNS-kyselyt ovat nopeampia, mutta muutokset (esim. IP-osoitteen vaihtaminen) eivät ole heti näkyvissä.

## DNS-puu (Hierarchy)

DNS-puu on 13 päällä solmussa (kutsutaan juuria):

```text
13 juurta
    ↓
Root Servers
    ↓
TLD Serverit (.com, .net, .fi, yms.)
    ↓
Authoritative Serverit (esim. ns1.example.com)
```

### Juuret

| Nimi | IP (esim.) |
|------|------------|
| a.root-servers.net | 198.41.0.4 |
| b.root-servers.net | 199.9.14.201 |
| ... | ... |
| m.root-servers.net | 202.12.27.33 |

## SOA-tietue (Start of Authority)

SOA-tietue kuvaa domainin hallintaa:

```text
@ IN SOA ns1.example.com. admin.example.com. (
    2024092201 ; Serial
    3600       ; Refresh
    1800       ; Retry
    604800     ; Expire
    86400 )    ; Minimum TTL
```

| Kenttä | Selitys |
|--------|--------|
| **MNAME** | Primäärinimipalvelin |
| **RNAME** | Ylläpidon sähköpostiosoite |
| **Serial** | Versio |
| **Refresh** | Milloin tarkistaa |
| **Retry** | Virheen jälkeen odotus |
| **Expire** | Kun vanhenee |
| **Minimum TTL** | Oletus-TTL |

## Esimerkkikäsittely

Kysytään `www.example.com`:

1. Kysytään A-tietuetta
2. Selvä palvelin kysyy juuresta
3. Juuri ohjaa TLD-palvelimelle (.com)
4. TLD ohjaa domainin palvelimelle
5. Domain palvelin vastaa `www.example.com → 93.184.216.34`

## DNS-protokollan kääntöjärjestä

DNS käyttää **UDP:itä** porttiin 53. Jos vastaus on liian suuri, siirrytään **TCP:ään**.

| Protokolla | Portti | Käytetty | Esimerkki |
|-----------|--------|----------|-----------|
| UDP | 53 | Yleinen kysely | A-tietue |
| TCP | 53 | Suuret vastaukset | Zonatransferi |

## DNS:n rajoitukset

| Rajoite | Selitys |
|---------|--------|
| Cache | Vanhentunut tieto voi pysyä muistissa |
| DNSSEC puute | Ilman DNSSEC:tä DNS voi antaa harhaiset tiedot |
| DDoS | Juurpalvelimet ovat usein kohde |

## Seuraavaksi

Seuraavaksi tarkastellaan [kaynnistus.md](kaynnistus.md), jossa käsitellään DNS-kyselyn eteneminen iteratiivisesti ja rekursiivisesti.
