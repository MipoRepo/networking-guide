# TLS (Transport Layer Security)

**TLS** (Transport Layer Security) on protokolla, joka tarjoaa salatun yhteyden Internet-verkossa. Se perustuu **RFC 8446** -standardiin (TLS 1.3) ja korvaa vanhan **SSL:n** (Secure Sockets Layer). TLS on perusta myös **HTTPS:n** – salatulle HTTP:llä.

## Mitä tämä sivu käsittelee?

- **TLS:n periaate** – miten yhteys muodostetaan
- **TLS 1.2 vs TLS 1.3** – versiot ja käytetyt mekanismit
- **Salaustarve** – varmenteet, CA:t, kirjanpito

## TLS:n periaate

TLS-yhteyden muodostus tapahtuu **kolmen vaiheen** avaamisessa:

```text
Client                      Server
   |  → ClientHello →         |
   | ← ServerHello ←           |
   |  → Certificate →          |
   | ← CertificateVerify ←     |
   |     → Finished →          |
   |     ← Finished ←          |
   |      ↑ Encrypted data ↑   |
```

1. **Handshake** – sovitaan protokollat ja versiot
2. **Certificate** – palvelin näyttää varmenteen
3. **Key Exchange** – valmistellaan istunnon avain
4. **Application Data** – salattu yhteys käynnissä

## TLS 1.2 vs TLS 1.3

| Ominaisuus | TLS 1.2 | TLS 1.3 |
|------------|---------|---------|
| Handshake | 2 vuorovaikutusta (4+ viestiä) | 1 vuorovaikutus (2 viestiä) |
| Salaus | Monipuolinen | Rajoteltu (poistettu vanhat) |
| Key Exchange | RSA, DH, ECDH | DH, ECDH (yhteiset) |
| Status | Peratti (deprecated) | Nykyinen |

!!! warning "TLS 1.2 on vanhentunut"

    TLS 1.2 on merkittävästi vanhentunut. Suositellaan TLS 1.3 käytöstä. TLS 1.0 ja 1.1 ovat **poistetut käytöstä**.

## Salausmekaniikat

TLS 1.3 tukee seuraavia salauksia:

| Algoritmi | Selitys |
|-----------|---------|
| **TLS_AES_256_GCM_SHA384** | AES-256-GCM + SHA-384 |
| **TLS_CHACHA20_POLY1305_SHA256** | ChaCha20 + SHA-256 |
| **TLS_AES_128_GCM_SHA288** | AES-128-GCM + SHA-288 |

### Key Exchange (Diffie-Hellman Ephemeral)

| Vaihe | Selitys |
|-------|---------|
| **DHE** | Diffie-Hellman Ephemeral – jokainen istunto saa omansa |
| **ECDHE** | Elliptinen Diffie-Hellman – tehokkaampi |

## SSL-varmenteet (Certificates)

TLS käyttää **SSL-varmenteita** (X.509-standardiin perustuvia varmenteita):

### Rakenne

| Osio | Selitys |
|------|---------|
| **Subject** | Palvelimen nimi |
| **Issuer** | CA (Certificate Authority) |
| **Valid From/To** | Voimassa-aika |
| **Public Key** | Julkinen avain |
| **Signature** | CA:n allekirjoitus |

### Esimerkkivarmenteen tarkistus

```bash
# Näytä palvelimen varmentee
openssl s_client -connect example.com:443

# Varmista varmenteen voimassa-aika
echo | openssl s_client -connect example.com:443 2>/dev/null | openssl x509 -noout -dates
```

## CA (Certificate Authority)

| Tyyppi | Selitys |
|--------|---------|
| **Root CA** | Perus-CAA (esim. Let's Encrypt) |
| **Intermediate CA** | Tuo varmenteen, joka juutuu Rootiin |
| **End-entity CA** | Palvelun varmentee |

!!! info "CA:n ja ketjun tarkistaminen"

    TLS-varmenteen tarkistuksessa palvelin näyttää **varmennekkeen ketjun** (chain), joka alkaa End-entity-varmenteesta ja päättyy Rootiin. Tämä tarkistetaan CA:n juotteetietokantaan.

## TLS:n konfigurointi

### Palvelin (nginx-esimerkki)

```text
server {
    listen 443 ssl;
    ssl_protocols TLSv1.3;
    ssl_certificate /etc/letsencrypt/live/example.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/example.com/privkey.pem;
}
```

### Asiakas (Selain tarkistus)

Selaimet tarkistavat:

1. **Varmenteen voimassa-aika** – onko vanhentunut?
2. **Domain-nimi** – vastaako palvelin nimeä?
3. **CA:n luotettavuus** – onko CA selaimen luotetuissa?

## TLS:n käyttö

| Sovellus | Salaus | Selitys |
|----------|--------|---------|
| HTTPS | TLS | Salattu HTTP |
| SMTPS | TLS | Salattu sähköposti |
| FTPS | TLS | Salattu FTP |
| IMAPS | TLS | Salattu sähköposti |

## TLS:n rajoitukset

| Rajoite | Selitys |
|---------|--------|
| Palvelin | TLS-palvelimet voivat olla yksittäinen virheasema |
| CA | Yksi CA:n vanheneminen voi rikkoa monta palvelinta |
| Overhead | TLS lisää prosessointia |
| TLS 1.2 | Vanhentunut – poistakaa käytöstä |

## Esimerkkikäsittely (Wireshark)

```text
Frame 1: 142 bytes
Internet Protocol Version 4, Src: 192.168.1.100, Dst: 10.0.0.1
Transmission Control Protocol, Src Port: 54321, Dst Port: 443
Secure Sockets Layer
    TLSv1.3 Record Layer: Handshake Protocol - Client Hello
```

## Seuraavaksi

Kun olet ymmärtänyt TCP, UDP, SSH ja HTTP/TLS -protokolat, siirrytään [11-palvelimet-ja-wlan/index.md](../11-palvelimet-ja-wlan/index.md)-osioon, jossa käsitellään palvelimpia, päätelaitteita ja WLAN:ää.
