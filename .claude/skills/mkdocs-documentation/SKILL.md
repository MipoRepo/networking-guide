---
name: mkdocs-documentation
description: Luo ja muokkaa MkDocs Material -dokumentaatiota projektin rakenteen, Markdown-käytäntöjen ja navigaation mukaisesti.
---

# MkDocs Documentation

## Tarkoitus

Tuota ja muokkaa projektin teknistä dokumentaatiota MkDocs Material -ympäristöön.

Dokumentaation tulee olla selkeää, teknisesti luotettavaa, johdonmukaista ja helposti navigoitavaa.

## Toimintaperiaate

1. Selvitä käyttäjän pyytämä dokumentaatiotehtävä.
2. Tunnista tarvittavat Markdown-tiedostot.
3. Lue vain tehtävän kannalta tarvittava olemassa oleva sisältö.
4. Noudata projektin nykyistä rakennetta.
5. Kirjoita tai muokkaa sisältöä Markdown-muodossa.
6. Käytä MkDocs Materialin ominaisuuksia vain silloin, kun ne parantavat dokumentaatiota.
7. Tarkista muuttunut sisältö.
8. Älä tee asiaan liittymättömiä muutoksia.

## Dokumentaation rakenne

Dokumentaatio sijaitsee `docs/`-hakemistossa.

Älä luo uutta rinnakkaista dokumentaatiorakennetta ilman käyttäjän pyyntöä.

Säilytä olemassa oleva:

- hakemistorakenne
- tiedostonimet
- otsikkorakenne
- navigaatiorakenne
- sisäiset linkit

## Sisällön kirjoittaminen

Kirjoita ensisijaisesti suomeksi.

Käytä vakiintunutta englanninkielistä teknistä termiä tarvittaessa suomenkielisen termin rinnalla.

Hyvä tekninen dokumentaatio vastaa mahdollisuuksien mukaan seuraaviin kysymyksiin:

- Mitä tämä on?
- Miksi sitä tarvitaan?
- Miten se toimii?
- Mihin sitä käytetään?
- Miten se liittyy muihin teknologioihin?
- Mitkä ovat tärkeimmät rajoitukset tai riskit?

Älä täytä dokumentaatiota tarpeettomalla tekstillä.

## Lähdemateriaalin käsittely

Älä kopioi lähdemateriaalia sellaisenaan.

Muodosta lähdemateriaalin perusteella itsenäinen tekninen kuvaus.

Jos lähdemateriaali sisältää:

- kurssiaikatauluja
- tehtävänantoja
- harjoituksia
- tenttejä
- arviointia
- suoritusohjeita
- hallinnollisia ohjeita
- videoita tai videolinkkejä

älä siirrä niitä tekniseen dokumentaatioon.

Jos lähdemateriaalin tekninen tieto vaikuttaa puutteelliselta tai vanhentuneelta, tarkista asia luotettavista teknisistä lähteistä.

## Otsikkorakenne

Käytä loogista hierarkiaa:

