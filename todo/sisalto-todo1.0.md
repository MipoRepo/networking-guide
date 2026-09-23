# Tietoverkot – sisältöprosessi

## ALKUPERÄINEN PROMPTI

# Tietoverkot – teknisen tietopohjan rakentaminen MkDocs Material -projektiin

## ROOLI

Toimit itsenäisenä teknisinä dokumentoijan ja ohjelmistokehittäjänä.

Tehtävänäsi on rakentaa tästä projektista kattava, selkeä ja teknisesti luotettava **suomenkielinen tietoverkkojen tietopohja MkDocs Material -ympäristöön**.

Dokumentaation tarkoitus ei ole olla kurssimuistiinpano eikä kurssin suoritusohje, vaan itsenäinen tekninen tietokanta, josta tietoverkkojen keskeiset käsitteet, toimintaperiaatteet ja niiden väliset suhteet voi oppia ja kerrata.

---

# 1. LÄHDE

Käytä pääasiallisena lähteenä JAMKin Tietoverkot -materiaalia:

**JAMK Tietoverkot:**
sama lähdesivusto, joka on tämän tehtävän yhteydessä annettu.

Käy lähdemateriaali järjestelmällisesti läpi.

### Tärkeää

Poimi lähdemateriaalista vain **tekninen ja informatiivinen sisältö**.

ÄLÄ siirrä dokumentaatioon:

* kurssin aikatauluja
* kurssin suoritusohjeita
* tehtävänantoja
* harjoituksia
* tenttiohjeita
* arviointikriteerejä
* kurssin hallinnollisia ohjeita
* opiskelijoille suunnattuja käytännön järjestelyjä
* videoita tai videolinkkejä
* muuta sisältöä, jonka tarkoitus liittyy kurssin suorittamiseen eikä tietoverkkojen ymmärtämiseen.

**Videoita ei käytetä tässä projektissa.**

Lähdemateriaalia ei saa kopioida sellaisenaan. Kirjoita sisältö uudelleen selkeäksi tekniseksi dokumentaatioksi ja täydennä sitä tarvittaessa luotettavilla teknisillä lähteillä.

---

# 2. KIELI JA TERMINOLOGIA

Kirjoita dokumentaatio ensisijaisesti **suomeksi**.

Kun tekninen termi on vakiintunut englanniksi, esitä myös englanninkielinen termi.

Esimerkiksi:

* virtuaalinen lähiverkko (**Virtual LAN, VLAN**)
* MAC-osoite (**MAC address**)
* lähetysalue (**broadcast domain**)
* oletusyhdyskäytävä (**default gateway**)
* reititystaulu (**routing table**)

Älä kuitenkaan käännä teknisiä termejä väkisin huonolle suomelle.

Tavoitteena on, että lukija oppii samanaikaisesti:

1. mitä asia tarkoittaa suomeksi
2. mikä on sen englanninkielinen tekninen termi
3. miten käsite toimii käytännössä.

---

# 3. LISÄTIETOJA-LAATIKOT

Kun dokumentassa käsitellään tärkeää teknistä käsitettä, lisää tarvittaessa prose-osuuden loppuun erillinen MkDocs Material -infolaatikko.

Muoto:

!!! info "Lisätietoa: Virtual LAN (VLAN)"

```
VLAN eli Virtual LAN on...
```

Laatikon tarkoituksena on selittää kyseinen käsite vielä hieman syvällisemmin tai yhdistää se laajempaan kokonaisuuteen.

Älä lisää laatikoita mekaanisesti jokaiselle termille.

Käytä niitä silloin, kun niistä on lukijalle todellista hyötyä.

---

# 4. DOKUMENTAATION RAKENNE

Projektin juurihakemisto on:

`tietoverkot/`

Dokumentaation tulee olla suoraan:

`tietoverkot/docs/`

ÄLÄ luo rakennetta:

`tietoverkot/docs/tietoverkot/`

Tavoiteltu rakenne:

( tässä on täysi hakemistorakenne, jonka mukaan projekti on jo luonut kaikki kansiot ja tiedostot – ks. alla oleva osio )

Jos rakenne on jo olemassa, tarkista se ennen muutoksia.

Älä luo tarpeettomia rinnakkaisia hakemistorakenteita.

---

# 5. TEKNINEN SISÄLTÖ

Dokumentaation tulee kattaa vähintään seuraavat kokonaisuudet:

1. Johdatus tietoverkkoihin
2. Ethernet, kytkintä ja VLAN
3. IPv4-osoitteet, aliverkot ja ARP
4. DHCP ja staattinen reititys
5. Verkkolaitteet ja kaapelointi
6. Spanning Tree
7. IPv4-reititys
8. Verkon segmentointi ja palomuurit
9. IPv4 NAT
10. TCP, UDP, SSH ja HTTP
11. Palvelimet, päätelaitteet ja WLAN
12. DNS
13. IPv6
14. Border Gateway Protocol (BGP)

