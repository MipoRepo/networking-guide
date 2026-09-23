# Staattinen reititys

**Staattinen reititys** (static routing) on reitinten manuaulinen konfigurointi, jossa reitit määritellään yksitellen järjestelmänvalolta. Tätä käytetään pienissä verkoissa tai niissä tilanteissa, joissa halutaan tarkka kontrolla reitinvalintaan.

## Mitä staattinen reititys opiskelee?

Tämä sivu käsittelee:

- miten staattiset reitit lisätätään
- milloin staattinen reititys on parhaita
- miten se poikkeaa dynaamisestä reitityksestä

Se perustuu yleisiin reitityspraktisoihin, kuten neuvotaan esimerkiksi Linux-dokumentaatiossa.

## Miksi staattinen reititys on tärkeä?

| Tilanne | Miksi staattinen? |
|---------|-------------------|
| Pieni verkko | Yksinkertainen, ei tarvitse lisäohjelmistoja |
| Tietty polku | Halutaan pakottaa liikenne tiettyyn reittiin |
| Oletusreitti | Kaikki tuntemattomat verkot ohjataan eteenpäin |

## Staattisen reitin muoto

Linuxissa staattinen reitti muuttuu muotoon:

```
<verkko> via <seuraajan-osoite> dev <liitäntä>
```

Esimerkiksi:

```
10.0.0.0/8 via 192.168.1.1 dev eth0
```

## Esimerkkikonfiguraatio

Kuvitellaan verkko, jossa on kolme laitetta:

```text
PC1 (10.0.1.2) — RouterA (10.0.1.1/24, 10.0.2.1/24) — RouterB (10.0.2.2/24, 172.16.1.1/24) — PC2 (172.16.1.5)
```

PC1:n täytyy päästä PC2:n verkkoon (`172.16.1.0/24`). Tässä tapauksessa RouterA ja RouterB tarvitsevat tiedon reittien:

### RouterA:n konfigurointi

```bash
ip route add 172.16.1.0/24 via 10.0.2.2 dev eth1
```

### RouterB:n konfigurointi

```bash
ip route add 10.0.1.0/24 via 10.0.2.1 dev eth0
```

## Oletusreitti (Default Route)

**Oletusreitti** (default route) ohjaa kaikki paketit, joita ei löydy reititystaulusta, johonkin määränpään. Se on erityisen hyödyllinen pienissä verkoissa, joissa kaikki ulkoliikenne lähetetään yhden reitittimen kautta.

### Esimerkkireitti

```bash
ip route add default via 192.168.1.1 dev eth0
```

Tämä tarkoittaa, että jos reititystaulussa ei löydy kohdetta, paketit lähetetään `192.168.1.1`-osoitteeseen liitännässä verkossa.

## Staattisen reitin etu- ja puantyt

| Etuna | Selitys |
|------|---------|
| Yksinkertainen | Ei tarvitse lisäohjelmistoja |
| Tarkka | Tarkka controlli reittien valintaan |
| Vakaa | Ei muutu riippumatta verkosta |

| Puantyt | Selitys |
|--------|---------|
| Manuaalinen | Jokainen reitti täytyy lisätä erikseen |
| Ei skaalautu | Suurissa verkoissa työtäliikenteinen |
| Ei automaattista | Ei reagoi verkossa tapahtuviin muutoksiin |

## Staattinen vs Dynaaminen – vertailu

| Ominaisuus | Staattinen | Dynaaminen |
|------------|-----------|-----------|
| Konfigurointi | Manuaalinen | Automaattinen |
| Skaalautuvuus | Pieni verkko | Suuri verkko |
| Virheenkäsittely | Ei automaattista | Kyllä |
| Resurssit | Vähän prosessoria | Lisäprosessoria ja muistia |

!!! info "Hyvä tapa"

    Monet konfiguroivat ensin staattisen oletusreitin, ja lisäävät dynaamisen protokollan (esim. OSPF) lisätäkseen tarkkuutta laajemmassa verkossa.

## Seuraavaksi

Seuraavaksi käsitellään [dynaaminen-reititys.md](dynaaminen-reititys.md), jossa nähdään miten reitit päivittyvät automaattisesti protokoloiden kautta.
