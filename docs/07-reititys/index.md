# IPv4-reititys (Routing)

Tämä osio käsittelee **IPv4-reititystä** – sitä, miten verkot päättävät, mihin lähettää paketeja seuraisessa solmessa. Reititys on keskeinen osa IP-verkkoja, ja se perustuu standardeih kuten **RFC 1812** (IPv4-reititys) ja **RFC 2328** (OSPF).

## Mitä tämä osio käsittelee?

| Sivu | Aihe | Keskeinen kysymys |
|------|------|-------------------|
| Reitityksen perusteet | Routing table, CIDR | Miten reitti päätetään? |
| Staattinen reititys | Manuaaliset reitit | Miten ohjataan liikennettä tietylle verkolle? |
| Dynaaminen reititys | RIP, OSPF, BGP – lyhyt johdanto | Miten reitit päivittyvät automaattisesti? |
| OSPF | Open Shortest Path First | Kuinka valitaan paras polku? |

## Mikä on reititys?

Reititys tarkoittaa sitä, että laite (yleensä reititin) päättää, missä verkkolähteessä paketit lähetetään seuraavaksi. Tämä perustuu **reititystauluun** (routing table), jossa on kirjossa:

1. **Kohdeverkko** (esim. `192.168.1.0/24`)
2. **Seuraajan osoite** (esim. `10.0.0.1`)
3. **Käytetty liitäntä** (esim. `eth0`)

## Miksi reititys on tärkeä?

| Ilman reititystä | Reitityksellä |
|------------------|---------------|
| Paketit eivät pääse verkkoihin | Tieto reittien valinnasta |
| Manuaalinen konfigurointi jokaisessa solmussa | Automaattinen päivitys |
| Liikenneyhteydet eivät toimi | Liikenne päätyy oikeaan paikkaan |

## Reititysprotokollat

| Protokolla | Tyyppi | Standardi |
|------------ |--------|-----------|
| Static | Manuaalinen | – |
| RIP | Yksinkertainen | RFC 2453 |
| OSPF | Linkkilainen | RFC 2328 |
| BGP | Puolen välin | RFC 4271 |

## Tämä osio ja IPv4

Reititys toimii **Layer 3** -tasolla – IP-osoitteiden ja paketin kohdeosoitteen perusteella. Se liittyy suoraan [03-ipv4/index.md](../03-ipv4/index.md)-osioon, jossa käsitellään IP-osoitteita ja niiden ryhmittämistä.

## Seuraavaksi

Aloitamme [routing.md](routing.md)-sivulta, jossa käsitellään reititystaulun rakennetta, CIDR-merkintäjärjestelmää ja täsmällisyyttä (longest prefix match).
