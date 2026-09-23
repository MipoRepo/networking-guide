# Content Review

## Tarkoitus

`content-review` on erikseen pyydettävä taito, jonka tarkoitus on arvioida olemassa olevan tietoverkkodokumentin sisällöllistä laatua ja kattavuutta.

Skillin tehtävä ei ole automaattisesti muuttaa dokumenttia.

Tarkastuksen perusteella voidaan myöhemmin tehdä muutoksia, mutta muutokset tehdään vasta käyttäjän nimenomaisen hyväksynnän jälkeen.

## Käyttö

Skill aktivoidaan vain, kun käyttäjä pyytää sisällön tarkastamista esimerkiksi seuraavilla tavoilla:

- tarkista dokumentin sisältö
- arvioi dokumentin kattavuus
- tee content review
- tarkista, mitä tästä puuttuu
- tarkista onko tämä riittävän kattava
- arvioi tämä dokumentti teknisen sisällön näkökulmasta

Skill ei käynnisty automaattisesti dokumentin luomisen tai muokkaamisen jälkeen.

## Perusperiaate

Ensimmäinen dokumenttiversio ei oletusarvoisesti ole täydellinen.

Tarkastuksessa erotetaan toisistaan:

1. tekninen oikeellisuus
2. sisällön kattavuus
3. ymmärrettävyys
4. aloittelijan näkökulma
5. esimerkkien riittävyys
6. rakenteellinen johdonmukaisuus
7. lähteiden riittävyys

Teknisesti oikea dokumentti voi silti olla sisällöllisesti liian suppea.

## Tarkastuksen kohde

Tarkasta ensisijaisesti käyttäjän pyytämä dokumentti.

Älä tarkasta koko projektia, ellei käyttäjä sitä erikseen pyydä.

Lue tarvittaessa vain sellaiset lähitiedostot, jotka ovat tarkastuksen kannalta välttämättömiä, esimerkiksi:

- dokumentin lähteet
- dokumentissa linkitetyt projektin omat dokumentit
- asiaan liittyvä sääntö tai skill
- tarvittava lähdemateriaali

Älä tee tarpeetonta koko projektin läpikäyntiä.

## 1. Tekninen oikeellisuus

Arvioi:

- ovatko väitteet teknisesti oikein
- ovatko käsitteet määritelty oikein
- käytetäänkö termejä oikein
- ovatko protokollien toimintaperiaatteet oikein
- ovatko esitetyt toimintavaiheet oikeassa järjestyksessä
- ovatko esimerkit teknisesti mahdollisia
- onko eri teknologioiden välinen suhde kuvattu oikein
- onko mukana vanhentunutta tai asiayhteydestä riippuvaa tietoa
- onko jokin väite liian yleistävä

Jos havaitset mahdollisen teknisen virheen, erottele:

- varmistettu virhe
- epäselvä kohta
- tarkistamista vaativa väite

Älä muuta sisältöä tarkastuksen aikana.

## 2. Sisällön kattavuus

Arvioi, kattaako dokumentti aiheen olennaiset osa-alueet.

Tarkastele vähintään:

- mitä asia tarkoittaa
- miksi sitä tarvitaan
- miten se toimii
- missä sitä käytetään
- mihin muihin teknologioihin se liittyy
- mitä ongelmaa se ratkaisee
- tyypilliset käyttötapaukset
- rajoitukset
- ongelmat ja riskit
- käytännön merkitys

Älä kuitenkaan vaadi jokaiseen dokumenttiin kaikkia kohtia väkisin.

Kattavuus arvioidaan dokumentin aiheen, laajuuden ja tarkoituksen perusteella.

## 3. Aloittelijan näkökulma

Arvioi, pystyykö tietoverkkojen perusteita opiskeleva lukija ymmärtämään dokumentin ilman tarpeetonta aikaisempaa tietoa.

Tarkista erityisesti:

- esitelläänkö keskeiset käsitteet ennen niiden käyttöä
- selitetäänkö uudet tekniset termit
- ovatko käsitteiden väliset suhteet ymmärrettäviä
- hypätäänkö liian nopeasti yksityiskohtiin
- puuttuuko jokin perustieto, jonka myöhempi selitys edellyttää
- onko abstrakti asia sidottu konkreettiseen tilanteeseen

Älä kuitenkaan yksinkertaista teknistä sisältöä tavalla, joka tekee siitä virheellistä.

## 4. Esimerkit

Arvioi, tarvitseeko dokumentti käytännön esimerkkejä.

Hyvä esimerkki voi olla esimerkiksi:

- pieni verkko
- IP-osoitteet
- paketin kulku
- komentoesimerkki
- konfiguraatioesimerkki
- palvelimen ja asiakkaan välinen tapahtumaketju
- ongelmatilanne ja sen ratkaisu
- taulukko
- ASCII- tai Mermaid-kaavio

Aloittelijalle suunnatun esimerkin tulee:

1. lähteä yksinkertaisesta tilanteesta
2. esitellä tarvittavat lähtötiedot
3. edetä vaiheittain
4. selittää mitä tapahtuu
5. yhdistää esimerkki teoriaan

Älä lisää esimerkkejä automaattisesti tarkastuksen aikana.

Raportoi, jos esimerkki puuttuu tai nykyinen esimerkki ei tue riittävästi asian ymmärtämistä.

## 5. Rakenne ja ymmärrettävyys

Arvioi:

