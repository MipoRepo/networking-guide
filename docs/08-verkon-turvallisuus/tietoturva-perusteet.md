# Tietoturva-perusteet

**Verkon tietoturva** (network security) on prosessi, joka suojaa verkkoa ja siihen kulkevaa liikennettä hyökkäyksiltä, tiedonvuotoilta ja muilta turvallisuusriskeilta. Tämä dokumentti perustuu ISO/IEC 27001 -kehikkoihin, **RFC 6194** (verkon hyödyntämisen käsitteistä) ja **RFC 7609** (IGAP-ohjauksen käsittelystä).

## Mitä tämä sivu käsittelee?

- **CIA-malli** – yksityisyys, luotettavuus ja saatavuus
- **Uhka ja hyökkäysvektorit** – verkon näkyvät ja näkemät riskit
- **Tietoturva-arkkitehtuuri** – vertaisverkot, DMZ ja segmentation

## CIA-malli (Confidentiality, Integrity, Availability)

| Käsite | Selitys | Esimerkki |
|--------|---------|-----------|
| **Confidentiality** | Vain oikeat henkilöt näkevät tiedot | Salattu yhteys |
| **Integrity** | Tiedot eivät muutu kulkueessaan | Päätepaketin tarkistus |
| **Availability** | Järjestelmä toimii oikeasti | Palvelun ylikuormitusongelma |

## Uhka- ja hyökkäysvektorit

| Tyyppi | Esimerkki | Selitys |
|--------|-----------|---------|
| **Passive attack** | Kuuntelu (sniffing) | Hyökkääjä kuuntelee liikennettä |
| **Active attack** | Päästymys virheelliseen tietoon | Hyökkääjä muuttaa tai poistaa tietoja |

!!! warning "Verkko hyödyntäminen"

    Jos hyökkääjä pääsee verkkoon, hän voi seurata kaikkea liikennettä. Tämä on erityisen vaarallista salaamattomissa yhteyksissä (esim. HTTP, FTP).

## Verkon turvallisuusarkkitehtuuri

### Vertaisverkot (Peer-to-Peer)

Verkossa, jossa jokainen osallistuja voi toimia myös palveluntarjoajana. Tämä vaatii erillistä suojauksia, koska:

| Vaatimus | Selitys |
|----------|---------|
| End-to-end-salaus | Jokainen yhteys salataan |
| Tunnistautuminen | Kukin osapuoli tunnistetaan |

### Demilitarisoitu vyöhyke (DMZ)

**DMZ** (Demilitarized Zone) on erillinen verkkoalue, jossa palvelimet ovat suojassa ulkoverkon edessä. Se on erityisen hyödyllinen palvelimille, jotka tarvitsevat ulkopuolisen pääsyn (esim. WWW-palvelimet).

```text
Internet —[Firewall]→ DMZ (WWW, Mail) —[Firewall]→ Internal Network
```

| Osio | Selitys |
|------|---------|
| Internet | Ulkoverkko |
| DMZ | Palvelimet julkisille käyttäjille |
| Internal | Yrityksen sisäverkko |

### Segmentit (Verkon segmentointi)

Verkon segmentointi rajoittaa sivuisuutta:

| Segmentti | Käyttö | Hyöty |
|-----------|--------|-------|
| VLANit | Eri osastot | Rajoittaa läpikäyntiä |
| Subnetit | Eri verkkotason | Helpottaa hallintaa |
| Firewall-säännöt | Käytettyjä oikeuksia | Rajoittaa käyttöä |

## Sääntely- ja standardoituskehikot

| Kehys | Kuvaus |
|--------|--------|
| **ISO/IEC 27001** | Tiedon turvallisuudelle yleiskuva |
| **NIST Cybersecurity Framework** | Yhdysvaltain kyber turvallisuus |
| **NIST SP 800-53** | Turvapereisten asetusten kattelu |

## Esimerkki: CIA-mallin soveltaminen

| Tilanne | CIA-elementti | Toimenpide |
|---------|----------------|------------|
| Tiedonvarcina | Confidentiality | Salaus (TLS/SSL) |
| Päivitysten tarkistus | Integrity | Päätepaketin tarkistus |
| Palvelun ylikuormitus | Availability | Kuormituksen tasa-arvoitus |

## Seuraavaksi

Seuraavaksi tarkastellaan [palomuuri.md](palomuuri.md), jossa käsitellään palomuiden toimintaa, statefull vs stateless -lähestymistä ja DMZ:n käyttöä.
