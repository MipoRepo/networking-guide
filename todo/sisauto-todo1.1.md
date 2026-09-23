# Tietoverkot – sisältöprosessi (versio 1.1)

## ALKUPERÄINEN PROMPTI

( sisällytetty alkuperäisenä sellaisenaan – ks. sisauto-todo1.0.md )

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

- [x] Tehtävä 0 (asetelma): Projektin nykytilan tarkistus, todo/-hakemiston luonti, sisauto-todo1.0.md -tiedoston luonti, alkuperäisen promptin tallentaminen, alkuperäisen tehtävälistan luominen, prosessin tilan kirjaaminen. (Valmis)
- [x] Tehtävä 1: Etsi ja varmista JAMKin Tietoverkot -lähdemateriaalin URL sekä sen keskeiset osa-alueet. (Valmis)
  - Lähde-URL löydetty: `https://tietoverkot.pages.labranet.jamk.fi/`
  - Sivuston rakenne kartoitettu: 15 materiaalimodulia (M01–M15) ja 18 harjoitusta (E00–E18).
  - Materiaalit M01–M14 vastaavat suoraan dokumentaation 14 osiota.
  - M15 (koe) ja kaikki harjoitukset (E00–E18) jätetään dokumentaation ulkopuolelle (ei tekninen sisältö tietoverkkojen ymmärrykseen).
  - Englanninkielinen versio osoitteessa: `https://datanetworks.pages.labranet.jamk.fi` (varalla tarvittaessa).
  - progit.pdf materiaali/-kansiossa käsittelee Gitiä, ei ole keskeinen lähde verkkoissa. Jätetään sivuun.

## NYKYINEN TEHTÄVÄ

**Tehtävä 2:** Luo mkdocs.yml -konfiguraatio MkDocs Material -projektille (_nav_, teema-asetukset, sisäiset linkit).

**Status:** Ehdiässä. Eikä vielä aloitettu.

**Mitä on tehtävällä tarkoitettu:**
- Luoda `mkdocs.yml` juureen `tietoverkot/`-kansioon.
- Määritellä nav-elementti kaikilla 14 osiolle ja niiden alasivuilla.
- Määritellä MkDocs Material -teema ja sen perusasetukset (esim. otsikko, versio, kieli, hakukaihtavat).
- Varmistaa, että kaikki `docs/`-kansioon luodut sivut ovat mukana.

## MITÄ TULLU TEHTYÄ NYKYISEN VERSIOIN

**Tehtävä 1 (valmis):**
- Haettiin ja varmistettiin JAMKin Tietoverkot -lähdemateriaalin pää-URL.
- Sivuston täysi rakenne kartoitettu WebFetchillä: 15 materiaalimodulia (M01–M15) + 18 harjoitusta + FAQ + git-ohjeet.
- Vahvistettu, että materiaalit M01–M14 vastaavat täsmälleen dokumentaation 14 osiota.
- Kirjattu lähdelinkit ja rakenteellinen vastaavuus.

## ONGELMAT JA AVOIMET ASIAT

- **Lähde-URL nyt tiedossa:** `https://tietoverkot.pages.labranet.jamk.fi/` (pääsivu) ja materiaalit löytyvät `/Materials/M0X ...`-käynnistysreiteillä.
- **Englanninkielinen vaihtoehto käytettävissä:** `https://datanetworks.pages.labranet.jamk.fi` – voi olla hyödyllinen tarkistettaessa teknisiä termejä.
- **mkdocs.yml puuttuu vielä** – sen luominen on seuraava tehtävä.
- **Kaikki .md-tiedostot tyhjiä** – sisällön kirjoittaminen alkaa vasta Tehtävästä 3 (juorimaksikon) alkaen.
- **Progit.pdf ei ole relevantti** – Gitiä koskeva, jätetään sivuun.

## JATKOPROMPTI

1. Lue tämä tiedosto (sisauto-todo1.1.md) kokonaisuudessaan.
2. Vahvista, että tämä on viimeisin sisauto-todo*.md -versio todo/-kansiossa.
3. Totea seuraava tehtävä: **2. Luo mkdocs.yml -konfiguraatio MkDocs Material -projektille.**
4. Luo mkdocs.yml -tiedosto juureen tietoverkot/ kansioon:
   - Aseta otsikoksi "Tietoverkot – Tekniset verkkomateriaalit" (tai vastaava).
   - Määritä nav-elementti kaikille 14 osiolle ja niiden alasivuille.
   - Käytä MkDocs Material -teemaa.
   - Lisää perusasetukset: kieli (fi), versio, hakukaihaset, sisällysluettelo.
5. Kun mkdocs.yml on luotu, luo seuraava versio sisauto-todo1.2.md, jossa:
   - Merkitään Tehtävä 1 ja Tehtävä 2 tehdyiksi.
   - Päivitetään NYKYINEN TEHTÄVÄ kohteeseen "3. Kirjoita juorimaksikon".
   - Päivitetään JATKOPROMPTI seuraavaan tehtävään.
6. Älä siirry kolmannen tehtaan suorittamiseen ennen kuin käyttäjä on hyväksynyt tai jatkanut työtä.
