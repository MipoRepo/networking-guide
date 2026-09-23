# HTTP (Hypertext Transfer Protocol)

**HTTP** (Hypertext Transfer Protocol) on sovellusprotokolla, joka perustuu **RFC 9110** -standardiin (aiemmin RFC 7230–7235). HTTP on World Wide Webin perusprotokolla – se mahdollistaa selainten ja palvelinten välisen tiedon vaihtamisen.

## Mitä tämä sivu käsittelee?

- **HTTP-pyyntö ja vastaus** – miten selain kommunikoi palvelimen kanssa
- **HTTP/1.1 ja HTTP/2** – versiot ja ero per4
- **Headerit ja statuskoodit** – miten palvelin ilmoittaa virheistä

## HTTP-pyyntö ja vastaus

HTTP toimii yksinkerteisessä kyse-vastausmallissa:

```text
Selain         Palvelin
   |  → GET / HTTP/1.1 →       |
   |   (Pyyntö sivusta)         |
   | ← 200 OK ←                |
   |   (HTML-sivu)              |
```

Käyttäjä lähettää HTTP-pyynnön, palvelin vastaa esimerkiksi HTML-sivulla tai virheviestillä.

## HTTP-pyyntötyypit (Methods)

| Menetelmä | Selitys | Esimerkki |
|-----------|---------|-----------|
| **GET** | Haetaan tietoa | `/search?q=kissa` |
| **POST** | Lähetetään tietoa | Lomakkeen lähetys |
| **PUT** | Päivitetään resurssi | `PUT /user/123` |
| **DELETE** | Poistetaan resurssi | `DELETE /post/456` |
| **HEAD** | Hakee ainoastaan headerit | `/api/data` |
| **OPTIONS** | Paljastaa tuetut menetelmät | `OPTIONS /` |

## HTTP-statuskoodit

Palvelin vastaa statuskoodilla, joka kertoo, onnistuiko pyyntö:

| Ryhmä | Selitys | Esimerkki |
|-------|---------|-----------|
| **1xx** | Informaatio | 100 Continue |
| **2xx** | Onnistui | 200 OK, 201 Created |
| **3xx** | Ohjaus | 301 Moved, 302 Found |
| **4xx** | Asiakkaan virhe | 404 Not Found, 403 Forbidden |
| **5xx** | Palvelimen virhe | 500 Internal, 503 Service Unavailable |

## HTTP/1.1 vs HTTP/2

| Ominaisuus | HTTP/1.1 | HTTP/2 |
|------------|----------|--------|
| Yhteys | Yksi (TCP) | Multiplexioitu |
| Pyynnöt | Peräkkäin | Rinnakkaiset |
| Headerit | Tekstimuodossa | Binääri |
| Prioriteetti | Ei | Kyllä |

### HTTP/2 – miksi tämä on tärkeä?

HTTP/2 tukee **multiplexiota**, jossa useampi pyyntö voi kulkea samanaikaisesti samassa yhteydessä:

```text
HTTP/1.1: GET A → GET B → GET C (jonossa)
HTTP/2:  GET A ─┐
                 ├── samassa yhteydessä
         GET B ──┘
         GET C → samanaikaisesti
```

## HTTP-pyyntö esimerkinä

### GET-pyyntö

```text
GET /index.html HTTP/1.1
Host: example.com
User-Agent: Mozilla/5.0
Accept: text/html,application/xhtml+xml
```

| Rivi | Selitys |
|------|---------|
| `GET` | Pyyntömenetelmä |
| `/index.html` | Pyydetty polku |
| `HTTP/1.1` | HTTP-versio |
| `Host` | Palveluntyyppi |
| `User-Agent` | Selaimen tietoja |

### Vastaus (200 OK)

```text
HTTP/1.1 200 OK
Date: Wed, 21 Oct 2015 07:28:00 GMT
Content-Type: text/html
Content-Length: 1024

<!DOCTYPE html>
<html>...</html>
```

## Headerit

| Header | Selitys |
|--------|----------|
| **Host** | Palveluntyyppi |
| **Accept** | Hyvitetyt sisällytykset |
| **User-Agent** | Selaimen tietoja |
| **Content-Type** | Sisällön tyyppi (esim. `text/html`) |
| **Content-Length** | Siivun koko tavuissa |

## Stateful vs Stateless

| Ominaisuus | Stateful | Stateless |
|------------|----------|-----------|
| Istunto | Säilytään | Ei säilytä |
| Resurssit | Enemmän muistia | Vähemmän resursseja |
| HTTP | Stateless (oletus) | Ei ole |

!!! info "HTTP on Stateless"

    HTTP 1.1 on oletus ** statelesss** – joka pyyntö koetaan erilliseksi. Tämä voidaan kiikentää evästeiden (cookies) tai tokenien avulla.

## Esimerkkikäsittely (Wireshark)

```text
Frame 1: 74 bytes
Internet Protocol Version 4, Src: 192.168.1.100, Dst: 10.0.0.1
Transmission Control Protocol, Src Port: 54321, Dst Port: 80
Hypertext Transfer Protocol
    GET /index.html HTTP/1.1\r\n
    [Full request URI: http://example.com/index.html]
    Host: example.com\r\n
```

## HTTP:n rajoitukset

| Rajoite | Selitys |
|---------|--------|
| Stateless | Jokainen pyyntö koetaan erilliseksi |
| Ei salattu | HTTP-salaa (käytä HTTPS:ää) |
| Header overhead | ISO headerit voivat hidastaa siirtoa |

## Seuraavaksi

Seuraavaksi tarkastellaan [tls.md](tls.md), jossa käsitellään TLS:ää ja sen roolia HTTP:n suojaamisessa (HTTPS:nä).
