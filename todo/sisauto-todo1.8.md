# Tietoverkot – sisältöprosessi (versio 1.8)

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
8. Täydennä 05-laitteet -osio (6 sivua)
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

- [x] Tehtävä 1–5: Katso edelliset versiot
- [x] Tehtävä 6: Täydennä 03-ipv4 -osio. (Valmis – 1.6)
- [x] **Tehtävä 7: Täydennä 04-dhcp-routing -osio.** (Valmis – 1.7)
  - Kirjoitettu 6 sivua `docs/04-dhcp-routing/`-hakemistoon.
  - Sisältö: DHCP-protokolla (RFC 2131/9318, DORA-prosessi, DHCP-operaatiot, konfigurointiesimerkit), oletusyhdyskäytävä (default gateway, reititystaulun rooli, esimerkit), staattinen reititys (reitin rakenne, oletusreitti, Cisco/Linux-konfigurointi), reititystaulu (rakenne, esimerkit, valintalogiikka).
  - Lähde: IETF RFC:t (2131, 9318). Viitattu myös aikaisemmiin osioihin (03-ipv4, 07-reititys).
  - Huomioitavalta: korjattu MD033-ongelma (`!!` → `!!!` info-laatikossa).

## NYKYINEN TEHTÄVÄ

**Tehtävä 8:** Täydennä 05-laitteet -osio (index.md, kytkin.md, reititin.md, palomuuri.md, verkkokortti.md, kaapelointi.md).

**Status:** Ei vielä aloitettu. Jatketaan itsenäisesti.

## ONGELMAT JA AVOIMET ASIAT

- **M04 materiaalin URL palautti 404-virheen.** Materiaalin käytöstä on rajoitetusti käytetty. Sisältö perustuu RFC:iden ja aiemmilla osioilla johdonmukaan.
- **MD013/MD046/MD060-varoitukset** hyväksytty projektipolitiikan mukaan.
- **MD033** – varmistettu että kaikki admonition-rakenteet käyttävät `!!!` (ei `!!`).

## MITÄ TULLU TEHTYÄ NYKYISTÄ VERSIOSTA

**Tehtävä 7 (valmis):**
- Luonti 6 tiedostoa `docs/04-dhcp-routing/`-hakemistoon: index.md, dhcp.md, dhcp-prosessi.md, oletusyhdyskayta.md, staattinen-reititys.md, routing-table.md
- Kaikki tiedostot kirjoitettu suomeksi teknisinä termein
- Lähde: IETF RFC:t (2131, 9318). Viitattu myös 03-ipv4 ja 07-reititys -osioihin

## JATKOPROMPTI

1. Lue tämä tiedosto (sisauto-todo1.8.md) kokonaisuudessaan.
2. Vahvista että tämä on viimeisin versio `sisauto-todo*.md` todo/-kansiosta.
3. Hae M05 materiaali: https://tietoverkot.pages.labranet.jamk.fi/Materials/
4. Totea seuraava tehtävä: **8. Täydennä 05-laitteet -osio.**
5. Kirjoita kaikki 6 sivua:
   - docs/05-laitteet/index.md – Johdanto osioon
   - docs/05-laitteet/kytkin.md – Layer 2 -kytkin (switch), MAC-address table, store-and-forward
   - docs/05-laitteet/reititin.md – Router (Layer 3), reititys, NAT
   - docs/05-laitteet/palomuuri.md – Palomuuri (firewall), stateful vs stateless, NAT
   - docs/05-laitteet/verkkokortti.md – NIC, PHY, MAC-osoite, nopeudet
   - docs/05-laitteet/kaapelointi.md – UTP, STP, fiber, mediat ja niiden ominaisuudet
6. Kirjoita suomeksi, englanninkieliset termit suluissa.
7. Käytä !!! info -laatikoita. Ei emojeita. Ei kurssiaikatauluja tai harjoituksia.
8. Kun osio valmis, luo sisauto-todo1.9.md. Merkitse Tehtävä 8 valmiiksi.
9. Jatka itsenäisesti seuraavaan tehtävään ilman "jatka"-komentoa.
