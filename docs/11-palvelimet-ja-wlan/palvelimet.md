# Palvelimet (Servers)

**Palvelin** (server) on laitteisto- tai ohjelmistolainen yksikkö, joka tarjoaa palveluita asiakkaalle (client). Palvelimet voivat olla fyysisiä (physica) tai virtuaalisia (virtual), ja ne voivat toimia paikallisesti tai pilvessä.

## Mitä tämä sivu käsittelee?

- **Palvelintyypit** – WWW, sähköposti, tietokanta, tiedostopalvelin
- **Virtualisointi** – VM:t ja containerit
- **Laitteisto vs ohjelmisto** – erot ja käyttö

## Palvelintyypit

| Palvelin | Käyttö | Esimerki |
|---------|--------|----------|
| **WWW-palvelin** | WWW-sivujen tarjoaminen | Apache, Nginx |
| **Sähköpostipalvelin** | Sähköpostien lähetys/vastaanotto | Postfix, Exchange |
| **Tietokantapalvelin** | Tietokannan ylläpito | MySQL, PostgreSQL |
| **Tiedostopalvelin** | Tiedostojen jakaminen | Samba, NFS |

### WWW-palvelin (Web Server)

WWW-palvelin vastaa HTTP-pyynnöistä (katsoo [10-http.md](../10-tcp-udp-ssh-http/http.md)):

1. Vastaanottaa HTTP-pyynnön (esim. GET /index.html)
2. Hakee tiedoston palvelimelta
3. Lähettää vastauksen (200 OK + tiedosto)

Esimerkikonfiguraatio (Nginx):

```text
server {
    listen 80;
    server_name example.com;
    root /var/www/html;
    index index.html;
}
```

### Tietokantapalvelin

| Liitty | Esimerkki |
|--------|-----------|
| Selainkäyttöinen | MySQL, PostgreSQL |
| Sovellus | API → Database |
| Salaus | TLS-yhteys (esim. mysqld --require_secure_transport) |

## Virtualisointi ja Containerit

### Virtuaalitietokoneet (VM:t)

| Ominaisuus | Selitys |
|------------|---------|
| **Isolointi** | Koko käyttöjärjestelmä erossa |
| **Resurssit** | Oma RAM, CPU, levy |
| **Käynnistäminen** | Pitkä käynnistusaika |
| **Suorituskyky** | Heikompi kuin natiivi |

### Containerit (esim. Docker)

| Ominaisuus | Selitys |
|------------|---------|
| **Jako** | Yhteinen käyttöjärjestelmä |
| **Resurssit** | Jako järjestelmän kanssa |
| **Käynnistäminen** | Nopeampi käynnistus |
| **Kokoisuus** | Pieni kokoinen |

!!! info "VM vs Container"

    - **VM**: Koko käyttöjärjestö säilytetään – parempi erottelu
    - **Container**: Yhteinen ydin – nopeampi ja kevyempi

## Palvelimen skaalaus

| Menetelmä | Selitys | Esimerki |
|-----------|---------|----------|
| **Horizontal** | Lisää ovia (instancet) | Load balancer + 10 web-serviikki |
| **Vertical** | Lisää resursseja (CPU, RAM) | Korvaa palvelimen kiintiöillä |

## Palvelimen valinta

| Tarve | Suositus |
|-------|----------|
| Kevyt WWW | Nginx tai Caddy |
| Monimutkainen logic | Apache tai Node.js |
| Tietokanta | PostgreSQL, MySQL, tai MongoDB |
| Reaaliaikainen | WebSocket-palvelin |
| Työkalu | Docker + Kubernetes skaalauksessa |

## Palvelimen valtio

| Tila | Selitys |
|------|---------|
| **Idle** | Ei aktiivista työtä |
| **Busy** | Käsittelee pyyntöjä |
| **Maintenance** | Päivityksessä tai korjauksessa |

## Esimerkkikäsittely

```bash
# Tarkista palvelimen tila (Linux)
systemctl status apache2 nginx mysql

# Tarkista kuormitus
top
```

## Palvelimen rajoitukset

| Rajoite | Selitys |
|---------|--------|
| Resurssit | Yksi palvelin voi kuormittaa rajallista prosessia |
| Yksikkövirhe | Jos palvelin kaatuu, palvelu käynnistyy uudestaan |
| Skaalaaminen | Vaatii huolellista suunnittelua |

## Seuraavaksi

Seuraavaksi tarkastellaan [paatelaitteet.md](paatelaitteet.md), jossa käsitellään päätelaitteita: PC:t, läppärit, päätelaitteet ja niiden verkkoissa ottaminen käyttöön.
