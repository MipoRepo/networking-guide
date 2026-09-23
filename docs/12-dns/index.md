# DNS (Domain Name System)

Tämä osio käsittelee **DNS:ää** (Domain Name System) – verkkoa, joka kääntää nimet (esim. `example.com`) IP-osoitteiksi (esim. `93.184.216.34`). DNS on keskeinen osa Internet, ja se perustuu standardeihin **RFC 1034** (arvio), **RFC 1035** (protokolla) ja **RFC 4033–4035** (DNSSEC).

## Mitä tämä osio käsittelee?

| Sivu | Aihe | Keskeinen kysymys |
|------|------|-------------------|
| DNS-perusteet | Resurssitietueet, nimiavaruus | Miten nimet ja osoitteet liikkuvat? |
| DNS-kysely | Iteratiivinen vs rekursiivinen | Miten kysely etenee? |
| Rekisteröinti | DNSSEC, rekisteröinti | Miten varmistaa luotettavuus? |
| Konfigurointi | BIND, resolv.conf | Miten ottaa DNS käyttöön? |

## Miksi DNS on tärkeä?

| Ilman DNS:ä | DNS:n kanssa |
|-------------|--------------|
| Käytäjänä on muista IP-osoitteita | Käytetään nimiä (selkeämpi) |
| Manuaalinen päivittäminen | Automaattinen päivittäminen |
| Ei turvallisuutta | DNSSEC (kyseessä) |

## Tämä osio ja verkko

DNS toimii **Layer 7** -tasossa (sovelluskerros) ja liittyy suoraan TCP:ään/UDP:ään (katsaa [10-tcp-udp-ssh-http/index.md](../10-tcp-udp-ssh-http/index.md)). Useimmissa kyselyissä käytetään **UDP:ää porttiin 53**, mutta isoissa vastauksissa käytetään TCP:ta.

## Seuraavaksi

Aloitamme [dns-perusteet.md](dns-perusteet.md)-sivulta, jossa käsitellään resurssitietueita, nimistöä ja DNS-puun rakennetta.
