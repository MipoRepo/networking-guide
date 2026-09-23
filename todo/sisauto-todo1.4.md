# Tietoverkot – sisältöprosessi (versio 1.4)

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
  - Luodaan `docs/index.md`. Sisältää johdannon, 14 osion taulun, viite- ja verkkomallit, käyttöoppaan, lähdekohteet.
  - Markdown-lintkorjaukset: MD060 (taulut), MD037 (korostus), MD024 (päät). Vastaan otettu MD013 (rivipituus).
- [x] Tehtävä 4: Täydennä 01-johdatus -osio. (Valmis – 1.4)
  - Kaikki 5 sivua kirjoitettu: index.md, tietoverkko.md, verkon-komponentit.md, verkkotyypit.md, protokollat.md
  - Sisältö: verkon peruskäsitteet, digitaalinen tieto (bitti/tavu/binääri), tiedonsiirronopeudet, IANA/RIR-järjestöt, IETF/IEEE-standardit, ISP-tasot, IXP/PoP, verkkotyypit (PAN/LAN/CAN/MAN/WAN), verkko-media, siirtotavat, protokollistasoja, OSI- ja TCP/IP-mallit sekä niiden välinen suhde, RFC-viitteet.
  - Lähde: JAMK M01 + M02 materiaalit. Täydennetty IETF RFC:illä (791, 792, 793, 768, 826, 2460, 7540, 9114), IEEE-standardeilla (802.3, 802.11), ISO/IEC 7498-1:lla.
  - Lintitarkistus: kaikki 5 tiedostoa – ei MD060/MD037/MD024 virheitä. Vastaan otettu MD013 (rivipituus). Ei emojeita.
  - Korjaukset: ASCII-kaave, taulu-erottimet, päätöiden nimeäminen uniikoiksi, Unicode-ongelmat.

## NYKYINEN TEHTÄVÄ

**Tehtävä 5:** Täydennä 02-ethernet -osio (index.md, ethernet.md, mac-osoitteet.md, frame.md, switching.md, vlan.md, trunking.md).

**Status:** Ei vielä aloitettu. Odottaa "jatka"-komentoa.

## ONGELMAT JA AVOIMET ASIAT

- **M01-materiaali on käsitelty kokonaan.** Sisältää: OSI-malli, TCP/IP-malli, IANA/RIR, IETF/IEEE, ISP-tasot, digitaalinen tieto, verkkotyypit.
- **MD013 (rivipituus) on hyväksytty tyylinä.** Tämä on yleinen MkDocs-dokumentaatiomalli, jossa taulut ja tekniset yksiköt saattavat ylittää 80 merkin.
- **MD046 (koodilohkon tyyli)** saattaa ilmetä ASCII-kaaviotaessa. Käytetään `text`-koodikieltä, joka on MkDocs-yhteensopiva.
- **Unicode-merkit** (ä, ö, –) vaativat erityispuoltaisuuksia Edit-työkalun kanssa. Python-käsittely on luotettavampi kuin Edit-työkalu merkkien tarkkuuden osalta.
- **M02-materiaalin osalta on ladittu osittain.** Se on tarpeeksi yksityiskohtainen jatkokäsitettäväksi.

## MITÄ TULLU TEHTYÄ NYKYISEN VERSIOIN

**Tehtävä 4 (valmis):**
- Lueskellun JAMK M01 materiaalin (https://tietoverkot.pages.labranet.jamk.fi/Materials/M01%20Introduction%20to%20Data%20Networks/).
- Luonut 5 tiedostoa `docs/01-johdatus/`-kansioon.
- Korjannut kaikki lintivirheet (MD060, MD037, MD024) kaikissa tiedostoissa.
- Varmistanut emojeettomuuden kaikissa tiedostoissa.
- Täydennyt IETF RFC -viitteillä ja IEEE-standardeilla.

## JATKOPROMPTI

1. Lue tämä tiedosto (sisauto-todo1.4.md) kokonaisuudessaan.
2. Vahvista että tämä on viimeisin versio `sisauto-todo*.md` todo/-kansiosta.
3. Hae M02 materiaali: https://tietoverkot.pages.labranet.jamk.fi/Materials/M02%20Ethernet,%20Switching%20and%20VLANs/
4. Totea seuraava tehtävä: **5. Täydennä 02-ethernet -osio.**
5. Kirjoita kaikki 7 sivua:
   - docs/02-ethernet/index.md – Johdanto osioon
   - docs/02-ethernet/ethernet.md – Ethernetin perusteet, historiikki, nopeudet
   - docs/02-ethernet/mac-osoitteet.md – MAC-osoitteet, OUI, muotoilu
   - docs/02-ethernet/frame.md – Ethernet-kehys, kentät (preamble, SFD, dst/src MAC, EtherType, payload, FCS)
   - docs/02-ethernet/switching.md – Kytkimet, MAC-taulu, frame forwarding, collision domains
   - docs/02-ethernet/vlan.md – VLANit, 802.1Q taggaus
   - docs/02-ethernet/trunking.md – Trunkkaus, tagged vs untagged
6. Kirjoita suomeksi, englanninkieliset termit suluissa.
7. Käytä !!! info -laatikoita. Ei emojeja. Ei kurssiaikatauluja tai harjoituksia.
8. Kun osio valmis, luo sisauto-todo1.5.md. Merkitse Tehtävä 4 valmiiksi.
9. Älä siirry seuraavaan osioon ilman "jatka"-komentoa.
