# ARP (Address Resolution Protocol)

**ARP** (Address Resolution Protocol) on IETF:n määrittelemä protokolla (**RFC 826**, 1982), joka kääntää IPv4-osoitteen **MAC-osoitteeksi** paikallisessa verkossa.

## Miksi ARP on tarpeen?

Internet-protokollat toimivat kerroksissa. IPv4 antaa loogisen osoitteen, mutta fyysisessä siirrossa verkko tarvitsee MAC-osoitteen (katso [02-ethernet/mac-osoitteet.md](../02-ethernet/mac-osoitteet.md)).

Esimerkiksi: kun hosti A haluaa lähettää paketin hostille B:

1. A tiedettää B:n IPv4-osoitteen (esim. `192.168.1.2`)
2. Mutta A ei tiedä B:n MAC-osoitetta
3. A lähettää **ARP-kyselyn**: "Kuka on 192.168.1.2?"
4. ARP vastaa: "Minä olen 192.168.1.2, MAC-osoitteeni on 00:11:22:33:44:55"

## Kuinka ARP toimii? (RFC 826)

ARP on yksinkertainen kysely-vastausprotokolla. Se ei tarvitse yhteyttä – se toimii **verkkotason (layer 2)** viesteinä.

| Viesti | Selitys |
|--------|----------|
| ARP-request | Julkinen kysely koko verkolle: "Kuka on osoite X?" |
| ARP-reply | Yksityinen vastaus: "Minä olen osoite X, tässä MAC-osoitteeni" |

### Prosessi askel askeleelta

Kun hosti haluaa lähettää paketin:

1. Etsi IPv4-osoite → MAC-osoite -karttukoon (ARP-taulusta)
2. Jos löytyy → lähetä paketti suoraan
3. Jos ei löydy → lähetä **ARP-request** (broadcast)
4. Odota vastausta – tallenna se ARP-tauluun
5. Lähetä alkuperäinen paketti

## ARP-taulu

ARP-taulu (ARP table) on paikkainen muisti, jossa säilyydetään IPv4 → MAC -kartoitus. Sen voi tarkastaa esimerkiksi näin Linuxissa:

```bash
ip neigh show
# tai vanemmalla tavalla:
arp -a
```

Esimerkokäynti:

```text
Address         HWtype  HWaddress         Flags  Iface
192.168.1.1     ether   00:11:22:33:44:55  C      eth0
```

## ARP-viestin rakenne (RFC 826)

| Kenttä | Koko (bitit) | Selitys |
|--------|------|--------|
| Hardware Type | 16 | Ethernet = 1 |
| Protocol Type | 16 | IPv4 = 0x0800 |
| Hardware Len | 8 | MAC-osoitteen pituus (6) |
| Protocol Len | 8 | IPv4-osoitteen pituus (4) |
| Operation | 16 | 1=request, 2=reply |
| Sender MAC | 48 | lähettävän MAC-osoite |
| Sender IP | 32 | lähettävän IPv4-osoite |
| Target MAC | 48 | kohde-MAC (requestissa tyhjä) |
| Target IP | 32 | kohde-IPv4 |

## Gratis ARP (Gratuitous ARP)

Gratis ARP on ARP-viesti, jossa lähettäjän IP ja kohde-IP ovat samat. Sitä käytetään:

| Käyttö | Selitys |
|--------|----------|
| IP-osoitteen tarkistus | Tarkista, ettei kenelläkään ole samanlainen osoite |
| ARP-taulun päivitys | Pakota reitittimet päivittämään kartta |
| Palvelun siirto | DNS- tai NAT-palvelun siirto uuteen isäntään |

## Etähaetaan (Proxy ARP)

Proxy ARP on asia, jossa laitteisto vastaa toisen laitteen sijaisuudessa ARP-kyselyyn. Tätä käytetään harvoin, ja se voi tehdä verkon läpinäkyvyyttä heikommaksi – **ei suositella tuotantokäytössä.**

## Esimerkki: ARP komennot

```bash
# Näytä ARP-taulu
ip neigh show

# Tyhjennä taulu
ip neigh flush all

# Lisää staattinen ARP-kohta (harvinainen)
arp -s 192.168.1.5 00:11:22:33:44:55
```

## Seuraavaksi

Kun olet ymmärtänyt ARP:n, siirrytään [broadcast.md](broadcast.md), jossa tarkastellaan lähetyspyynteitä ja broadcast-aliverkkoja, jotka ovat ARP-kyselyjen perusta.
