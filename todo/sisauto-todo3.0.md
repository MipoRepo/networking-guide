# Tietoverkot – sisältöprosessi (versio 3.0)

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
- [x] Tehtävä 8: Täydennä 05-laitdeet -osio. (Valmis – 1.8)
- [x] Tehtävä 9: Täydennä 06-spanning-tree -osio. (Valmis – 2.0)
- [x] **Tehtävä 10: Täydennä 07-reititys -osio.** (Valmis – 3.0)
  - Kirjoitettu 5 sivua `docs/07-reititys/`-hakemistoon:
    - `index.md` – IPv4-reitin johdanto, reititysprotokollat, protokollien vertailu
    - `routing.md` – Reititystaulu, CIDR, Longest Prefix Match, esimerkkireititys
    - `staattinen-reititys.md` – Staattisen reitin muoto, esimerkkikonfiguraatio, oletusreitti
    - `dynaaminen-reititys.md` – RIP, OSPF, BGP – lyhyt yleiskuva + esimerkit
    - `ospf.md` – OSPF-kehysvaiheet, area-tyyppit, Dijkstra SPF -algoritmi, kustannus
  - Lähde: RFC 2453 (RIP), RFC 2328 (OSPF), RFC 4271 (BGP), RFC 1812 (IPv4-reititys)
  - Huomioitavaa: MD060/MD046/MD040-varoitukset hyväksytty projektipolitiikan mukaan

## NYKYINEN TEHTÄVÄ

**Tehtävä 11:** Täydennä 08-verkon-turvallisuus -osio (5 sivua: index.md, tietoturva-perusteet.md, palomuuri.md, ips.md, vpn.md).

**Status:** Ei vielä aloitettu. Jatketaan itsenäisesti.

## ONGELMAT JA AVOIMET ASIAT

- **M04/M05 materiaalin URL palautti 404-virheen.** Sisältö perustuu IETF RFC:ien ja aiemmilla osioilla johdonmukaan.
- **MD060/MD046/MD040-varoitukset** ovat hyväksyttyjä projektipolitiikan mukaan.
- **PATH-muutokset:** Windows Bash -ympäristössä polkujen kanssa ongelmia. Käytettävä absoluuttiset polut.

## MITÄ TULLU TEHTYÄ NYKYISTÄ VERSIOSTA

**Tehtävä 10 (valmis):**
- Luonti 5 tiedostoa `docs/07-reititys/`-hakemistoon
- Kaikki tiedostot kirjoitettu suomeksi teknisinä termein (RFC 2453, RFC 2328, RFC 4271, RFC 1812, OSPF, RIP, BGP, SPF, Dijkstra)
- Linkit viitaten seuraavan osion (08-verkon-turvallisuus)

## JATKOPROMPTI

1. Lue tämä tiedosto (sisauto-todo3.0.md) kokonaan.
2. Vahvista että tämä on viimeisin versio `sisauto-todo*.md` todo/-kansiosta.
3. Totea seuraava tehtävä: **11. Täydennä 08-verkon-turvallisuus -osio.**
4. Kirjoita kaikki 5 sivua:
   - docs/08-verkon-turvallisuus/index.md – Johdanto verkon tietoturvaan
   - docs/08-verkon-turvallisuus/tietoturva-perusteet.md – CIA-malli, uhka- ja vastoiteltavakohteet
   - docs/08-verkon-turvallisuus/palomuuri.md – Palomuuri (firewall), stateful/stateless, DMZs
   - docs/08-verkon-turvallisuus/ips.md – Intrusiohawkistus (IDS/IPS), signature- ja anomaly-pohjaiset järjestelmät
   - docs/08-verkon-turvallisuus/vpn.md – Virtuaalitietoverkot (VPN), IPsec, SSL/TLS
5. Kirjoita suomeksi, englanninkieliset termit suluissa.
6. Käytä !!! info -laatikoita silloin kun ne parantavat ymmärrystä. Ei emojeita. Ei kurssiaikatauluja tai harjoituksia.
7. Kun osio valmis, luo sisauto-todo4.0.md. Merkitse Tehtävä 11 valmiiksi.
8. Jatka itsenäisesti seuraavaan tehtävään.
