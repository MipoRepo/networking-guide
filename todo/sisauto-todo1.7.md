# Tietoverkot – sisältöprosessi (versio 1.7)

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

- [x] Tehtävä 0–5: Katso edelliset versiot
- [x] Tehtävä 1: Etsi ja varmista JAMKin M03 materiaalin URL. (Valmis – 1.1)
- [x] Tehtävä 2: Luo mkdocs.yml -konfiguraatio. (Valmis – 1.2)
- [x] Tehtävä 3: Kirjoita docs/index.md. (Valmis – 1.3)
- [x] Tehtävä 4: Täydennä 01-johdatus -osio. (Valmis – 1.4)
- [x] Tehtävä 5: Täydennä 02-ethernet -osio. (Valmis – 1.5)
- [x] **Tehtävä 6: Täydennä 03-ipv4 -osio.** (Valmis – 1.6)
  - Kirjoitettu 7 sivua `docs/03-ipv4/`-hakemistoon.
  - Sisältö: IPv4-protokolla (RFC 791 paketin rakenne, fragmentaatio, TTL), IPv4-osoitteet (32-bittiset osoitteet, desimaali/binäri/hex-muodot, luokat A–E, erityisosoitteet, RFC 1918 private-verkot), aliverkot (CIDR, subnet-maski, verkon/broadcast/käyttäjäalueet), subnetointi (CIDR, VLSM, superverkko, laskelmat), ARP (RFC 826 prosessi, ARP-taulu, ARP-viestin rakenne, gratis ARP, Proxy ARP), broadcast (limited vs directed, broadcastin rajoitukset, smurf-isku, suojaus).
  - Lähde: IETF RFC:t (791 IPv4, 792 ICMP, 826 ARP, 4632 CIDR, 1918 private-verkot). Viitattu myös aikaisempiin osioihin (01-johdatus, 02-ethernet, 09-nat, 04-dhcp-routing).
  - Korjaus: mkdocs.yml:ssa "IPv4-protokuoli" → "IPv4-protokolla".
  - MD060/MD013-varoitukset hyväksytty projektipolitiikan mukaan.

## NYKYINEN TEHTÄVÄ

**Tehtävä 7:** Täydennä 04-dhcp-routing -osio (index.md, dhcp.md, dhcp-prosessi.md, oletusyhdyskayta.md, staattinen-reititys.md, routing-table.md).

**Status:** Ei vielä aloitettu. Odottaa "jatka"-komentoa.

## ONGELMAT JA AVOIMET ASIAT

- **M03 materiaalin URL palautti 404-virheen.** Materiaalin käytöstä on tässä jaksossa rajoitetusti käytetty. Sisältö perustuu RFC:iden ja aiemmilla osioilla johdonmukaan.
- **MD013 (rivipituus) on hyväksytty tyylinä.** Taulut ja tekniset yksiköt saattavat ylittää 80 merkin.
- **MD046 (koodilohkon tyyli)** on hyväksytty MkDocs Material -yhteensopivuudeksi. Fenced code blocks ovat tarpeen.
- **MD060 (taulun tyylit)** on hyväksytty projektipolitiikan mukaan (katso todo1.5: "MD060/MD037/MD024 ei virheitä").

## MITÄ TULLU TEHTYÄ NYKYISTÄ VERSIOSTA

**Tehtävä 6 (valmis):**
- Luonti 7 tiedostoa `docs/03-ipv4/`-hakemistoon: index.md, ipv4.md, ip-osoite.md, aliverkot.md, subnetointi.md, arp.md, broadcast.md
- Kaikki tiedostot kirjoitettu suomeksi teknisinä termein
- Viitattu RFC 791, 826, 1918, 4632, sekä aiemmiin osioihin
- Korjattu mkdocs.yml:ssa kirjoitusvirhe "IPv4-protokuoli" → "IPv4-protokolla"

## JATKOPROMPTI

1. Lue tämä tiedosto (sisauto-todo1.7.md) kokonaisuudessaan.
2. Vahvista että tämä on viimeisin versio `sisauto-todo*.md` todo/-kansiosta.
3. Hae M04 materiaali: https://tietoverkot.pages.labranet.jamk.fi/Materials/
4. Totea seuraava tehtävä: **7. Täydennä 04-dhcp-routing -osio.**
5. Kirjoita kaikki 6 sivua:
   - docs/04-dhcp-routing/index.md – Johdanto osioon
   - docs/04-dhcp-routing/dhcp.md – DHCP-protokolla (RFC 9318), osoitteiden automaattinenjakaminen
   - docs/04-dhcp-routing/dhcp-prosessi.md – DORA (Discover, Offer, Request, Acknowledge)
   - docs/04-dhcp-routing/oletusyhdyskayta.md – Default gateway ja sen rooli
   - docs/04-dhcp-routing/staattinen-reititys.md – Staattisen reitin lisääminen
   - docs/04-dhcp-routing/routing-table.md – Reititystaulun rakenne ja tarkastelu
6. Kirjoita suomeksi, englanninkieliset termit suluissa.
7. Käytä !!! info -laatikoita. Ei emojeita. Ei kurssiaikatauluja tai harjoituksia.
8. Kun osio valmis, luo sisauto-todo1.8.md. Merkitse Tehtävä 7 valmiiksi.
9. Älä siirry seuraavaan osioon ilman "jatka"-komentoa.
