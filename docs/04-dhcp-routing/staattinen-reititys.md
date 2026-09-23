# Staattinen reititys

**Staattinen reititys** on reitittimen konfiguuriointi, jossa reitit määritellään **käsin kirjoitetuina** eikä dynaamisesti oppitavina. Se on IANA:n ylläpitämä tapa ohjata paketteja eri verkkoihin – yksinkertainen, hallittava ja helposti ennustettavissa.

## Mikä staattinen reititys on?

Kun reititin reititystauluun lisätään rivi:

```text
ip route 10.0.1.0/24 192.168.1.2
```

Tämä tarkoittaa: "Jos kohtaat verkon `10.0.1.0/24`, lähetä paketit osoitteeseen `192.168.1.2`."

## Miksi staattinen reititys on käytössä?

| Hyöty | Selitys |
|-------|---------|
| **Hallinta** | Reitti on tarkka ja hallittu – ei yllä dynaamisia virheitä |
| **Turvallisuus** | Reitit eivät muutu itsestään – tunkeilu estetty |
| **Ressurssit** | Ei tarvitse lisäohjelmistoa (esim. OSPF) |
| **Nopeus** | Ei dynaamisen päivityksen viiveitä |

## Staattisen reitin rakenne

Jokaisella staattisellä reitill on kolme osaa:

| Osa | Esimerkki | Selitys |
|-----|-----------|---------|
| **Verkko** | 10.0.1.0/24 | Mihin verkkoon kyseessä on |
| **Maski** | /24 | Verkon koko |
| **Seuraaja (next-hop)** | 192.168.1.2 | Mille osoitteeseen paketti lähetetään |

!!! info "Seuraajan osoite"

    Seuraajan osoitteen täytyy olla **reitittimen suorassa yhteydessä olevan verkon** laitteisto. Esimerkiksi jos reititin omistaa verkosta `192.168.1.0/24`, seuraajan täytyy olla tässä verkossa.

## Esimerkkikonfigurointi (Cisco)

```text
! Lisää reitti
Router(config)# ip route 10.0.1.0 255.255.255.0 192.168.1.2

! Lisää oletusreitti (kaikki muu verkko)
Router(config)# ip route 0.0.0.0 0.0.0.0 192.168.1.254

! Näytä reititystaulu
Router# show ip route static
```

## Esimerkkikonfigurointi (Linux)

```bash
# Lisää reitti (esim. 10.0.1.0/24 → 192.168.1.2)
ip route add 10.0.1.0/24 via 192.168.1.2

# Lisää oletusreitti
ip route add default via 192.168.1.254

# Näytä kaikki reitit
ip route show
```

## Oletusreitti (default route)

Oletusreitti on **"kaikki muu" -reitti** – se ohjaa kaikki paketit, jotka eivät ole muihin tunnetuissa reiteissä:

```text
ip route 0.0.0.0/0 192.168.1.254
```

Tämä tarkoittaa: "Jos verkkoa ei ole mistään muusta reitistä, lähetä se tähän."

## Staattisen reitin etumat

| Hyöty | Riski |
|-------|-------|
| Hallittu, ennustettavissa | Ei mukaudu muutoksiin |
| Ei resurssitavaraa | Virheellinen reitti voi kaataa yhteyden |
| Turvallinen | Vaatii manuaalisen päivityksen muutoksissa |

## Seuraavaksi

Kun olet ymmärtänyt staattisen reitin, näet [routing-table.md](routing-table.md), jossa tarkastellaan reititystaulua yksityiskohtaisemmin – siis sitä, miten reititin päättää kuljettaa paketit eri reiteillä.
