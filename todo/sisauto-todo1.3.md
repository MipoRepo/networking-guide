# Tietoverkot – sisältöprosessi (versio 1.3)

## ALKUPERÄINEN PROMPTI

( alkuperäinen prompti säilytetään sellaisenaan – ks. sisauto-todo1.0.md )

## ALKUPERÄINEN TEHTÄVÄLISTA

1. Etsi ja varmista JAMKin Tietoverkot -lähdemateriaalin URL sekä sen keskeiset osa-alueet
2. Luo mkdocs.yml -konfiguraatio MkDocs Material -projektille (_nav_, teema-asetukset, sisäiset linkit)
3. Kirjoita juorimaksikon (docs/index.md) – projektin yleiskuva ja rakenteen esitys
4. Täydennä 01-johdatus -osio (index.md, tietoverkko.md, verkon-komponentit.md, verkkotyypit.md, protokollat.md)
5. Täydennä 02-ethernet -osio (index.md, ethernet.md, mac-osoitteet.md, frame.md, switching.md, vlan.md, trunking.md)
6. Täydennä 03-ipv4 -osio (index.md, ipv4.md, ip-osoite.md, aliverkot.md, subnetointi.md, arp.md, broadcast.md)
7. Täydennä 04-dhcp-routing -osio (index.md, dhcp.md, dhcp-prosessi.md, oletusyhdyskayta.md, staattinen-reititys.md, routing-table.md)
8. Täydennä 05-laitteet -osio (index.md, kytkin.md, reititin.md, palomuuri.md, verkkokortti.md, kaapelointi.md)
9. Täydennä 06-spanning-tree -osio (index.md, verkkosilmukat.md, stp.md, rstp.md)
10. Täydennä 07-reititys -osio (index.md, routing.md, staattinen-reititys.md, dynaaminen-reititys.md, ospf.md)
11. Täydennä 08-verkon-turvallisuus -osio (index.md, segmentointi.md, palomuuri.md, liikenteen-suodatus.md, turvallinen-verkkorakenne.md)
12. Täydennä 09-nat -osio (index.md, nat.md, static-nat.md, dynamic-nat.md, pat.md)
13. Täydennä 10-tcp-udp -osio (index.md, tcp.md, udp.md, portit.md, ssh.md, http.md)
14. Täydennä 11-palvelimet-ja-wlan -osio (index.md, palvelimet.md, paatelaitteet.md, wlan.md, langaton-verkko.md)
15. Täydennä 12-dns -osio (index.md, dns.md, nimipalvelu.md, dns-hierarkia.md, dns-tietueet.md)
16. Täydennä 13-ipv6 -osio (index.md, ipv6.md, ipv6-osoitteet.md, osoitteistus.md, dual-stack.md)
17. Täydennä 14-bgp -osio (index.md, bgp.md, autonomous-system.md, internet-routing.md, reititys-internetissa.md)
18. Laadunvarmistus ja lopullinen tarkistus koko dokumentaatiolle

## TEHDYT TEHTÄVÄT

- [x] Tehtävä 0 (asetelma): Projektin nykytilan tarkistus, todo/-hakemiston luonti, sisauto-todo1.0.md, alkuperäisen promptin tallentaminen, tehtävälistan luominen. (Valmis – 1.0)
- [x] Tehtävä 1: Etsi ja varmista JAMKin Tietoverkot -lähdemateriaalin URL sekä sen keskeiset osa-alueet. (Valmis – 1.1)
  - Pää-URL: `https://tietoverkot.pages.labranet.jamk.fi/`
  - 15 materiaalimodia (M01–M15) + 18 harjoitusta (E00–E18) kartoitettu.
  - M01–M14 vastaavat dokumentaation 14 osiota. M15 (koe) jätetään ulkopuolelle.
- [x] Tehtävä 2: Luo mkdocs.yml -konfiguraatio MkDocs Material -projektille. (Valmis – 1.2)
  - `tietoverkot/mkdocs.yml` luoja. Nav 77 tiedostoa. YAML validoitu. Kaikki viitteet vastaavat tiedostoja.
