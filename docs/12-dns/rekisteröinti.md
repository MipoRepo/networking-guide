# DNS-rekisteröinti ja DNSSEC

Tämä sivu käsittelee **DNS-rekisteröintiä** (DNS registration) ja **DNSSEC:ää** (Domain Name System Security Extensions) – mekanismeja, jotka varmistavat verkon integritetin DNS-kyselyissä. Se perustuu **RFC 1035** (rekisteröinti), **RFC 4033/4034/4035** (DNSSEC) ja **RFC 5230** (SPF).

## Mitä tämä sivu käsittelee?

- **DNS-rekisteröinti** – miten domainit rekisteröidään ja omistetaan
- **DNSSEC** – miten varmistaa DNS:n eheys
- **Rekisteröitseminen ja päivittäminen** – miten domainit hallitaan

## DNS-rekisteröinti

Verkkotunnukset rekisteröidään **rekisteröijiltä** (registrarit). Kun rekisteröität verkon, se lisätään juurella olevaan tietokantaan.

### Rekisteröintiprosessi

1. **Valitse rekisteri** – esimerkiksi Namecheap, Gandi, Ficora
2. **Hae saatavuus** – tarkista onko domain vapaana
3. **Rekisteröi** – maksa ja omista domaini
4. **Aseta nimipalvelimet (nameservers)** – osoita authoritative-palvelimet

!!! info "TLD ja rekisteröinti"

    Rekisteröinti riippuu TLD:stä (esim. `.com`, `.fi`, `.net`). Jotkut TLD:t vaativat erityisehdot (esim. DNSSEC-tuki).

## Nimipalvelimet (Nameservers)

Nimipalvelimet kertovoivat, missä authoritative palvelimessa verkko on:

```text
Domain: example.com
Nameserver: ns1.example.com
             ns2.example.com
```

### Esimerkkikysely

Kysyttäessä nimipalvelimia:

```bash
dig NS example.com
```

```text
example.com. 86400 IN NS ns1.example.com.
example.com. 86400 IN NS ns2.example.com.
```

## DNSSEC (Domain Name System Security Extensions)

**DNSSEC** on mekanismi, joka varmistaa, että DNS-vastaukset ovat aidot (autenticit) eikä ne ole muutuneet matkalla. Se käyttää **allekirjoattuja tietueita** (RRSIG) ja **avaimia** (DNSKEY).

## Miten DNSSEC toimii?

```text
Client → Resolver → DNSKEY → RRSIG → Vastaus → Client
                   ↑          ↑
           Julkinen avain   Allekirjoitus
```

1. Resolver hakee DNSKEY (julkinen avain)
2. Vastaus allekirjoitataan (RRSIG)
3. Resolver tarkistaa allekirjoituksen DNSKEYllä
4. Jos tarkistus onnistui → vastaus on aito

## DNSSEC-varat (Resource Records)

| Tyyppi | Selitys |
|--------|---------|
| **DNSKEY** | Julkinen avain domainille |
| **RRSIG** | Allekirjoitettu tietue |
| **DS** | Delegation Signer – viittaa lapsiverkkoon |
| **NSEC/NSEC3** | Osoittaa, että tietty nimi ei ole olemassa |

### Esimerkkikysely

```bash
dig DNSKEY example.com
```

```text
example.com. 86400 IN DNSKEY 257 3 13 (AwEAAa...)
```

## DNSSEC:n hyödyt

| Hyöty | Selitys |
|------|--------|
| Estää spoofingit | Vastauksia ei voi helposti harhata |
| Estää cache-poistokset | Vanhentunut tieto ei kelpaa |
| Parantaa luottamusta | Varmistettu kysely |

## DNSSEC:n rajoitukset

| Rajoite | Selitys |
|--------|--------|
| **Suorituskyky** | DNSSEC-lisäykset lisäävät kyselyn kokoa |
| **Konfigurointi** | Tarvitsee erillistä konfigurointia |
| **Yhteensopivuus** | Vanhat palvelimet eivät ehkä tue |

## Rekisteröinnin osat

| Osa | Selitys |
|-----|--------|
| **Registrar** | Rekisteröi domainin (esim. Namecheap) |
| **Registry** | Pitää yllä rekisteriä (esim. Verisign .com:lle) |
| **Nameserver** | Paljastaa DNS-tiedot |
| **Registrant** | Domainin omistaja |

## Esimerkkirekisteröinti

```text
Domain: example.com
Registrar: Namecheap
Nameservers:
  ns1.example.com
  ns2.example.com
DNSSEC: Käytössä (KSK + ZSK)
```

## DNSSEC:n ottaminen käyttöön (BIND9-esimerkki)

```bash
# Luo DNSSEC-avaintiedot
dnssec-keygen -a RSASHA256 -b 2048 -n ZONE example.com

# Allekirjoita zone
dnssec-signzone -o example.com db.example.com
```

## DNSSEC ja IPv6

DNSSEC tukee myös IPv6:

| Tyyppi | Selitys |
|--------|---------|
| **AAAA** | IPv6-osoite |
| **A6** | Vanhentunut IPv6-muoto |

!!! info "DNSSEC ja CDN:t"

    DNSSEC voi aiheuttaa ongelmia CDN-ohjauksessa, koska CDN:t muuttavat IP-osoitteita dynaamisesti. Tämä voidaan kiertiä esimerkiksi **DNAME**- tai **CNAME**-tietueilla.

## Seuraavaksi

Seuraavaksi tarkastellaan [dns-konfigurointi.md](dns-konfigurointi.md), jossa nähdään konkreettisia esimerkkejä DNS-palvelimen konfiguroinnista BINDillä.
