# DNS-kyselyn prosessi

**DNS-kysely** (DNS query) on prosessi, jossa verkkolaitteisto kysyy nimipalvelimilta, mitä IP-osoitetta tietty nimi vastaa. Tämä dokumentti perustuu **RFC 1034** ja **RFC 1035** -standardiin.

## Mitä tämä sivu käsittelee?

- **Iteratiivinen kysely** – kysely, jossa kysymys lähetetään erikseen jokaisen palvelimen kautta
- **Rekursiivinen kysely** – kysely, jossa palvelin tekee kyselyn puolestasi
- **DNS-kyselyn vaiheet** – miten kysely etenee

## Rekursiivinen vs Iteratiivinen kysely

| Ominaisuus | Rekursiivinen | Iteratiivinen |
|-----------|---------------|----------------|
| Veluu | Palvelin selaa koko ketjua | Asiakas kysyy jokaiselta |
| Tulos | Paluu lopputulos | Paluu seuraava askel |
| Resurssit | Palvelin tekee työn | Asiakkaan tehtävä |

### Esimerkkikyselyn erot

```text
Rekursiivinen kysely (Client → Recursive Resolver → ... → Final Answer)

Iteratiivinen kysely (Client → Root → TLD → Authoritative → Client)
```

## Rekursiivinen kysely (Recursive Query)

### Kuinka se toimii?

1. **Client kysyy Recursive Resolveria** (esim. `8.8.8.8`) nimistä `www.example.com`
2. **Recursive Resolver etsii vastausta** iteratiivisesti
3. **Paluu vastaus clientille**

```text
Client                    Recursive Resolver           Root/TLD/Auth
   |  → www.example.com →         |                           |
   |                               |  → .com (Root) →           |
   |                               |     ← referral ←            |
   |                               |  → example.com (TLD) →      |
   |                               |     ← referral ←             |
   |                               |  → ns1.example.com (Auth) → |
   |                               |     ← 93.184.216.34 ←        |
   |  ← 93.184.216.34 ←            |
```

## Iteratiivinen kysely (Iterative Query)

Iteratiivisessa kyselyssä asiakas itsensä lähettää kyselyn jokaiselle palvelimelle:

```text
Client → Root → TLD → Authoritative → TLD → Client
```

Kukin palvelin palauttaa **viitteen** (referral) seuraavalle palvelimelle.

## Koko prosessi yksityksessä

Kysytään osoitetta `www.example.com` Recursive Resolverilla:

### Vaihe 1: Client → Recursive Resolver

```text
Client
   ↓ (UDP 53) www.example.com A
Recursive Resolver (8.8.8.8)
```

### Vaihe 2: Recursive Resolver → Root

```text
Recursive Resolver
   ↓ (iteratiivinen)
Root Server (.com.)
```

Root paluttaa viitteet TLD-palvelimelle (.com).

### Vaihe 3: Recursive Resolver → TLD

```text
Recursive Resolver
   ↓
.com TLD Server (esim. gtld-servers.net)
```

TLD paluttaa viitteet authoritative-palvelimelle (ns1.example.com).

### Vaihe 4: Recursive Resolver → Authoritative

```text
Recursive Resolver
   ↓
Authoritative Server (ns1.example.com)
```

Authoritative palauttaa vastauksen: `www.example.com → 93.184.216.34`.

### Vaihe 5: Paluu Clientille

```text
Recursive Resolver → Client
```

Recursive Resolver antaa tuloksen clientille ja tallentaa sen **cache**.

## DNS-vastauksen kentät

| Tyyppi | Selitys |
|-------|--------|
| **NOERROR** | Onnistui (ei virhettä) |
| **NXDOMAIN** | Näyte ei ole olemassa |
| **SERVFAIL** | Palvelinvirhe |
| **REFUSED** | Kysely hylätty |

## Cache (DNS Caching)

| Kerros | TTL | Selitys |
|--------|-----|---------|
| **Browser** | Selväikäinen | Lyhyin (muutama minuutti) |
| **OS** | Lyhyt | 30–300 sekuntia |
| **Resolver** | Pitkä | 86400 (1 päivä) |
| **Authoritative** | Pitkä | Määrätty TTL |

!!! tip "Puhdistus"

    Voit tyhjentää DNS-kevytin käskyllä `ipconfig /flushdns` (Windows) tai `sudo systemd-resolve --flush-caches` (Linux).

## Esimerkkikäsittely (dig)

```bash
dig www.example.com
```

```text
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 12345
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 2, ADDITIONAL: 0
```

| Tieto | Selitys |
|-------|---------|
| `qr` | Kysely vastattu |
| `rd` | Recursively pyydetty |
| `ra` | Recursively sallittu |

## DNS-kyselyn vaiheet yhteensä

1. Client kysyy Recursive Resolverista
2. Resolver tarkistaa kevytrakenteen
3. Jos ei löydy, alkaa iteratiivinen kysely
4. Resolver kysyy Root, sitten TLD, sitten Authoritative
5. Vastaus palattuun ja tallennetaan cacheen

## Seuraavaksi

Seuraavaksi tarkastellaan [rekisteröinti.md](rekisteröinti.md), jossa käsitellään DNS-rekisteröintiä, DNSSEC:ää ja miten verkot rekisteröidään.
