# Tietoverkot – sisältöprosessi (versio 4.0)

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
11. Täydennä 08-verkon-turvallikuus -osio (5 sivua)
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
- [x] Tehtävä 10: Täydennä 07-reititys -osio. (Valmis – 3.0)
- [x] **Tehtävä 11: Täydennä 08-verkon-turvallisuus -osio.** (Valmis – 4.0)
  - Kirjoitettu 5 sivua `docs/08-verkon-turvallisuus/`-hakemistoon:
    - `index.md` – Verkon tietoturvan johdanto, CIA-malli, turvallisuusarkkitehtuuri
    - `tietoturva-perusteet.md` – CIA-malli, uhka- ja hyökkäysvektorit, DMZ, segmentointi
    - `palomuuri.md` – Palomuuri, stateful/stateless, paketin suodatus, iptables & Cisco ACL
    - `ips.md` – IDS/IPS, signature- ja anomaly-pohjaiset järjestelmät, DPI (Snort-esimerkki)
    - `vpn.md` – IPsec (AH/ESP), IKEv2, SSL/TLS-VPN, site-to-site & remote access
  - Lähde: RFC 4301 (IPsec), RFC 8220 (IPsec Architecture), RFC 6066 (TLS SNI), RFC 2728 (IDS),
    NIST SP 800-94 (intrusion detection), NIST SP 800-92 (log management)
  - Huomioitavaa: MD060/MD040-varoitukset hyväksytty projektipolitiikan mukaan

## NYKYINEN TEHTÄVÄ

**Tehtävä 12:** Täydennä 09-ipv4-nat -osio (4 sivua: index.md, nat-perusteet.md, nat-tyypit.md, nat-konfigurointi.md).

**Status:** Ei vielä aloitettu. Jatketaan itsenäisesti.

## ONGELMAT JA AVOIMET ASIAT

- **M04/M05 materiaalin URL palautti 404-virheen.** Sisältö perustuu IETF RFC:ien ja aiemmilla osioilla johdonmukaan.
- **MD060/MD040-varoitukset** ovat hyväksyttyjä projektipolitiikan mukaan.
- **PATH-muutokset:** Windows Bash -ympäristössä polkujen kanssa ongelmia. Käytettävä absoluuttiset polut.

## MITÄ TULLU TEHTYÄ NYKYISTÄ VERSIOSTA

**Tehtävä 11 (valmis):**
- Luonti 5 tiedostoa `docs/08-verkon-turvallisuus/`-hakemistoon
- Kaikki tiedostot kirjoitettu suomeksi teknisinä termein (RFC 4301, RFC 8220, RFC 6066, NIST SP 800-94, IKEv2, IPsec, IDS/IPS, DPI, SSL/TLS)
- Linkit viittaavat seuraavaan osioon (09-ipv4-nat)

## JATKOPROMPTI

1. Lue tämä tiedosto (sisauto-todo4.0.md) kokonaan.
2. Vahvista että tämä on viimeisin versio `sisauto-todo*.md` todo/-kansiosta.
3. Totea seuraava tehtävä: **12. Täydennä 09-ipv4-nat -osio.**
4. Kirjoita kaikki 4 sivua:
   - docs/09-ipv4-nat/index.md – Johdanto NAT:iin
   - docs/09-ipv4-nat/nat-perusteet.md – NAT:n periaate, NAT-taulut
   - docs/09-ipv4-nat/nat-tyypit.md – Static, Dynamic, PAT (Port Address Translation)
   - docs/09-ipv4-nat/nat-konfigurointi.md – Esimerkkikonfiguraatiot (iptables, Cisco)
5. Kirjoita suomeksi, englanninkieliset termit suluissa.
6. Käytä !!! info -laatikoita silloin kun ne parantavat ymmärrystä. Ei emojeita. Ei kurssiaikatauluja tai harjoituksia.
7. Kun osio valmis, luo sisauto-todo5.0.md. Merkitse Tehtävä 12 valmiiksi.
8. Jatka itsenäisesti seuraavaan tehtävään.