- [x] Tehtävä 3: Kirjoita juorimaksikon (docs/index.md). (Valmis – 1.3)
  - Luodaan `docs/index.md` MkDocs Material -etussivuksi.
  - Sisältää: johdannon, 14 osion yhteenveto taulun, OSI- ja TCP/IP-viite- ja verkkomallit taulut, käyttöoppaan, lähdekohteiden taulun.
  - Korjattu markdown-lint-varoitukset (MD060 taulut, MD037 korostus).
  - Rivipituus-varoitukset (MD013) hyväksytty (tyylinä, ei virheitä).
  - Vahvistettu: emojeita ei tiedostossa.

## NYKYINEN TEHTÄVÄ

**Tehtävä 4:** Täydennä 01-johdatus -osio (index.md, tietoverkko.md, verkon-komponentit.md, verkkotyypit.md, protokollat.md).

**Status:** Ei vielä aloitettu. Odottaa "jatka"-komentoa.

**Mitä on tehtävällä tarkoitettu:**
- Täydentää osion 01 kaikki 5 sivua `docs/01-johdatus/`-kansiossa.
- Sisällettävä: verkon peruskäsitteet, verkotyypit, protokollat, OSI/TCP-IP-mallit, standardit, IANA/RIR-järjestelmä.
- Lähde: JAMK M01 materiaali + IEEE/IETF standardit + luotettatut tekniset lähdet.
- Ei kurssiaikatauluja, suoritusohjeita, harjoituksia, videoita, tenttivaatimuksia.
- Ei emojeja missään.

## ONGELMAT JA AVOIMET ASIAT

- **mkdocs.yml OK** – validoitu, kaikki nav-referenssit tarkistettu.
- **docs/index.md OK** – luotu ja lintattu (MD013 hyväksytty, MD060/MD037 korjattu).
- **Emojeita on kiellejä** dokumenteissa ja konfigissa - tyyliin. Ei emojeja missään dokumenteissa.
- **Käyttäjä ilmoitti:** Python-skriptit ja lint ovat nyt sallittu ilman erillistä lupaa.
- **progit.pdf ei ole relevantti** – Gitiä koskeva, jätetty sivuun.

## MITÄ TULLU TEHTYÄ NYKYISEN VERSIOIN

**Tehtävä 3 (valmis):**
- Lueskellut JAMK M01 materiaalin (https://tietoverkot.pages.labranet.jamk.fi/Materials/M01%20Introduction%20to%20Data%20Networks/).
- Lueskellut JAMK M02 materiaalin osaksi struktuuria.
- Luodaan `docs/index.md` – 159 riviä teknistä dokumentaatiota.
- Korjattu 3 markdown-lint-virhää (taulusehdot, korostus).
- Validoitu: YAML OK, emojeita ei. Linssit MD013 (rivipituus) hyväksytty tyylistenä.

## JATKOPROMPTI

1. Lue tämä tiedosto (sisauto-todo1.3.md) kokonaisuudessaan.
2. Vahvista että tämä on viimeisin version sisauto-todo*.md todo/-kansiossa.
3. Totea seuraava tehtävä: **4. Täydennä 01-johdatus -osio.**
4. Avaa lähteenä: https://tietoverkot.pages.labranet.jamk.fi/Materials/M01%20Introduction%20to%20Data%20Networks/
5. Täydennä kaikki 5 sivua:
   - docs/01-johdatus/index.md – Johdanto osioon
   - docs/01-johdatus/tietoverkko.md – Mitä on tietoverkko
   - docs/01-johdatus/verkon-komponentit.md – Verkon komponentit
   - docs/01-johdatus/verkkotyypit.md – Verkkotyypit (PAN, LAN, MAN, WAN)
   - docs/01-johdatus/protokollat.md – Protokollat ja viitekehyt (OSI, TCP/IP)
6. Kirjoita sisältö suomeksi, teknisinä käsitteinä, englanninkieliset termit suluissa.
7. Käytä !!! info -laatikoita tärkeille käsitteille.
8. Varmista: ei kurssiaikatauluja, ei harjoituksia, ei videoita, ei emojeja.
9. Kun osio on valmis, luo sisauto-todo1.4.md merkitsemällä Tehtävä 3 valmiiksi.
10. Älä siirry seuraavaan osioon ennen kuin käyttäjä on ilmoittanut "jatka".
