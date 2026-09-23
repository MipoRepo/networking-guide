# Intrusiohawkistus (IDS/IPS)

**Intrusiohawkistus** (intrusion detection/prevention system, IDS/IPS) on järjestelmä, joka seuraa verkkoa mahdollisten turvallisuushyökkäysten tunnistamiseksi ja estomiseksi. Tämä dokumentti perustuu **RFC 2728** (intrusion detection), **RFC 4766** (network monitoring) ja **NIST SP 800-94** -standardiin.

## Mitä tämä sivu käsittelee?

- **IDS vs IPS** – tunnistus vs estäminen
- **Signature- ja anomaly-pohjaiset järjestelmät** – miten havaita hyökkäykset
- **Esimerkkikäsittelyt** – miten järjestelmä vastaa

## IDS vs IPS

| Ominaisuus | IDS (detection) | IPS (prevention) |
|------------|-----------------|------------------|
| Toiminta | Havaitsee ja ilmoittaa | Estää hyökkäykset |
| Sijainti | Passiivinen (seuranta) | Aktiivinen (katko) |
| Esto | Ei estä itse | Estää liikennettä |

### IDS – havaitsematon tarkkailu

IDS seuraa liikennettä ja varoittaa ylläpidosta:

1. **Paketit katskaillaan** (offline)
2. **Tunnistus periaatteet** (esim. tuntemattomat paketit)
3. **Ilmoitetaan ylläpidolle** (logi tai sähköposti)

### IPS – estävä toiminta

IPS toimii kuin "portti" – se voi katkaista epäilyttävät yhteydet:

1. **Paketit tarkistetaan reaaliaikaisesti**
2. **Estetään epäilyttävät yhteydet** (esim. tuntemattomat paketit)
3. **Sallitaan luotettu liikenne**

## Signature-pohjaiset järjestelmät

Signature-järjestelmä havaitsee tunnetun atakin perusteella. Esimerkiksi:

| Signature | Hyökkäys | Toimenpide |
|-----------|----------|------------|
| SYN-flood-ala | Portti-avoihin yhteystilanne | Rajoita yhteydet |
| SQL-injection | SQL-kyselyt URL-osoitteessa | Estää SQL-merkkijonot |
| XSS | `<script>`-tagit | Estää script-tagit |

### Esimerkki signaturesta

```yaml
signature:
  id: 100001
  name: "Possible SYN flood attack"
  rule: "tcp.flags.syn == 1 && tcp.flags.ack == 0 && rate > 100/s"
```

## Anomaly-pohjaiset järjestelmät

Anomaly-järjestelmä vertaillaan normaalia toimintaa. Se oppii verkon käyttäytymisen ja varoittaa poikkeamista:

| Menetelmä | Selitys |
|-----------|---------|
| **Käyttäytymusmallit** | Oppii verkon normaalitapa |
| **Käsitteet** | Vertaillaan tunnettuja käsitteitä |
| **Koneoppiminen** | Automaattinen mallinnus |

!!! info "Koneoppiminen IDSissä"

    Joissain IDS:ssä käytetään koneoppimista (machine learning), jolla järjestelmä oppii normaalikäyttäytymisen ennustamaan poikkeamia. Tämä vaatii säännöllisti päivitettyjä opetusmalleja.

## DPI (Deep Packet Inspection)

**DPI** tarkastelee paketin koko sisältöä, ei pelkästään päätettä:

1. **Päätteen tarkistus** (osoitteet, pörssit)
2. **Käsitteen tarkistus** (protokolla, operaatio)
3. **Sisällön tarkistus** (viesti, tiedot)

### Esimerkkikäsittely DPI:llä

```text
HTTP GET /admin.php?user=admin&pass=123
→ Tunnistaa "admin.php" → merkitsee riskiksi
→ Tunnistaa salasanat → merkitsee tietovuotoksi
```

## IPS:n estotavat

| Tapahtuma | Toimenpide |
|-----------|------------|
| Tuntematon portti | Estä pääsy |
| Portti-skannaus | Rajoita yhteydet |
| Anomalian havaitseminen | Kirjaa ja varoita |

## Esimerkkikonfiguraatio (Snort)

```bash
# Estä kaikki yhteydet, jotka ylittävät 100 yhteyttä minuutissa
drop tcp any any -> $HOME_NET any (msg:"Too many connections"; threshold: type threshold, track by_src, count 100, seconds 60; sid:100002;)
```

## IDS/IPS:n rajoitukset

| Rajoite | Selitys |
|---------|---------|
| **Signature-riippuvuus** | Tuntemattomat hyökkäykset eivät ole tunnistettavissa |
| **Väärät havaitsemat** | Normaali liikenne voidaan merkitä riskiksi (false positive) |
| **Resurssit** | DPI vaatii suurta prosessoria ja muistia |

## Seuraavaksi

Seuraavaksi tarkastellaan [vpn.md](vpn.md), jossa käsitellään virtuaalisten verkkojen (VPN) perusteita, IPsec ja SSL/TLS -protokooloista.
