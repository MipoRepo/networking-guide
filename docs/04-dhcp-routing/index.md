# DHCP ja staattinen reititys

Tämä osio käsitkee **DHCP:ää** (Dynamic Host Configuration Protocol) osoitteiden automaattiseen jakamiseen sekä **staattiseen reititykseen** – mekanismeihin, jotka tekevät verkon "itsenäisesti toimivuksi" ilman manuaalista kääntämööntiä.

## Mitä tämä osio käsittelee?

| Sivu | Aihe | Keskeinen kysymys |
|------|------|-------------------|
| DHCP | DHCP-protokolla (RFC 9318) | Miten laitteet saavat automaattisesti oikean IPv4-osoitteen? |
| DHCP-prosessi | DORA -protokolla | Miten DHCPkeskus ja asiakas neuvotella osoitetta? |
| Oletusyhdyskäytävä | Default gateway | Miten verkko lähtee ulos verkosta? |
| Staattinen reititys | Statiikka reititys | Kuinka reititin voi kärjistää paketin eteenpäin? |
| Reititystaulu | Reititystaulu | Miten reititin päättää, minne paketin lähettää? |

## Miksi DHCP on tärkeä?

Manuaalinen osoitteiden antaminen on virhealtisaa ja työmätöntä. DHCP auttaa:

- **Osoitteiden varaushalaus** – varausten hallinta keskitetysti
- **Liikkuvat laitteet** – lattioon, johon asiakas siirtyy, saa uuden osoitteen
- **Virheiden vähentäminen** – ei ihmisen puolta oleva konflikti

DHCP-perustuu RFC:ään **RFC 9318** (aikaisempi **RFC 2131**). Se toimii UDP-protokollalla portteihin 67 (palvelin) ja 68 (asiakas).

!!! info "DHCP ja broadcast"

    Kun asiakas ei vielä tiedä osoitettaan, se käyttää **broadcastia** (`255.255.255.255`) lähettääkseen DHCP-discover-viestinsä – katso [03-ipv4/broadcast.md](../03-ipv4/broadcast.md).

## Miksi staattinen reititys on tärkeä?

Kun paketin kohde on eri verkossa kuin lähettäjän, se tarvitsee **reititin** (router) – laitteen, joka päättää, minne paketin lähettää seuraaksi. **Staattinen reititys** on keino, jolla reititin käsin ohjataan:

```text
ip route 10.0.1.0/24 192.168.1.1
```

Tämä tarkoittaa: "Jos kyseessä on verkko `10.0.1.0/24`, lähetä paketti seuraavalle hydryhmälle (gateway) `192.168.1.1`."

## Kuinka asia liittyy?

| Dokumentti | Liitos |
|-----------|--------|
| [03-ipv4/aliverkot.md](../03-ipv4/aliverkot.md) | Aliverkot ja reitityksen perusta |
| [03-ipv4/arp.md](../03-ipv4/arp.md) | Reitin MAC-osoitteen etsintä |
| [07-reititys/index.md](../07-reititys/index.md) | Dynaaminen reititys (OSPF) |

## Seuraavaksi

Kun olet päivittänyt DHCP:stä ja reitityksestä, siirrytään [05-laitteet/index.md](../05-laitteet/index.md)-osioon, jossa käsitellään fyysisiä verkkolaitteita: kytkimiä, reitittimiä, palomuureja ja kaapelointia.
