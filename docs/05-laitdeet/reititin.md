# Reititin (Router)

**Reititin** (router) on verkkolaitteisto, joka yhdistää erilaiset verkot. Se on **Layer 3** (verkko)-laitteisto, joka käyttää IPv4-osoitteita päätösten tekemiseen. Tämä dokumentti perustuu **RFC 1812** (Requirements for IP Version 4 Routers).

## Mikä reititin on?

Reititin tekee kolme päätoimenpidettä:

1. **Vastaanottaa paketit** eri verkoista
2. **Päättää, minne ne lähetetään** reititystaulun perusteella
3. **Lähettää ne oikeaan suuntaan** – seuraavan hypyn (next-hop) mukaisesti

## Miksi reititin on tärkeä?

| Ilman reititetintä | Reitittimen kanssa |
|---------------------|-------------------|
| Kaikki laitteet samassa verkossa | Laitteet eri verkoissa voivat kommunikoida |
| Ei ulkopuoltaista liikennettä | Internet-yhteys mahdollista |
| Ei NAT:ia | Ei NAT:ia |

## Reitittisen keskeiset komponentit

| Komponentti | Selitys |
|-------------|---------|
| **Reititystaulu** | Tietokanta: verkko → seuraaja |
| **Portit** | Verkko-portit (esim. Ethernet, serial) |
| **Prosessori (CPU)** | Päättää, miten paketit kuljetetaan |
| **Muisti (RAM)** | Tilastot, reititystaulu |
| **Flash** | Käynnissä oleva konfigurointi |

## Reitityspäätös

Kun reititin vastaanottaa paketin, se toimii kolmessa vaiheessa:

1. **Tarkista kohdeosoite** – `192.168.2.100`
2. **Etsi paras täsmäävä reitti** – `192.168.2.0/24 via 10.0.0.2`
3. **Lähetä paketti seuraajalle** – kopioi uusi Ethernet-kehys (MAC-osoitteet)

## Reittien prioriteetti

Reititin valitsee aina pidemmän maskin (enemmän täsmäävän):

| Reitti | Maski | Valinta |
|--------|-------|---------|
| 192.168.2.0/24 | /24 | Tässä tapauksessa valitaan |
| 192.168.0.0/16 | /16 | Ei – vähemmän täsmäävä |
| 0.0.0.0/0 | /0 | Ei – oletusreitti |

## NAT (Network Address Translation)

Useimmissa reitittimeissä on NAT-ominaisuus, joka kääntää private-osoitteet public-osoitteiksi ulospäin. Lisätietoja löytyy [09-nat/index.md](../09-nat/index.md).

## Esimerkkikonfigurointi (Cisco)

```text
! Aseta osoite portille
interface GigabitEthernet0/0
 ip address 192.168.1.1 255.255.255.0
 no shutdown

! Lisää reitti
ip route 10.0.0.0 255.255.255.0 192.168.1.2

! Oletusreitti
ip route 0.0.0.0 0.0.0.0 192.168.1.254

! Näytä reititystaulu
show ip route
```

## Esimerkkikonfigurointi (Linux)

```bash
# Lisää reitti
ip route add 10.0.0.0/24 via 192.168.1.2

# Aseta oletusreitti
ip route add default via 192.168.1.254

# Näytä taulu
ip route show

# Ota IP-forwarding käyttöön
echo 1 > /proc/sys/net/ipv4/ip_forward
```

## Reititen erikoistapaukset

| Tilanne | Toimenpide |
|---------|-----------|
| Tuntematon verkko | Paketti hylätään (ICMP "Destination Unreachable") |
| TTL päätyy nollaan | Paketti hylätään (ICMP "Time Exceeded") |
| Fragmentaatio | ISO pakki jaetaan pienempiin osiin |

## Seuraavaksi

Kun olet ymmärtänyt reitittimen toiminnan, siirrytään [palomuurin](palomuuri.md)-osaan, joka käsittelee verkon turvallisuutta ja liikenteen suodatusta.
