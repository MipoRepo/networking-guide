# SSH (Secure Shell)

**SSH** (Secure Shell) on salattu etäkäyttöprotokolla, joka perustuu **RFC 4251** -standardiin. SSH mahdollistaa turvallisen komennon lähettämisen ja tiedonsiirron etäpalvelimelle – korvaten vanhat, epäsuojatut mekanismit kuten Telnet ja rlogin.

## Mitä tämä sivu käsittelee?

- **SSH:n periaate** – miten yhteys muodostetaan
- **SSH-1 vs SSH-2** – standardit ja versiot
- **Salaus ja tunnistautuminen** – RSA, ECDSA, MFA

## SSH:n periaate

SSH-yhteys koostuu kolmesta osasta:

```text
Client                          Server
   |  → SSH_MSG_KEXINIT →         |
   | ← SSH_MSG_KEXINIT ←          |
   |    →  Diffie-Hellman →       |
   |  ←  Diffie-Hellman ←          |
   |    → Encrypted: auth →       |
   |  ← Encrypted: success ←      |
   |        ↑ Encrypted shell ↑   |
```

1. **Handshake** – sovitaan protokollat ja salausmenetelmät
2. **Key Exchange** – valmistellaan istunnon avaimet (DH)
3. **Authentication** – tunnistaudutaan (esim. salausavain)
4. **Session** – komentoyhteys salataan (äidinkielinen kautta)

## SSH-1 vs SSH-2

| Ominaisuus | SSH-1 | SSH-2 |
|------------|-------|-------|
| Standardi | SSH-1 | RFC 4251–4256 |
| Salaus | DES, Blowfish | AES, ChaCha20, Ed25519 |
| Tunnistautuminen | Salasana, RSA-avain | Salasana, RSA, ECDSA, MFA |
| Status | **Poistettu** | Nykyinen |

SSH-2 on merkittävä parannus SSH-1:stä. Se tukee parempaa salausta ja kaksipuolista tunnistautumista.

## Tunnistautuminen

SSH tukee useampaa tunnistautumismuotoa:

| Tunti | Selitys | Esimerkki |
|-------|---------|-----------|
| **Password** | Salasana | Salasanan kysyminen |
| **Public Key** | Julkinen/avainparit | RSA, Ed25519 |
| **Certificate** | Varmenteen pohjainen | Yrityssertifikaatti |
| **Multi-factor** | Yhdistelmä | Avain + TOTP |

### Julkisen avaimen käyttäminen

```bash
# Luo RSA-avain
ssh-keygen -t rsa -b 4096 -C "kayttaja@esim.example.com"

# Lähetä julkinen avain palvelimelle
ssh-copy-id kayttaja@192.168.1.100
```

## SSH:n salaus

SSH-2 tukee seuraavia salausprotokoloita:

| Algoritmi | Käyttö | Selitys |
|-----------|--------|---------|
| **AES-256-GCM** | Stream | Nopin ja turvallinen |
| **ChaCha20-Poly1305** | Stream | Selvästi nopeampi |
| **Diffie-Hellman** | Key Exchange | Turvallinen avaintukahvuus |

!!! info "Forward Secrecy"

    SSH-2 tukee **Forward Secrecy** -ominaisuutta, jossa jokainen istunto saa omansaistun katseleen. Tämä tarkoittaa, ettei yhteyden salausta voi purkaa myöhemmällä yksityisen avaimen avulla.

## SSH-konfigurointi

SSH:n asetukset löytyvät yleensä `/etc/ssh/sshd_config` -tiedostosta (palvelin) ja `~/.ssh/config` -tiedostosta (asiakas):

### Palvelin (sshd_config)

```text
Port 22
Protocol 2
PermitRootLogin no
PasswordAuthentication no
PubkeyAuthentication yes
AllowUsers kayttaja1 kayttaja2
```

### Asiakas (.ssh/config)

```text
Host serveri
  HostName 192.168.1.100
  User kayttaja
  Port 2222
  IdentityFile ~/.ssh/id_ed25519
```

## SSH:n käyttötavat

| Toiminto | Komento |
|----------|---------|
| Yhteyden avaaminen | `ssh kayttaja@palvelin` |
| Tiedoston siirto | `scp tiedosto Kayttäjä@palvelin:/kohde` |
| Tunneli | `ssh -L 8080:localhost:80 palvelin` |

## SSH:n turvallisuus

| Ohjeistus | Selitys |
|-----------|--------|
| Poista SSH-1 | Varmista, että palvelin tukee vain SSH-2 |
| Käytä julkeaa avaint | Salasanan sijasta käytä julkeaa avainta |
| Rajoita käyttäjiä | `AllowUsers`-asetuksella |
| Salli vain tietty portti | Vaihda oletusportit (22) pois käytöstä |
| Ota käyttöön MFA | Kaksivaiheinen tunnistautuminen |

## SSH:n rajoitukset

| Rajoite | Selitys |
|---------|--------|
| Portti on näkyvillä | Palvelin on altis skannaukselle |
| Tiedostojen siirto | SCP voi olla hidasta suurilla tiedostoilla |
| Yhteysvirheet | Verkon katkeaminen voi katkaista istunnon |

## Esimerkkikäsittely (Wireshark)

```text
Frame 1: 142 bytes
Internet Protocol Version 4, Src: 192.168.1.100, Dst: 192.168.1.1
Transmission Control Protocol, Src Port: 54321, Dst Port: 22
    Flags [SYN]
    Sequence: 0
```

## Seuraavaksi

Seuraavaksi tarkastellaan [http.md](http.md), jossa käsitellään HTTP-protokollaa ja sen roolia web-liikenteessä.
