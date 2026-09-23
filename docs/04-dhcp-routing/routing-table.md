# Reititystaulu (Routing Table)

**Reititystaulu** (routing table) on tietokanta, joka pitää kirjaa siitä, **minne paketit lähetetään**, kun ne saapuvat reitittimen eri verkkoihin. Se on reitin päätöksentekomekanismi – siis "kartta" siitä, mihin eri suuntiin paketit vievät.

## Miksi reititystaulu on tärkeä?

Kun reititin vastaanottaa paketin, se tekee kolme kysymystä:

1. **Mikä on kohdeosoite?**
2. **Mihin verkkoon se kuuluu?**
3. **Mihin seuraajan osoitteeseen sen lähetetään?**

Vastaanottamansa vastauslöytyy reititystaulusta.

## Reititystaulun rakenne

Jokainen reitti koostuu kolmesta kentästä:

| Kenttä | Koko | Selitys |
|--------|------|---------|
| **Verkko-osoite (Network)** | IPv4/32 | Kohdeverkko (esim. 192.168.1.0) |
| **Maski (Netmask)** | 32-bit | Määrittelee verkon koon (esim. /24) |
| **Seuraaja (Next-hop)** | IPv4/32 | Seuraavan laitteen osoite (esim. 10.0.0.1) |

## Esimerkkireititystaulu (Linux)

```bash
ip route show
```

Esimerkokäynti:

```text
192.168.1.0/24 dev eth0 proto kernel scope link src 192.168.1.100
10.0.0.0/8 via 192.168.1.1 dev eth0
default via 192.168.1.254 dev eth0
```

Tässä kolme reittiä:

| Reitti | Selitys |
|--------|---------|
| `192.168.1.0/24` | Tämä verkko → lähetetään suoraan (dev eth0) |
| `10.0.0.0/8` | Verkko 10.x.x.x → lähetetään 192.168.1.1 kautta |
| `default` | Kaikki muu → lähetetään 192.168.1.254 kautta |

## Reitin valinta – "mitä enemmän, sitä tarkempi"

Kun reititin valitsee reitin, se valitsee **rakentavan enemmän täsmäävän** – eli **pidemmän maskin**. Esimerkiksi:

| Reitti | Maski | Valinta |
|--------|-------|---------|
| 192.168.1.0/24 | /24 | Täsmää kohdeosoitteeseen |
| 0.0.0.0/0 | /0 | EI täsmää – oletusreitti |

Jos kohde on `192.168.1.50`, valitaan `/24`-reitti. Jos kohde on `8.8.8.8`, valitaan `/0`-reitti (oletusreitti).

## Reitittimen omistus – paikallinen reitti

Jokainen reititin lisää automaattisesti **paikallisen reitin** jokaiselle omalle verkolleen:

```text
192.168.1.0/24 dev eth0 proto kernel scope link src 192.168.1.100
```

Tämä tarkoittaa: "Tämä verkko on suoraan liittynyt – lähetä suoraan, ilman seuraajaa."

## Reititystaulun päivitys

| Menetelmä | Selitys |
|-----------|---------|
| **Staattinen** | Reitti lisätään käsin (katso [staattinen-reititys.md](staattinen-reititys.md)) |
| **Dynaaminen** | Reitti päivittyy automaattisesti (katso [07-reititys/dynaatinen-reititys.md](../07-reititys/dynaatinen-reititys.md)) |

## Esimerkki: Cisco -tyylinen reititystaulu

```text
Router# show ip route
Codes: L=connected, C=connected, S=static, R=rip, M=mobile, B=bgp
       D=OSPF, EX=external, Oi=inter area, IA=internal area

Gateway of last resort: 192.168.1.254 to network 0.0.0.0

S    0.0.0.0/0 [1/0] via 192.168.1.254
C    192.168.1.0/24 is directly connected, ethernet0
L    192.168.1.100/32 is directly connected, ethernet0
```

Symbolit selittävät reitin tyypin:

| Symboli | Selitys |
|---------|--------|
| **L** | Liittynyt (Connected) – paikallinen osoite |
| **C** | Verkko on suoraan liittynyt |
| **S** | Staattinen (manuaalinen) |
| **O** | OSPF (dynaaminen) |
| **D** | EIGRP (dynaaminen) |

## Miksi reititystaulu pysyy pienenä?

| Toimi | Hyöty |
|-------|-------|
| **Superverkot** (aggregation) | Yhdistää pienet verkot suuriksi (esim. 4×/24 → 1×/22) |
| **Oletusreitit** | Vähentää monimutkaisuutta yhdellä reitillä |
| **Classless routing** | Ei enää luokkabasierasta – CIDR kaikkiin |

## Seuraavaksi

Kun olet ymmärtänyt reititystaulun toiminnan, olet valmis siirtymään [05-laitteet/index.md](../05-laitteet/index.md)-osioon, jossa käsitellään fyysisiä verkkolaitteita: kytkimiä, reitittimiä, palomuureja ja verkkokortteja.
