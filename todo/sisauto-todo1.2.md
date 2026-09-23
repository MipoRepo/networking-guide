# Tietoverkot – sisältöprosessi (versio 1.2)

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
  - Englanninkielinen versio: `https://datanetworks.pages.labranet.jamk.fi`
- [x] Tehtävä 2: Luo mkdocs.yml -konfiguraatio MkDocs Material -projektille. (Valmis – 1.2)
  - Luodaan juureen `tietoverkot/mkdocs.yml`.
  - Nav määritelty kaikille 14 osiolle + juorimaksikon.
  - Theme: material. Extra-asetukset: kieli (fi), ominaisuudet (navigation.tabs, search.suggest, jne.).
  - Plugins: search (separator, min_search_length, lang=fi).
  - Markdown-laajennukset: toc, admonition, attr_list, footnotes, md_in_html, pymdownx.highlight, pymdownx.superfences, pymdownx.inlinehilite, pymdownx.snippets, pymdownx.emoji.
  - YAML-validoitu onnistuneesti. Kaikki 77 nav-viitetta vastaavat oikeasti olemassaolevia tiedostoja. Ei puutteita eikä ylimääräisiä.
  - Emojeita ei sisälly tiedostoon.

## NYKYINEN TEHTÄVÄ

**Tehtävä 3:** Kirjoita juorimaksikon (docs/index.md) – projektin yleiskuva ja rakattisen esitys.

**Status:** Ei vielä aloitettu. Odottaa "jatka"-komentoa.

**Mitä on tehtävällä tarkoitettu:**
- Luoda `docs/index.md`, joka on MkDocs-materialin etusivu.
- Sivu on selkeä "liitettävä" dokumentaation kokonaisuudelle: mitä tämä on, kenelle, miksi.
- Sivu esittelee projektin rakenteen (14 osioa) ja paketin kokonaisuutena.
- Sivu ohjaa lukijan selaamaan sisältöjä järjestelmällisesti.
- Ei kurssin suoritusohjeita, ei aikatauluja, ei harjoitustehtäviä.
- Ei emojeja.

## ONGELMAT JA AVOIMET ASIAT

- **Lähde-URL vahvistettu:** `https://tietoverkot.pages.labranet.jamk.fi/` – materiaalit M01–M14 ovat päälähteenä.
- **mkdocs.yml luotu ja validoitu.** YAML on kelvollinen, nav viitteet tarkistettu.
- **Emojeita on kiellejä** dokumenteissa ja konfigissa. Tämä koskee myös `pymdownx.emoji`-laajennosta – se on määritelty konfigissa mutta sitä ei käytetä dokumenteissa. Tästä voidaan pohtia jäljempanäkin.
- **Progit.pdf ei ole relevantti.** Gitiä koskeva, jätetty sivuun.

## MITÄ TULLU TEHTYÄ NYKYISEN VERSIOIN

**Tehtävä 2 (valmis):**
- Haettiin MkDocs Material -dokumentaatio (squidfunk.github.io).
- Luotiin `mkdocs.yml` juureen `tietoverkot/`-kansioon.
- Nav-elementti määritelty kaikille 14 osiolle ja niiden alasivuille (77 viitettä).
- Määritetty: site_name, site_url, site_description, site_author.
- Määritetty: theme=material, extra.language=fi, feature-asetukset.
- Määritetty: plugins.search, markdown_extensions (toc, admonition, pymdownx, jne.).
- Validoitu: YAML-kelvoinen, kaikki nav-viitteet vastaavat tiedostoja.

## JATKOPROMPTI

1. Lue tämä tiedosto (sisauto-todo1.2.md) kokonaisuudessaan.
2. Vahvista, että tämä on viimeisin sisauto-todo*.md -versio todo/-kansiossa.
3. Totea seuraava tehtää: **3. Kirjoita juorimaksikon (docs/index.md).**
4. Avaa päälähteenä URL: https://tietoverkot.pages.labranet.jamk.fi/ (M01 Introduction to Data Networks).
5. Kirjoita `docs/index.md` MkDocs Material -yhteensopivaksi selkeäksi etusivuksi:
   - Lyhyt johdanto: mikä tämä dokumentaatio on, kenelle kohdistettu, mitä siinä kattaa.
   - Esita projektin rakenne (14 osioa lyhyinä kuvauksina).
   - Ohjaa lukijan alkuun: suosittele ensimmäiseksi luvuksi M01 vastaavan "Johdatus tietoverkkoihin".
   - Ei kurssiaikatauluja, suoritusohjeita, harjoituksia, videoita, tenttiohjeita.
   - Ei emojeja missään.
6. Kun index.md on kirjoitettu, luo seuraava versio sisauto-todo1.3.md.
7. Älä siirry kolmannen osion kirjoittamiseen ennen kuin käyttäjä on hyväksynyt tai jatkanut työtä.