- otsikkohierarkia
- asioiden looginen etenemisjärjestys
- kappaleiden pituus
- toisto
- käsitteiden esittelyjärjestys
- taulukoiden tarkoituksenmukaisuus
- kaavioiden tarpeellisuus
- koodiesimerkkien selkeys

Älä muuta rakennetta tarkastuksen aikana.

## 6. Lähteet

Arvioi, ovatko keskeiset tekniset väitteet riittävästi lähteistetty.

Suosi ensisijaisia ja arvostettuja lähteitä, kuten:

- IETF RFC:t
- IEEE
- Linuxin virallinen dokumentaatio
- verkkolaitteiden valmistajien virallinen dokumentaatio
- muut asian kannalta relevantit ensisijaiset tekniset lähteet

Älä lisää lähteitä vain lähteiden määrän kasvattamiseksi.

Jos lähde on vanhentunut, epätarkka tai ristiriidassa luotettavamman lähteen kanssa, ilmoita asiasta.

Älä keksi lähteitä.

## 7. Päällekkäisyys

Tarkasta, toistaako dokumentti tarpeettomasti muualla projektissa jo käsiteltyä sisältöä.

Jos toinen dokumentti sisältää asian perusteellisemmin, ehdota tarvittaessa:

- lyhyempää käsittelyä
- ristiviittausta
- sisällön siirtämistä oikeaan dokumenttiin

Älä kuitenkaan muuta muita dokumentteja tämän tarkastuksen aikana.

## Raportin muoto

Raportoi havainnot seuraavissa ryhmissä:

### Tekniset ongelmat

Listaa tekniset virheet, epäselvyydet tai tarkistamista vaativat väitteet.

### Puuttuva sisältö

Listaa olennaiset puutteet tärkeysjärjestyksessä.

### Aloittelijan näkökulma

Listaa kohdat, joissa lukijan on vaikea ymmärtää asiaa tai joissa taustatietoa puuttuu.

### Esimerkit

Arvioi nykyiset esimerkit ja ilmoita, jos tarvitaan konkreettisempi tai vaiheittaisempi esimerkki.

### Rakenne

Listaa merkittävät rakenteelliset ongelmat.

### Lähteet

Listaa puuttuvat, epäselvät tai tarkistamista vaativat lähteet.

### Hyvin toimivat kohdat

Kerro lyhyesti, mitkä dokumentin osat ovat jo riittävän hyviä eikä niitä tarvitse muuttaa.

## Priorisointi

Luokittele merkittävät havainnot:

- **Kriittinen** – tekninen virhe tai olennainen väärinkäsityksen riski
- **Tärkeä** – merkittävä sisältö- tai ymmärrettävyysaukko
- **Hyödyllinen** – parannus, joka tekee dokumentista selkeämmän tai kattavamman
- **Valinnainen** – pieni parannus ilman merkittävää vaikutusta

Älä käytä numeerista laatupistemäärää.

## Muutosten hyväksyntä

`content-review` ei saa muuttaa dokumenttia tarkastuksen aikana.

Tarkastuksen lopussa esitetään selkeästi:

- mitä pitäisi korjata
- miksi
- kuinka merkittävä asia on
- tarvittaessa ehdotus siitä, millainen sisältö puuttuvan asian voisi korvata

Varsinaiset muutokset tehdään vasta, kun käyttäjä antaa siihen nimenomaisen luvan.

Esimerkiksi:

> "Toteuta nämä muutokset."

tai

> "Hyväksyn tärkeät ja hyödylliset muutokset."

Jos käyttäjä hyväksyy vain osan ehdotuksista, toteuta vain hyväksytyt muutokset.

## Muutosten toteuttaminen hyväksynnän jälkeen

Kun käyttäjä hyväksyy muutokset:

1. käytä tarkastuksen havaintoja muutosten lähtökohtana
2. tarkista tarvittaessa lähteet
3. tee vain hyväksytyt muutokset
4. säilytä toimiva olemassa oleva sisältö
5. älä laajenna tehtävää hyväksytyn rajauksen ulkopuolelle
6. tarkista tekninen oikeellisuus muutosten jälkeen
7. tarkista Markdown- ja MkDocs-yhteensopivuus tarvittaessa

Jos muutos edellyttää myös muita tiedostoja, ilmoita siitä ennen niiden muuttamista, ellei käyttäjän hyväksyntä selvästi kata niitä.

## Suhde muihin skilleihin

`content-review` täydentää muita projektin taitoja.

### `networking-content`

Tuottaa tai muokkaa tietoverkkojen teknistä sisältöä.

### `technical-review`

Keskittyy tekniseen oikeellisuuteen ja teknisten väitteiden tarkistamiseen.

### `documentation-qa`

Tarkistaa dokumentaation teknisen toteutuksen, Markdownin, linkit, kuvat, rakenteen ja MkDocs-yhteensopivuuden.

### `content-review`

Keskittyy siihen, onko dokumentti sisällöllisesti riittävä, kattava ja ymmärrettävä.

Näitä taitoja voidaan käyttää peräkkäin, mutta `content-review` ei automaattisesti käynnistä muita taitoja.

## Tärkeä rajoitus

Älä tee tarkastuksesta automaattista laadunparannusprosessia.

Dokumentin valmistuminen, tallentaminen tai muu muokkaaminen ei saa itsessään käynnistää `content-review`-tarkastusta.

`content-review` suoritetaan vain käyttäjän erikseen pyytäessä.

Tarkastus ja muutosten toteuttaminen ovat kaksi eri vaihetta:

**Tarkasta → raportoi → käyttäjä hyväksyy → muuta.**