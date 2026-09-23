# Tietoverkot – sisältöprosessi (versio 1.9)

## ALKUPERÄINEN PROMPTI

( alkuperäinen prompti säilytetään sellaisenaan – ks. sisauto-todo1.0.md )

## ALKUPERÄINEN TEHTÄVÄLISTA

1. Etsi ja varmista JAMKin Tietoverkot -lähdemateriaalin URL sekä sen keskeiset osa-alueet
2. Luo mkdocs.yml -konfiguraatio MkDocs Material -projektille
3. Kirjoita juorimaksikon (docs/index.md)
4. Täydennä 01-johdatus -osio (5 sivua)
5. Täydennä 02-ethernet -osio (7 sivua)
6. Täydennä 03-ipv4 -osio (7 sivua)
7. Täydennä 04-dhcp-routing -osio (6 sivua)
8. Täydennä 05-laitdeet -osio (6 sivua)
9. Täydennä 06-spanning-tree -osio (4 sivua)
10. Täydennä 07-reititys -osio (5 sivua)
11. Täydennä 08-verkon-turvallisuus -osio (5 sivua)
12. Täydennä 09-nat -osio (4 sivua)
13. Täydennä 10-tcp-udp -osio (6 sivua)
14. Täydennä 11-palvelimet-ja-wlan -osio (5 sivua)
15. Täydennä 12-dns -osio (5 sivua)
16. Täydennä 13-ipv6 -osio (5 sivua)
17. Täydennä 14-bgp -osio (5 sivua)
18. Laadunvarmistus ja lopullinen tarkistus koko dokumentaatiolle
19. Alusta ympäristö ja ota sivusto käyttöön (rakenneprompti.md)

## TEHDYT TEHTÄVÄT

- [x] Tehtävä 1–5: Katso edelliset versiot (katso sisauto-todo1.5.md)
- [x] Tehtävä 6: Täydennä 03-ipv4 -osio. (Valmis – 1.6)
- [x] Tehtävä 7: Täydennä 04-dhcp-routing -osio. (Valmis – 1.7)
- [x] **Tehtävä 8: Täydennä 05-laitdeet -osio.** (Valmis – 1.8)
  - Kirjoitettu 6 sivua `docs/05-laitdeet/`-hakemistoon:
    - `index.md` – Verkkolaitteiden ja kaapeloinnin yleiskuva
    - `kytkin.md` – Kytkin (switch), MAC-taulu, Flooding/Filtering/Forwarding, STP
    - `reititin.md` – Reititin (router), RFC 1812, reitityspäätös, NAT, konfigurointi
    - `palomuuri.md` – Palomuuri (firewall), stateful/stateless, DMZ, iptables-esimerkki
    - `verkkokortti.md` – NIC, IEEE 802.3, MAC-osoite, nopeudet, autonegoisointi
    - `kaapelointi.md` – Cat 5e/6/7, kuitu, TIA/EIA-568, Ethernet-standardit
  - Lähde: IEEE 802.3 (Ethernet), RFC 1812 (routerit), RFC 2131/9318 (DHCP), TIA/EIA-568 (kaapelointi)
  - Huomioitavaa: Korjattu hakemistonimi `05-laitdeet` → `05-laitdeet` sekä tiedostonimet `verkkokartti.md` → `verkkokartti.md`

## NYKYINEN TEHTÄVÄ

**Tehtävä 9:** Täydennä 06-spanning-tree -osio (index.md, verkkosilmukat.md, stp.md, rstp.md).

**Status:** Ei vielä aloitettu. Jatketaan itsenäisesti.

## ONGELMAT JA AVOIMET ASIAT

- **M04/M05 materiaalin URL palautti 404-virheen.** Sisältö perustuu RFC:iden ja aiemmilla osioilla johdonmukaan.
- **MD060/MD013/MD046-varoitukset** ovat hyväksyttyjä projektipolitiikan mukaan.
- **PATH-muutokset:** Windows Bash -ympäristössä polkujen kanssa ongelmia (esim. `docs/05-laitdeet/` vs oikea polku). Käytettävä absoluuttiset polut.

## MITÄ TULLU TEHTYÄ NYKYISTÄ VERSIOSTA

**Tehtävä 8 (valmis):**
- Luonti 6 tiedostoa `docs/05-laitdeet/`-hakemistoon oikeissa nimissä
- Kaikki tiedostot kirjoitettu suomeksi teknisinä termein (IEEE 802.3, RFC 1812, TIA/EIA-568, STP, NAT, NIC, MAC-osoite)
- Kiinnitetty huomiota linkkien oikeellisuuteen (suhteelliset polut eri hakemistoihin)

## JATKOPROMPTI

1. Lue tämä tiedosto (sisauto-todo1.9.md) kokonaisuudessään.
2. Vahvista että tämä on viimeisin versio `sisauto-todo*.md` todo/-kansiosta.
3. Hae M06 materiaali: https://tietoverkot.pages.labranet.jamk.fi/Materials/
4. Totea seuraava tehtävä: **9. Täydennä 06-spanning-tree -osio.**
5. Kirjoita kaikki 4 sivua:
   - docs/06-spanning-tree/index.md – Johdanto osioon
   - docs/06-spanning-tree/verkkosilmukat.md – Verkkosilmukat (loops) ja niiden ongelmat
   - docs/06-spanning-tree/stp.md – Spanning Tree Protocol (STP, IEEE 802.1D)
   - docs/06-spanning-tree/rstp.md – Rapid Spanning Tree Protocol (RSTP, IEEE 802.1W)
6. Kirjoita suomeksi, englanninkieliset termit suluissa.
7. Käytä !!! info -laatikoita. Ei emojeita. Ei kurssiaikatauluja tai harjoituksia.
8. Kun osio valmis, luo sisauto-todo2.0.md. Merkitse Tehtävä 9 valmiiksi.
9. Jatka itsenäisesti seuraavaan tehtävään.
