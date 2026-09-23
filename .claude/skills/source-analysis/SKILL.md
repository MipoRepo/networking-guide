---
name: source-analysis
description: Analysoi tietoverkkojen lähdemateriaalia ja muuntaa sen teknisesti luotettavan dokumentaation pohjaksi.
---

# Source Analysis

## Tarkoitus

Analysoi tietoverkkojen lähdemateriaalia ennen dokumentaation kirjoittamista.

Tavoitteena ei ole kopioida lähdemateriaalia, vaan tunnistaa sen tekninen sisältö, rakenne, olennaiset käsitteet, mahdolliset puutteet ja virheet.

## Toimintaperiaate

1. Selvitä käyttäjän pyytämä aihe tai lähdemateriaali.
2. Lue vain tehtävän kannalta relevantti lähdemateriaali.
3. Tunnista:
   - keskeiset käsitteet
   - protokollat
   - toimintaperiaatteet
   - riippuvuudet
   - tekniset termit
   - esimerkit
   - rajoitukset
4. Erottele olennainen tieto kurssi- tai hallinnollisesta sisällöstä.
5. Tunnista vanhentuneet, epäselvät tai mahdollisesti virheelliset väitteet.
6. Täydennä tarvittaessa ensisijaisilla teknisillä lähteillä.
7. Muodosta analyysin perusteella dokumentaation kirjoittamista varten selkeä sisältöpohja.

## Lähdemateriaalin rajaus

Älä sisällytä dokumentaatioon:

- kurssin aikatauluja
- tehtävänantoja
- harjoituksia
- tenttejä
- arviointia
- suoritusohjeita
- hallinnollisia ohjeita
- videoita
- videolinkkejä

## Lähteiden käyttö

Ensisijaisia lähteitä ovat esimerkiksi:

- IETF RFC:t
- IEEE-standardit
- Linuxin virallinen dokumentaatio
- verkkolaitteiden valmistajien virallinen dokumentaatio

Älä esitä lähdemateriaalin väitettä teknisenä faktana, jos sen oikeellisuudesta on aihetta epäillä.

Erota toisistaan:

- lähdemateriaalissa esitetty tieto
- varmennettu tekninen tieto
- oma johtopäätös
- epävarma tai puutteellinen tieto

Älä keksi puuttuvia tietoja.

## Kontekstin hallinta

Käytä mahdollisimman pientä tarvittavaa kontekstia.

Älä lue koko lähdemateriaalia, jos tehtävä voidaan ratkaista rajatulla osalla.

Älä lue koko repositorya lähdeanalyysin vuoksi.

Älä lue vanhoja todo-versioita, ellei käyttäjä pyydä jatkamaan todo-prosessia.

Jos käyttäjä pyytää analysoimaan tietyn luvun, sivun tai aiheen, keskity siihen.

## Dokumentaation valmistelu

Kun analyysin tarkoituksena on valmistella Markdown-dokumenttia:

- määritä mitä tietoa dokumenttiin kuuluu
- määritä sopiva otsikkorakenne
- tunnista tarvittavat tekniset termit
- tunnista mahdolliset kuvat, kaaviot tai taulukot
- tunnista kohdat, jotka tarvitsevat lähdeviitteen
- tunnista kohdat, jotka tarvitsevat teknistä täydennystä

Älä kirjoita koko dokumentaatiota, ellei käyttäjä pyydä sitä.

## Markdown

Jos analyysin yhteydessä muokataan Markdown-tiedostoa, noudata Markdownin syntaksia.

Erityisesti:

- jokainen avattu koodilohko ` ``` ` on aina suljettava vastaavalla ` ``` `-merkinnällä
- älä jätä koodilohkoja avoimiksi
- säilytä olemassa olevat koodilohkot, ellei niitä tarvitse muuttaa
- tarkista muokatun tiedoston Markdown-rakenne

## Verifiointi

Ennen analyysin valmistumista tarkista:

- tekniset väitteet
- termit
- lähteiden luotettavuus
- mahdolliset ristiriidat
- puuttuvat olennaiset tiedot
- vanhentuneet tiedot

Älä suorita koko dokumentaation QA-tarkistusta, ellei käyttäjä pyydä sitä.

## Laajuus

Tämän skillin tehtävä on lähdeanalyysi.

Älä samalla:

- kirjoita asiaan liittymätöntä dokumentaatiota
- muokkaa navigaatiota
- refaktoroi CSS:ää
- järjestä repositorya
- muuta mkdocs.yml-tiedostoa ilman tarvetta
- tee yleistä projektiremonttia
- suorita seuraavaa todo-tehtävää automaattisesti

Jos käyttäjä pyytää lähdeanalyysin jälkeen varsinaista dokumentointia, suorita se erillisenä tehtävänä.