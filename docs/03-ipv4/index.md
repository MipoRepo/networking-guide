# IPv4-osoitteet, aliverkot ja ARP

Tämä osio käsitkee IPv4-osoitteistusta, aliverkojen ja subnetointia sekä ARP-protokollaa – mekanismeja, jotka mahdollistavat datan nimennän kuljetuksen juuri niiihn ihmisten muoduttamilla verkoilla.

## Mitä tämä osio käsittelee?

| Sivu | Aihe | Keskeinen kysymys |
|------|------|-------------------|
| IPv4-protokolla | IPv4-paketin rakenne ja osoitteet | Miten verkkopaketti tietää, mihin koneeseen sen tulee? |
| IPv4-osoite | Osoitteen muodot ja luokat | Miten 32-bittisestä lukuarvosta muodostuu verkossa käytetty osoite? |
| Aliverkot | Verkon pilkottaminen pienempiin segmentteihin | Miksi yksi verkko jaetaan monen pienemmän aliverkon? |
| Subnetointi | Verkostaottelukäytäntö CIDR ja VLSM | Kuinka varataan tilaa tehokkaasti eri kokoisille verkoille? |
| ARP | Osoitteiden käännös MAC-osoitteeksi | Miten IP-osoite muunnetaan fyysisenä osoitteena? |
| Broadcast | Yle lähetyksen mekanismi | Miten pakettia lähetetään kaikille samassa verkossa oleville laitteille? |

## Miksi IPv4 on yhä olennainen?

IPv4 (Internet Protocol version 4) on IANA:n (Internet Assigned Numbers Authority) ylläpitämä protokolla, joka antaa jokaiselle verkon laitteelle yksiläisen osoitteen liikenneyhteyden aikana. Se määrittelee paketin rakenteen, jonka päätagit ovat:

- **Lähdeosoite** (source IP)
- **Kohdeosoite** (destination IP)
- **TTL** (Time To Live) – estää paketin kiertymästä ikuisesti
- **Protokolla** – kertoo, kuka käsittelee paketin (esim. TCP = 6, UDP = 17)

!!! info "RFC 791 – IPv4-protokolla"

    IPv4 määritellään tarkasti IETF:ssa **RFC 791** (1981). Tämä on lähtöisin ennen IPv6:ää, joka on korvannut sen nykyään mutta jota käytetään yhä laajasti.

## Kuinka asia liittyy Ethernetiin?

| Kerros | Protokolla | Vastuu |
|--------|-----------|--------|
| 2. (linkitys) | Ethernet, MAC | Paikallinen verkko, fyysinen osoite |
| 3. (verkko) | IPv4 | Reitittäminen eri verkkoihin |

IPv4 ajetaan Ethernetin päällä. Kun paketti lähetetään paikallisessa verkossa, ARP kääntää IPv4-osoitteen MAC-osoitteeksi – juuri kuin Ethernet-kehys vaatii kohdelle MAC-osoitteen.

## Seuraavaksi

Kun olet päivittänyt IPv4-perusteet, siirrytään [04-dhcp-routing](../04-dhcp-routing/index.md)-osioon, jossa käsitellään DHCP:ää osoitteiden automaattiseen jakamiseen ja staattista reititystä.