```markdown
# Pääotsikko

## Alaotsikko

### Alakohta
## Otsikot

Älä käytä otsikkotasoja vain tekstin visuaaliseen korostamiseen.

Pidä otsikot kuvaavina ja yhdenmukaisina muun dokumentaation kanssa.

## Koodilohkot

Markdown-tiedostossa jokainen avattu koodilohko merkinnällä ` ``` ` on aina suljettava vastaavalla ` ``` `-merkinnällä.

Koodilohkoa ei saa koskaan jättää avoimeksi.

Jos koodilohkolle voidaan määrittää kieli, käytä kielimääritystä.

Tarkista aina Markdown-muutoksen jälkeen, että kaikki avatut koodilohkot on suljettu.

## MkDocs Material -ominaisuudet

Käytä MkDocs Materialin ominaisuuksia tarkoituksenmukaisesti.

Esimerkiksi admonition-laatikkoa voidaan käyttää lisätiedon, varoituksen tai muun olennaisen huomion korostamiseen.

Admonition-laatikoita ei saa käyttää mekaanisesti.

Käytä niitä vain, kun sisältö aidosti hyötyy erillisestä huomautuksesta, lisätiedosta, varoituksesta tai muusta korostuksesta.

## Linkit

Käytä Markdown-linkkejä sisäisiin dokumentaatiosivuihin.

Tarkista suhteelliset polut ennen työn valmistumista.

Älä muuta toimivia linkkejä ilman syytä.

## Kuvat

Käytä Markdown-kuvia.

Kuvan alt-tekstin tulee kuvata kuvan sisältöä tai tarkoitusta.

Tarkista:

- tiedostopolku
- tiedoston olemassaolo
- Markdown-syntaksi
- kuvan tarkoituksenmukaisuus

Älä lisää kuvia vain koristeeksi.

## Navigaatio

Jos dokumentaatiossa tarvitaan navigaatiomuutos, muuta `mkdocs.yml`-tiedostoa.

Tee vain tarvittava muutos.

Älä järjestä muuta navigaatiota uudelleen.

Älä rakenna `mkdocs.yml`-tiedostoa uudelleen.

Jos tehtävä koskee vain Markdown-sisältöä, älä muuta `mkdocs.yml`-tiedostoa.

## Kontekstin hallinta

Käytä tehtävän kannalta pienintä tarvittavaa kontekstia.

Pienen muutoksen yhteydessä:

- älä lue koko `docs/`-hakemistoa
- älä lue koko repositorya
- älä lue `materiaali/`-hakemistoa ilman tarvetta
- älä lue vanhoja todo-versioita
- älä tee koko dokumentaation analyysiä

Jos tarvitaan vertailua toiseen dokumenttiin, lue vain tarvittava toinen dokumentti.

## Laajat sisältötehtävät

Jos käyttäjä pyytää kokonaisen uuden dokumentaation tai laajan sisältöalueen:

1. Selvitä kohteen paikka nykyisessä rakenteessa.
2. Tarkista tarvittaessa lähdemateriaali.
3. Suunnittele sisältö käyttäjän pyytämän aiheen mukaan.
4. Kirjoita sisältö itsenäisesti.
5. Tarkista tekninen oikeellisuus.
6. Tarkista Markdown-rakenne.
7. Tarkista sisäiset linkit ja tarvittaessa navigaatio.

Älä aloita seuraavaa erillistä sisältötehtävää automaattisesti.

## Todo-prosessi

Älä käytä `todo/sisalto-todo*.md`-tiedostoja tavallisissa MkDocs-muutoksissa.

Jos käyttäjä nimenomaisesti pyytää jatkamaan projektin laajaa dokumentointiprosessia, noudata projektin `CLAUDE.md`-tiedostossa määriteltyä todo-prosessia.

Älä koskaan ylikirjoita aikaisempaa todo-versiota.

## Verifiointi

Tarkista muutoksen laajuuden mukaan.

Pienessä Markdown-muutoksessa tarkista Markdown-syntaksi, otsikot, linkit tarvittaessa ja koodilohkojen sulkeminen.

Kuvamuutoksessa tarkista kuvan polku, alt-teksti ja Markdown-syntaksi.

Navigaatiomuutoksessa tarkista YAML-rakenne, tiedostopolku ja navigaation oikea sijainti.

Laajassa dokumentaatiossa tarkista tekninen oikeellisuus, rakenne, terminologia, linkit, Markdown, MkDocs Material -yhteensopivuus ja koodilohkojen sulkeminen.

Älä suorita raskasta buildia tai täydellistä QA:ta triviaalin muutoksen vuoksi.

## Älä tee näitä ilman käyttäjän pyyntöä

Älä lue koko repositorya.

Älä lue kaikkia `docs/`-tiedostoja.

Älä lue `materiaali/`-hakemistoa ilman tarvetta.

Älä muuta `mkdocs.yml`-tiedostoa ilman tarvetta.

Älä järjestä navigaatiota uudelleen.

Älä refaktoroi CSS:ää.

Älä vaihda projektin rakennetta.

Älä tee yleistä dokumentaation uudelleenkirjoitusta.

Älä tee täydellistä QA-tarkistusta pienen muutoksen yhteydessä.

Älä aloita seuraavaa todo-tehtävää.

Älä tee käyttäjän pyytämättömiä parannuksia.

## Muutosten periaate

Tee pienin muutos, joka täyttää käyttäjän pyynnön.

Säilytä olemassa oleva sisältö, rakenne, tyyli ja konfiguraatio silloin, kun niitä ei tarvitse muuttaa.

Älä laajenna tehtävän laajuutta ilman perusteltua teknistä tarvetta.

## Työn lopuksi

Kun tehtävä on valmis, ilmoita lyhyesti mitä muutettiin, mitkä tiedostot muutettiin ja mitä verifioitiin tarvittaessa.

Älä kirjoita pitkää projektianalyysiä, ellei käyttäjä pyydä sitä.