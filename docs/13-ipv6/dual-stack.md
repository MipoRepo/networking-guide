# Dual-stack

**Dual-stack** on menetelmä, jossa laite tukee samanaikaisesti **IPv4:ttä ja IPv6:ta**. Kun päätös siirtyä IPv6:ään on käynnissä, dual-stack on tavallisin siirtomuoto, koska se ei vaadi palveluiden tai verkkoihin muutosta.

## Miksi dual-stack?

IPv4-osoitteiden loppuminen ja IPv6:n omaksueminen ovat pitkäjänteiset prosessit. Siirtyminen vaatii, että:

1. Vanhat palvelut ja laitteet toimivat edelleen IPv4:n kanssa
2. Uudet palvelut ja laitteet pystyvät käyttämään IPv6:ta
3. Kaksi protokollia voi toimia rinnakkain ilman häiriöitä

| Strategia | Kuvaus | Hyvät puolet | Huomiot |
|-----------|--------|--------------|---------|
| **Dual-stack** | IPv4 ja IPv6 rinnakkain | Yhteensopivuus, helppo siirtyminen | Tuokii kaksinkertaisuutta |
| **Tunnelointi** | IPv6 paketit kuljetetaan IPv4-verkkojen läpi | Sallii IPv6:n käytön puututtamissa verkoissa | Lisäylikätys, etäisyys |
| **NAT64** | Kääntää IPv6-osoitteet IPv4-osoitteiksi | Sallii IPv6-pääsyn IPv4-palvelimiin | Pakollinen DNAT (RFC 6147) |

## Dual-stack -arkkitehtuuri

Dual-stack -verkkossa jokainen laite saa **kaksi osoitetta** – yhden IPv4:n ja yhden IPv6:n:

```text
Dual-stack -asema:
┌──────────────────────┐
│    Interface eth0    │
├──────────────────────┤
│ IPv4: 192.168.1.10/24 │
│ IPv6: 2001:db8::10/64 │
└──────────────────────┘
```

### Kuinka se toimii?

Kun sovellus tekee yhteyden:

1. **Selvitetään osoite** – sovellus selvittää, onko kohde IPv4- tai IPv6-osoite
2. **Valitaan oikea osoite** – jos molemmat ovat mahdollista, valitaan IPv6 (RFC 6724)
3. **Avataan yhteys** – sovellus käyttää oikeaa protokia

```text
Esimerkkikäsittely (dual-stack selain):
1. Selain kysyy: www.example.com
2. DNS palauttaa:
     A-osoite:   93.184.216.34   (IPv4)
   AAAA-osoite:  2606:2803::1234  (IPv6)
3. Selain valitsee IPv6 (prioriteetti RFC 6724)
4. Selain muodostaa yhteyden 2606:2803::1234:lla
```

## Osoitteistus dual-stack-verkossa

### IPv4: DHCP

IPv4:ssä osoitteet jaetaan yleensä **DHCP-palvelimilta** (DHCPv4, RFC 2131):

```bash
# /etc/dhcp/dhcpd.conf
subnet 192.168.1.0 netmask 255.255.255.0 {
  range 192.168.1.100 192.168.1.200;
  option routers 192.168.1.1;
  option domain-name-servers 8.8.8.8;
}
```

### IPv6: SLAAC tai DHCPv6

IPv6:ssa osoitteet jaetaan joko:

- **SLAAC** (RFC 4862) – autonominen, ilman tilaa (laite itse muodostaa osoitteen)
- **DHCPv6** (RFC 3315) – keskitetty osoitteistus

```bash
# /etc/dhcp/dhcpd.conf
subnet6 2001:db8::/64 {
  range6 2001:db8::100 2001:db8::200;
  option dhcp6.name-servers 2001:4860:4860::8888;
}
```

### Linux-esimerkki

```bash
# IPv4 (DHCP)
auto eth0
iface eth0 inet dhcp

# IPv6 (SLAAC + DHCPv6)
iface eth0 inet6 auto
iface eth0 inet6 manual
```

## Dual-stack ja DNS (RFC 1794)

Dual-stack-verkossa DNS-palvelimen on tärkeä osa:

| Tietue | Selitys |
|--------|---------|
| **A** | IPv4-osoite |
| **AAAA** | IPv6-osoite |

| Esimerkkikysely | Vastaus |
|-----------------|---------|
| `www.example.com A` | `93.184.216.34` (IPv4) |
| `www.example.com AAAA` | `2606:2803::1234` (IPv6) |

!!! info "Happy Eyeballs (RFC 6555)"

    Jos sekä IPv4 että IPv6 ovat käytettävissä, selain yrittää muodostaa yhteyden molempiin. **Happy Eyeballs** -protokolla (RFC 6555) yrittää yhteyttä IPv6:lla aluksi, ja siirtyy IPv4:ään, jos IPv6-yhteys ei muodostu nopeasti.

## Dual-stack ja suorituskyky

Dual-stack voi aiheuttaa suorituskykyongelmia:

- **Kaksinkertainen protokolla-asiakas**
- **Lisää IP-tauluja**
- **Lisää ARP-/ND-kyselyita**

| Tilanne | IPv4 | IPv6 | Dual-stack |
|---------|------|------|------------|
| Osoitteita | ≤ 4,3 M | 2¹²⁸ | 2 × |
| Reititystaulu | 1 taulu | 1 taulu | 2 taula |

## Dual-stack -haasteet

| Haaste | Selitys | Ratkaisu |
|--------|---------|----------|
| **Pysyvä yhteys ongelma** | NAT ei IPv6:ssa | Käytä NAT64:ä (RFC 6146) |
| **DNS-pikavertailu** | AAAA-osoite hitaampi kuin A | Käytä Happy Eyeballs (RFC 6555) |
| **Reititystaulun kohoaminen** | Kaksi protokillia | Käytä FIB (Forwarding Information Base) |

## Seuraavaksi

Seuraavaksi tarkastellaan [OSPFv3-protokollaa](ospf-v6.md) (IPv6 OSFP:stä), joka on IPv6-verkosten dynaamisen reitityksen määrittely.
