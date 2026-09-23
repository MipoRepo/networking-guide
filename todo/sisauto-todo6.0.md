# Tietoverkot – sisältöprosessi (versio 6.0)

## TEHDYT TEHTÄVÄT

- [x] Tehtävä 1–5: Katso edelliset versiot (katso sisauto-todo1.5.md)
- [x] Tehtävä 6: Täydennä 03-ipv4 -osio. (Valmis – 1.6)
- [x] Tehtävä 7: Täydennä 04-dhcp-routing -osio. (Valmis – 1.7)
- [x] Tehtävä 8: Täydennä 05-laitdeet -osio. (Valmis – 1.8)
- [x] Tehtävä 9: Täydennä 06-spanning-tree -osio. (Valmis – 2.0)
- [x] Tehtävä 10: Täydennä 07-reititys -osio. (Valmis – 3.0)
- [x] Tehtävä 11: Täydennä 08-verkon-turvallikuus -osio. (Valmis – 4.0)
- [x] Tehtävä 12: Täydennä 09-ipv4-nat -osio. (Valmis – 5.0)
- [x] **Tehtävä 13: Täydennä 10-tcp-udp-ssh-http -osio.** (Valmis – 6.0)
  - Kirjoitettu 6 sivua `docs/10-tcp-udp-ssh-http/`-hakemistoon:
    - `index.md` – Transport- ja sovelluskerrosten johdanto (TCP, UDP, SSH, HTTP, TLS)
    - `tcp.md` – TCP-headeri, kolme-tason käsi, tilat, ohjennus (flow control)
    - `udp.md` – UDP-headeri, TCP vs UDP -vertailu, käyttöesimerkit (DNS, VoIP, pelit)
    - `ssh.md` – SSH-1 vs SSH-2, tunnistautuminen (avain, salasana), salaus (AES, ChaCha20)
    - `http.md` – HTTP-pyyntö/vastaus, statuskoodit, HTTP/1.1 vs HTTP/2, headerit
    - `tls.md` – TLS 1.2 vs TLS 1.3, varmenteet, CA, key exchange (DHE/ECDHE)
  - Lähde: RFC 9293 (TCP), RFC 9290 (QUIC/UDP), RFC 4251 (SSH), RFC 9110 (HTTP), RFC 8446 (TLS 1.3)
  - Huomioitavaa: MD060/MD046/MD040-varoitukset hyväksytty projektipolitiikan mukaan

## NYKYINEN TEHTÄVÄ

**Tehtävä 14:** Täydennä 11-palvelimet-ja-wlan -osio (5 sivua: index.md, palvelimet.md, paatelaitteet.md, wlan-access-point.md, wlan-salaus.md).

**Status:** Ei vielä aloitettu. Jatketaan itsenäisesti.

## ONGELMAT JA AVOIMET ASIAT

- **M04/M05 materiaalin URL palautti 404-virheen.** Sisältö perustuu IETF RFC:ien ja aiemmilla osioilla johdonmukaan.
- **MD060/MD040-varoitukset** ovat hyväksyttyjä projektipolitiikan mukaan.
- **PATH-muutokset:** Windows Bash -ympäristössä polkujen kanssa ongelmia. Käytettävä absoluuttiset polut.

## JATKOPROMPTI

1. Lue tämä tiedosto (sisauto-todo6.0.md) kokonaan.
2. Vahvista että tämä on viimeisin versio `sisauto-todo*.md` todo/-kansiosta.
3. Totea seuraava tehtävä: **14. Täydennä 11-palvelimet-ja-wlan -osio.**
4. Kirjoita kaikki 5 sivua:
   - docs/11-palvelimet-ja-wlan/index.md – Johdanto palvelimiin ja WLANiin
   - docs/11-palvelimet-ja-wlan/palvelimet.md – Palvelintyypit (web, mail, tietokanta, tiedostPal), VM:t, containerit
   - docs/11-palvelimet-ja-wlan/paatelaitteet.md – Päätelaitteet (PC, läppäri, taulutietokoneet), ohjaimet
   - docs/11-palvelimet-ja-wlan/wlan-access-point.md – Access pointit, SSID, kanavat, voimakkuus
   - docs/11-palvelimet-ja-wlan/wlan-salaus.md – WEP, WPA2, WPA3 – salausmekaniikat
5. Kirjoita suomeksi, englanninkieliset termit suluissa.
6. Käytä !!! info -laatikoita silloin kun ne parantavat ymmärrystä. Ei emojeita. Ei kurssiaikatauluja tai harjoituksia.
7. Kun osio valmis, luo sisauto-todo7.0.md. Merkitse Tehtävä 14 valmiiksi.
8. Jatka itsenäisesti seuraavaan tehtävään.
