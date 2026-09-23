# TCP, UDP, SSH ja HTTP

Tämä osio käsittelee **transport- ja sovelluskerrosten** protokollia: **TCP**, **UDP**, **SSH** ja **HTTP/HTTPS**. Nämä ovat keskeisiä protokollia Internetissä, ja ne toimivat **Layer 4** -tasolla (TCP/UDP) sekä **Layer 7** -tasolla (HTTP, SSH). Tämä dokumentti perustuu **RFC 9293** (TCP), **RFC 9290** (QUIC/UDP), **RFC 4251** (SSH) ja **RFC 9110** (HTTP).

## Mitä tämä osio käsittelee?

| Sivu | Aihe | Keskeinen kysymys |
|------|------|-------------------|
| TCP | Transmission Control Protocol | Miten luotettaa yhteyttä luodaan? |
| UDP | User Datagram Protocol | Milloin käytetään yksinkertaista siirtoa? |
| SSH | Secure Shell | Miten suojata komentoyhteydet? |
| HTTP | Hypertext Transfer Protocol | Miten selaimet ja palvelimet kommunikoivat? |
| TLS | Transport Layer Security | Miten salataan yhteydet? |

## Miksi nämä protokollat ovat tärkeitä?

| Protocol | Käyttö | Esimerkki |
|----------|--------|----------|
| TCP | Luotettu yhteys | Sähköposti, tiedostot |
| UDP | Nopea siirto | Videoneuvottelut, DNS |
| SSH | Salattu etäkäyttö | Palvelimen hallinta |
| HTTP | Verkkosivut | WWW-selailu |

## Tämä osio ja reititys

TCP ja UDP ovat **reititettävissä** – ne kantavat dataa reititetyssä verkossa. SSH ja HTTP ovat sovelluksia, jotka käyttävät näitä protokollia taustalla. Tämä liittyy suoraan [07-reititys/index.md](../07-reititys/index.md)-osioon.

## OSI-mallinnus ja protokollat

| Taso | Protokolla | Selitys |
|------|-----------|---------|
| Layer 4 | TCP / UDP | Yhteydenhallinta |
| Layer 5–6 | TLS | Salaus |
| Layer 7 | HTTP / SSH | Sovellusliittymät |

## Seuraavaksi

Aloitamme [tcp.md](tcp.md)-sivulta, jossa käsitellään TCP-yhteyden luomista ja sen kolme-tason kättä.
