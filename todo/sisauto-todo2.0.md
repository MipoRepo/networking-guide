# Tietoverkot – sisältöprosessi (versio 2.0)

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
- [x] **Tehtävä 9: Täydennä 06-spanning-tree -osio.** (Valmis – 2.0)
  - Kirjoitettu 4 sivua `docs/06-spanning-tree/`-hakemistoon:
    - `index.md` – Spanning Tree -johdanto, verkkosilmukat, STP:n perusteet
    - `verkkosilmukat.md` – Verkkosilmukat (loops) ja niiden ongelmat (broadcast-stöö, MAC-taulun sekaantuminen, frame-duplikaatit)
    - `stp.md` – Spanning Tree Protocol (STP, IEEE 802.1D): 5 vaihetta, BPDU, Root Bridge -valinta, porttityypit
    - `rstp.md` – Rapid Spanning Tree Protocol (RSTP, IEEE 802.1W): nopeampi siirtyminen, porttitilat, porttityypit, Proposal/Agreement-mekanismi
  - Lähde: IEEE 802.1D (STP), IEEE 802.1W (RSTP)
  - Huomioitavaa: MD060/MD013/MD046-varoitukset hyväksytty projektipolitiikan mukaan

## NYKYINEN TEHTÄVÄ

**Tehtävä 10:** Täydennä 07-reititys -osio (index.md, routing.md, staattinen-reititys.md, dynaaminen-reititys.md, ospf.md).

**Status:** Ei vielä aloitettu. Jatketaan itsenäisesti.

## ONGELMAT JA AVOIMET ASIAT

- **M04/M05 materiaalin URL palautti 404-virheen.** Sisältö perustuu IEEE-standardeihin ja aiemmilla osioilla johdonmukaan.
- **MD060/MD013/MD046-varoitukset** ovat hyväksyttyjä projektipolitiikan mukaan.
- **PATH-muutokset:** Windows Bash -ympäristössä polkujen kanssa ongelmia. Käytettävä absoluuttiset polut.

## MITÄ TULLU TEHTYÄ NYKYISTÄ VERSIOSTA

**Tehtävä 9 (valmis):**
- Luonti 4 tiedostoa `docs/06-spanning-tree/`-hakemistoon
- Kaikki tiedostot kirjoitettu suomeksi teknisinä termein (IEEE 802.1D, IEEE 802.1W, STP, RSTP, BPDU, Root Bridge)
- Kiinnitetty huomiota linkkien oikeellisuuteen (suhteelliset polut eri hakemistoihin)

## JATKOPROMPTI

1. Lue tämä tiedosto (sisauto-todo2.0.md) kokonaan.
2. Vahvista että tämä on viimeisin versio `sisauto-todo*.md` todo/-kansiosta.
3. Totea seuraava tehtävä: **10. Täydennä 07-reititys -osio.**
4. Kirjoita kaikki 5 sivua:
   - docs/07-reititys/index.md – Johdanto reititykseen
   - docs/07-reititys/routing.md – Reitityksen perusteet (routing table, CIDR)
   - docs/07-reititys/staattinen-reititys.md – Staattinen reititys
   - docs/07-reititys/dynaaminen-reititys.md – Dynaaminen reititys (RIP, OSPF, BGP – lyhyt johdanto)
   - docs/07-reititys/ospf.md – OSPF-protokolla yksityisesti
5. Kirjoita suomeksi, englanninkieliset termit suluissa.
6. Käytä !!! info -laatikoita silloin kun ne parantavat ymmärrystä. Ei emojeita. Ei kurssiaikatauluja tai harjoituksia.
7. Kun osio valmis, luo sisauto-todo3.0.md. Merkitse Tehtävä 10 valmiiksi.
8. Jatka itsenäisesti seuraavaan tehtävään.
