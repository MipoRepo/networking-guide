# Tietoverkot – sisältöprosessi (versio 7.0)

## TEHDYT TEHTÄVÄT

- [x] Tehtävä 1–5: Katso edelliset versiot (katso sisauto-todo1.5.md)
- [x] Tehtävä 6: Täydennä 03-ipv4 -osio. (Valmis – 1.6)
- [x] Tehtävä 7: Täydennä 04-dhcp-routing -osio. (Valmis – 1.7)
- [x] Tehtävä 8: Täydennä 05-laitdeet -osio. (Valmis – 1.8)
- [x] Tehtävä 9: Täydennä 06-spanning-tree -osio. (Valmis – 2.0)
- [x] Tehtävä 10: Täydennä 07-reititys -osio. (Valmis – 3.0)
- [x] Tehtävä 11: Täydennä 08-verkon-turvallikuus -osio. (Valmis – 4.0)
- [x] Tehtävä 12: Täydennä 09-ipv4-nat -osio. (Valmis – 5.0)
- [x] Tehtävä 13: Täydennä 10-tcp-udp-ssh-http -osio. (Valmis – 6.0)
- [x] **Tehtävä 14: Täydennä 11-palvelimet-ja-wlan -osio.** (Valmis – 7.0)
  - Kirjoitettu 5 sivua `docs/11-palvelimet-ja-wlan/`-hakemistoon:
    - `index.md` – Palvelimet, päätelaitteet ja WLAN -johdanto
    - `palvelimet.md` – Palvelintyypit: WWW, sähköposti, tietokanta, tiedostopalvelimet; VM vs Container
    - `paatelaitteet.md` – Päätelaitetyypit (PC, tabletti, älypuhelin, IoT), verkkoissa ottaminen (DHCP/ARP/DNS)
    - `wlan-access-point.md` – AP:n periaate, SSID, kanavat (2.4/5 GHz), voimakkuus
    - `wlan-salaus.md` – WEP, WPA, WPA2, WPA3 – salausmekaniikat (RC4, TKIP, AES/CCMP, SAE)
  - Lähde: IEEE 802.11 (WLAN), RFC 2616 (HTTP), IEEE 802.11i (WPA2/WPA3)
  - Huomioitavaa: MD060/MD046/MD040-varoitukset hyväksytty projektipolitiikan mukaan

## NYKYINEN TEHTÄVÄ

**Tehtävä 15:** Täydennä 12-dns -osio (5 sivua: index.md, dns-perusteet.md, kaynnistus.md, rekisteröityminen.md, dns-konfigurointi.md).

**Status:** Ei vielä aloitettu. Jatketaan itsenäisesti.

## ONGELMAT JA AVOIMET ASIAT

- **M04/M05 materiaalin URL palautti 404-virheen.** Sisältö perustuu IETF RFC:ien ja aiemmilla osioilla johdonmukaan.
- **MD060/MD040-varoitukset** ovat hyväksyttyjä projektipolitiikan mukaan.
- **PATH-muutokset:** Windows Bash -ympäristössä polkujen kanssa ongelmia. Käytettävä absoluuttiset polut.

## JATKOPROMPTI

1. Lue tämä tiedosto (sisauto-todo7.0.md) kokonaan.
2. Vahvista että tämä on viimeisin versio `sisauto-todo*.md` todo/-kansiosta.
3. Totea seuraava tehtävä: **15. Täydennä 12-dns -osio.**
4. Kirjoita kaikki 5 sivua:
   - docs/12-dns/index.md – Johdanto DNS:ään
   - docs/12-dns/dns-perusteet.md – DNS:n periaate, resurssitietueet (A, AAAA, MX, CNAME, NS, SOA)
   - docs/12-dns/kaynnistus.md – DNS-kyselyn prosessi (iteratiivinen vs rekursiivinen)
   - docs/12-dns/rekisteröityminen.md – DNS-rekisteröinti ja DNSSEC
   - docs/12-dns/dns-konfigurointi.md – Esimerkkikonfiguraatiot (BIND, Linux)
5. Kirjoita suomeksi, englanninkieliset termit suluissa.
6. Käytä !!! info -laatikoita silloin kun ne parantavat ymmärrystä. Ei emojeita. Ei kurssiaikatauluja tai harjoituksia.
7. Kun osio valmis, luo sisauto-todo8.0.md. Merkitse Tehtävä 15 valmiiksi.
8. Jatka itsenäisesti seuraavaan tehtävään.
