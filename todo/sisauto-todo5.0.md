# Tietoverkot – sisältöprosessi (versio 5.0)

## TEHDYT TEHTÄVÄT

- [x] Tehtävä 1–5: Katso edelliset versiot (katso sisauto-todo1.5.md)
- [x] Tehtävä 6: Täydennä 03-ipv4 -osio. (Valmis – 1.6)
- [x] Tehtävä 7: Täydennä 04-dhcp-routing -osio. (Valmis – 1.7)
- [x] Tehtävä 8: Täydennä 05-laitdeet -osio. (Valmis – 1.8)
- [x] Tehtävä 9: Täydennä 06-spanning-tree -osio. (Valmis – 2.0)
- [x] Tehtävä 10: Täydennä 07-reititys -osio. (Valmis – 3.0)
- [x] Tehtävä 11: Täydennä 08-verkon-turvallikuus -osio. (Valmis – 4.0)
- [x] **Tehtävä 12: Täydennä 09-ipv4-nat -osio.** (Valmis – 5.0)
  - Kirjoitettu 4 sivua `docs/09-ipv4-nat/`-hakemistoon:
    - `index.md` – NAT:n johdanto, periaate, RFC 3022 & RFC 4787
    - `nat-perusteet.md` – NAT-taulu, SNAT vs DNAT, istunto seuranta, esimerkkikonfiguuri (iptables)
    - `nat-tyypit.md` – Static NAT, Dynamic NAT, PAT – vertailu ja esimerkit
    - `nat-konfigurointi.md` – Linux (iptables), Cisco IOS, OpenBSD PF -esimerkit
  - Lähde: RFC 3022, RFC 4787, RFC 4631
  - Huomioitavaa: MD060/MD046/MD040-varoitukset hyväksytty projektipolitiikan mukaan

## NYKYINEN TEHTÄVÄ

**Tehtävä 13:** Täydennä 10-tcp-udp-ssh-http -osio (6 sivua: index.md, tcp.md, udp.md, ssh.md, http.md, tls.md).

**Status:** Ei vielä aloitettu. Jatketaan itsenäisesti.

## ONGELMAT JA AVOIMET ASIAT

- **M04/M05 materiaalin URL palautti 404-virheen.** Sisältö perustuu IETF RFC:ien ja aiemmilla osioilla johdonmukaan.
- **MD060/MD040-varoitukset** ovat hyväksyttyjä projektipolitiikan mukaan.
- **PATH-muutokset:** Windows Bash -ympäristössä polkujen kanssa ongelmia. Käytettävä absoluuttiset polut.

## JATKOPROMPTI

1. Lue tämä tiedosto (sisauto-todo5.0.md) kokonaan.
2. Vahvista että tämä on viimeisin versio `sisauto-todo*.md` todo/-kansiosta.
3. Totea seuraava tehtävä: **13. Täydennä 10-tcp-udp-ssh-http -osio.**
4. Kirjoita kaikki 6 sivua:
   - docs/10-tcp-udp-ssh-http/index.md – Johdanto Transport- ja sovelluskerroksiin
   - docs/10-tcp-udp-ssh-http/tcp.md – TCP-yhteys, kolme-tason käsi, ohjennus
   - docs/10-tcp-udp-ssh-http/udp.md – UDP-ohjennus, virtamet, käyttö
   - docs/10-tcp-udp-ssh-http/ssh.md – SSH-protokolla, salaus, jahtely (SSH-1 vs SSH-2)
   - docs/10-tcp-udp-ssh-http/http.md – HTTP/1.1, HTTP/2, pyyntö/vastaus
   - docs/10-tcp-udp-ssh-http/tls.md – TLS 1.3, salaus, varmenteet
5. Kirjoita suomeksi, englanninkieliset termit suluissa.
6. Käytä !!! info -laatikoita silloin kun ne parantavat ymmärrystä. Ei emojeita. Ei kurssiaikatauluja tai harjoituksia.
7. Kun osio valmis, luo sisauto-todo6.0.md. Merkitse Tehtävä 13 valmiiksi.
8. Jatka itsenäisesti seuraavaan tehtävään.