Kunkin kokonaisuuden tulee muodostaa looginen kokonaisuus.

Älä käsittele aiheita irrallisina sanastomerkintöinä.

Pyri selittämään:

* mikä asia on
* miksi sitä tarvitaan
* miten se toimii
* mihin muihin verkkoteknologioihin se liittyy
* millaisia ongelmia sillä ratkaistaan
* millaisia rajoituksia tai riskejä siihen liittyy
* miten se näkyy käytännön verkkoympäristössä.

---

# 6. TEKNINEN TÄSMÄLLISYYS

Jos alkuperäinen lähdemateriaali on liian suppea, vanhentunut tai epätarkka, täydennä tietoa luotettavista teknisistä lähteistä.

Suosi ensisijaisesti:

* IETF RFC -dokumentteja
* IEEE:n standardeja ja materiaalia
* Linuxin virallista dokumentaatiota
* verkkolaitteiden valmistajien virallista dokumentaatiota
* muita teknisesti arvostettuja ja ensisijaisia lähteitä.

Älä lisää tietoa vain sisällön määrän kasvattamiseksi.

Teknisen tiedon pitää olla:

* oikein
* johdonmukaista
* ymmärrettävää
* käytännöllistä
* nykyiseen verkkoteknologiaan sopivaa.

Jos lähdemateriaalin ja muun luotettavan teknisen lähteen välillä on ristiriita, selvää ristiriidan ennen sisällön kirjoittamista.

---

# 7. TODOLLA TÄRKEÄ PROSESSISÄÄNTÖ

Projektin juureen luodaan:

```text
todo/
```

Hakemisto toimii koko dokumentointiprosessin **tilanhallintana, tehtävälistana ja jatkuvuusmekanismina**.

Prosessin pitää olla sellainen, että työ voidaan keskeyttää milloin tahansa ja uusi Claude Code -istunto voi jatkaa työtä menettämättä projektin tilaa.

---

# 8. ENSIMMÄINEN TODO-TIEDOSTO

Luon:

```text
todo/sisalto-todo1.0.md
```

Tiedoston tulee sisältää seuraavat osiot tässä järjestyksessä:

( tässä on tarkempi rakenne – ks. alla oleva osio )

---

# 9. YKSI TEHTÄVÄ KERRALLAAN

Jokaisessa työvaiheessa:

1. Lue uusin `todo/sisalto-todo*.md`.
2. Lue se kokonaan.
3. Tarkista tehtävien tila.
4. Selvistä seuraava keskeneräinen tehtävä.
5. Suorita **ainoastaan tämä yksi tehtävä**.
6. Tarkista työn tulos.
7. Kirjaa tehtävä tehdyksi.
8. Kirjaa mitä todellisuudessa tehtiin.
9. Kirjaa mahdolliset ongelmat ja ratkaisemattomat asiat.
10. Päivitä `JATKOPROMPTI`.
11. Tallenna uusi todo-versio.

Älä siirry seuraavaan tehtävään samassa työvaiheessa.

---

# 10. TODO-VERSIOINTI

Ensimmäinen tiedosto: `sisalto-todo1.0.md`

Kun ensimmäinen tehtävä on valmis: `sisalto-todo1.1.md`
Kun toinen tehtävä on valmis: `sisauto-todo1.2.md`
seuraavaksi: `sisauto-todo1.3.md`, `sisauto-todo1.4.md`, `sisauto-todo1.5.md`...

Jokainen valmis tehtävä kasvattaa versionumeroa **0.1.**

### EHDOTON SÄÄNTÖ

Älä koskaan ylikirjoita aikaisempaa todo-versiota.

---

# 11. KESKEYTYKSEN JÄLKEEN

Jos työ käynnistyy uudessa Claude Code -istunnossa:

1. Tarkista `todo/`.
2. Etsi uusin `sisauto-todo*.md`.
3. Lue se kokonaan.
4. Selvitä viimeisin suoritettu tehtävä.
5. Lue `JATKOPROMPTI`.
6. Selvitä seuraava keskeneräinen tehtävä.
7. Jatka siitä.
8. Älä oleta tehtävää tehdyksi pelkästään siitä, että jokin tiedosto näyttää olevan olemassa.

---

# 12. ENSIMMÄISEN TYÖVAIHEEN RAJAUS

Ensimmäisessä työvaiheessa suoritetaan vain:

* projektin nykytilan tarkistus tarvittaessa
* `todo/`-hakemiston luonti
* `todo/sisauto-todo1.0.md`-tiedoston luonti
* alkuperäisen promptin tallentaminen
* alkuperäisen tehtävälistan luominen
* prosessin tilan kirjaaminen.

Älä aloita vielä tietoverkkojen sisältöjen kirjoittamista.

---

# 13. LAADUNVARMISTUS

Kun sisältötehtäviä suoritetaan, tarkista jokaisen kokonaisuuden yhteydessä vähintään:

* tekninen oikeellisuus
* terminologian johdonmukaisuus
* suomen kielen selkeys
* englanninkielisten termien oikeellisuus
* Markdown-syntaksi
* MkDocs Material -yhteensopivuus
* sisäiset linkit
* otsikkorakenne
* päällekkäisen sisällön välttäminen
* kokonaisuuden looginen eteneminen.

---

# 14. ÄLÄ TEE NÄITÄ

Älä:

* lisää kurssitehtäviä
* lisää kurssin suoritusohjeita
* lisää tenttiohjeita
* lisää videoita
* kopioi lähdemateriaalia sellaisenaan
* keksi teknisiä faktoja
* täytä sivuja turhalla tekstillä
* luo ylimääräisiä hakemistotasoja
* ohita todo-prosessia
* suorita useita tehtäviä yhdellä työvaiheella
* ylikirjoita vanhoja todo-versioita.

---

# 15. TAVOITE

Lopputuloksena on itsenäinen tietoverkkojen tekninen tietokanta, joka toimii:

* oppimateriaalina
* teknisenä hakuteoksena
* kertausmateriaalina
* ohjelmistokehittäjän ja DevOps-tekijän verkkoteknologioiden tietokantaan.
* MkDocs Material -portfolion teknisenä dokumentaationa.

---

# 16. KÄYNNISTÄ TYÖ

Aloita nyt kohdasta **12. ENSIMMÄISEN TYÖVAIHASEN RAJAUS**.

Suorita vain ensimmäinen tehtävä.

Kun se on valmis:

1. varmista tulos
2. luo `sisauto-todo1.1.md`
3. kirjaa tehdyt asiat
4. kirjaa mahdolliset ongelmat
5. päivitä `JATKOPROMPTI`
6. lopeta.

Älä aloita seuraavaa tehtävää ilman jatka-komennon kysymistä ja jatka käskyn käyttäjän antamalta.

---

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

- [ ] Ei vielä yhtään tehtävää suoritettu. Tämä on ensimmäinen työvaihe (setup).

## NYKYINEN TEHTÄVÄ

**Tehtävä 0 (asetelma):** Projektin nykytilan tarkistus, `todo/`-hakemiston luonti, `todo/sisauto-todo1.0.md`-tiedoston luonti, alkuperäisen promptin tallentaminen, alkuperäisen tehtävälistan luominen, prosessin tilan kirjaaminen.

**Status:** Suorittaa. Tämä tiedosto sinältää itseä.

**Mitä on tehtävällä tarkoitettu:**
- Tarkistaa projektin nykyinen tila (hakemistorakenne, tiedostot).
- Luoda `todo/`-hakemisto.
- Luoda `todo/sisauto-todo1.0.md` – tämä tiedosto, jossa alkuperäinen prompti ja tehtävälista on tallennettu sellaisinaan.
- Kirjata prosessin tila.

## ONGELMAT JA AVOIMET ASIAT

- **Lähde:** JAMKin Tietoverkot -kurssin tarkka URL ei ole tiedossa. Vaaditaan verkkohakemistosta tai täytyy hakea verkosta. Progit.pdf `materiaali/`-kansiossa käsittelee Gitiä, ei tietoverkoja.
- **mkdocs.yml puuttuu:** Projektissa ei ole MkDocs-konfiguraatiota. Sen luominen on erillinen tehtävä.
- **Kaikki .md-tiedostot tyhjiä:** Hakemistorakenne on olemassa, mutta kaikilla tiedostoilla on 0 riviä sisältöä. Kaikki sisällöt täytyy kirjoittaa alusta asti.
- **Projekti ei ole git-varastossa:** Kansio ei ole git-repository. Tämä ei vaikuta sisällöntuontiin, mutta git-sidonnaiset ominaisuudet ovat pois käytöstä.

## JATKOPROMPTI

Jatka työtä seuraavalla tavalla:

1. Lue tämä tiedosto (`todo/sisauto-todo1.0.md`) kokonaisuudessaan.
2. Vahvista, että tämä on viimeisin `sisauto-todo*.md` versio `todo/`-kansiossa.
3. Toteuta seuraava tehtävä listalta: **1. Etsi ja varmista JAMKin Tietoverkot -lähdemateriaalin URL sekä sen keskeiset osa-alueet.**
4. Kun tehtävä on valmis, luo uusi versio `todo/sisauto-todo1.1.md`, jossa:
   - Merkitsee tehtävä 0 tehdyksi kohdassa "TEHDYT TEHTÄVÄT".
   - Päivittää "NYKYINEN TEHTÄVÄ" kohteeseen "1. Etsi JAMKin lähde".
   - Kirjaa tehty työ ja löydetty URL "ONGELMAT JA AVOIMET ASIAT" -osiossa.
   - Päivittää "JATKOPROMPTI"–osion seuraavaan tehtävään (2. Luo mkdocs.yml).
5. Älä siirry seuraavaan tehtävään ennen kuin käyttäjä on hyväksynyt tai jatkanut työtä.
