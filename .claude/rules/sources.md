---
name: sources
description: Määrittää tietoverkkodokumentaation lähteiden käytön, luotettavuuden, tarkistamisen ja lähdeviitteiden periaatteet.
---

# Sources Rules

## Tarkoitus

Varmista, että tietoverkkodokumentaation tekniset väitteet perustuvat luotettavaan ja tarkoituksenmukaiseen lähdemateriaaliin.

Lähteiden tarkoitus on:

- varmistaa tekninen oikeellisuus
- tukea teknisiä väitteitä
- täydentää puutteellista lähdemateriaalia
- tunnistaa vanhentunut tieto
- erottaa lähdemateriaali varmennetusta teknisestä tiedosta

## Lähteiden ensisijaisuus

Suosi ensisijaisia ja virallisia teknisiä lähteitä.

Ensisijainen lähdejärjestys on mahdollisuuksien mukaan:

1. standardit ja standardointiorganisaatioiden julkaisut
2. protokollien viralliset määrittelyt
3. valmistajien virallinen tekninen dokumentaatio
4. käyttöjärjestelmien ja ohjelmistojen virallinen dokumentaatio
5. muu luotettava tekninen dokumentaatio
6. oppikirjat ja koulutusmateriaali

Tietoverkoissa erityisen tärkeitä lähteitä ovat:

- IETF RFC:t
- IEEE-standardit
- Linuxin virallinen dokumentaatio
- verkkolaitteiden valmistajien virallinen dokumentaatio

## IETF ja RFC:t

Käytä IETF:n RFC-julkaisuja ensisijaisena lähteenä, kun dokumentoit IETF:n määrittelemiä protokollia tai mekanismeja.

Tarkista tarvittaessa:

- RFC:n tila
- julkaisuajankohta
- mahdolliset korvaavat RFC:t
- dokumentoitavan ominaisuuden tarkka määrittely

Älä oleta, että vanhin RFC on automaattisesti nykyinen määrittely.

Jos RFC on obsoletoitu tai korvattu, käytä ajantasaisempaa määrittelyä.

## IEEE

Käytä IEEE:n standardeja, kun tekninen sisältö liittyy IEEE:n määrittelemiin teknologioihin.

Esimerkiksi Ethernetiin ja IEEE 802 -standardeihin liittyvissä aiheissa tarkista tarvittaessa alkuperäinen standardi tai luotettava sitä käsittelevä tekninen dokumentaatio.

Älä keksi standardin sisältöä, numeroa tai vaatimuksia.

## Valmistajien dokumentaatio

Verkkolaitteiden toimintaa ja valmistajakohtaista toteutusta käsiteltäessä käytä ensisijaisesti valmistajan virallista dokumentaatiota.

Erota toisistaan:

- standardin määrittelemä toiminta
- valmistajakohtainen toteutus
- käyttöjärjestelmä- tai ohjelmistokohtainen toiminta
- konfiguraatioesimerkki

Älä esitä valmistajakohtaista toimintaa yleisenä verkkoteknologian ominaisuutena.

## Linux ja ohjelmistot

Linux-komentoja, verkkotyökaluja ja ohjelmistojen toimintaa käsiteltäessä suosi kyseisen projektin tai ohjelmiston virallista dokumentaatiota.

Tarkista tarvittaessa:

- komennon syntaksi
- tuetut vaihtoehdot
- käyttöjärjestelmäkohtaiset erot
- version vaikutus toimintaan

Älä esitä yhden Linux-jakelun tai ohjelmistoversion käyttäytymistä yleispätevänä.

## Kurssimateriaali

Projektin lähdemateriaalina käytettävää kurssimateriaalia voidaan käyttää dokumentaation sisällön lähtökohtana.

Kurssimateriaalia ei kuitenkaan pidetä automaattisesti teknisesti auktoritatiivisena lähteenä.

Jos kurssimateriaalin väite:

- vaikuttaa vanhentuneelta
- on epäselvä
- on ristiriidassa ensisijaisen lähteen kanssa
- vaikuttaa teknisesti virheelliseltä

tarkista asia ensisijaisesta tai muusta luotettavasta teknisestä lähteestä.

## Lähdemateriaalin rajaus

Kurssin tai muun lähdemateriaalin hallinnollista sisältöä ei siirretä tekniseen dokumentaatioon.

Älä käytä dokumentaation sisältönä:

- aikatauluja
- tehtävänantoja
- harjoituksia
- tenttejä
- arviointia
- suoritusohjeita
- hallinnollisia ohjeita
- videoita
- videolinkkejä

Lähdemateriaalista poimitaan vain teknisen dokumentaation kannalta relevantti tieto.

## Lähteen ja väitteen vastaavuus

Lähteen tulee oikeasti tukea esitettyä väitettä.

Älä käytä lähdettä vain siksi, että se käsittelee samaa aihealuetta.

Tarkista tarvittaessa:

- mitä lähde tarkalleen määrittelee
- koskeeko väite samaa versiota tai standardia
- koskeeko väite samaa protokollaa tai mekanismia
- onko väite yleinen vai toteutuskohtainen

Älä laajenna lähteen väitettä pidemmälle kuin lähde perustelee.

## Lähteiden ristiriidat

Jos kaksi lähdettä näyttää olevan ristiriidassa:

1. tarkista lähteiden julkaisuajankohta
2. tarkista standardin tai dokumentin tila
3. tarkista mahdolliset korvaavat määrittelyt
4. selvitä, koskeeko ero eri toteutuksia tai versioita
5. käytä ajantasaisinta ja tarkoitukseen sopivinta lähdettä

Älä ratkaise ristiriitaa arvauksella.

Jos ristiriita jää olennaiseksi, tuo se dokumentaatiossa selkeästi esiin.

## Ajantasaisuus

Teknisen lähteen ajantasaisuus tulee arvioida aiheen mukaan.

Erityisesti tarkista ajantasaisuus:

- protokollamäärittelyissä
- ohjelmistojen komennoissa
- verkkolaitteiden ominaisuuksissa
- tietoturvaan liittyvissä asioissa
- standardeissa

Vanha lähde voi edelleen olla käyttökelpoinen historiallisessa tai perustavanlaatuisessa asiassa, mutta sitä ei pidä esittää nykyisenä määrittelynä ilman tarkistusta.

## Lähdeviitteet

Kun dokumentaatio edellyttää lähdeviitettä, viitteen tulee olla:

- täsmällinen
- löydettävissä
- oikeaan väitteeseen liittyvä
- mahdollisuuksien mukaan ensisijainen

Älä lisää lähdeviitteitä vain lähteiden määrän kasvattamiseksi.

Älä keksi puuttuvia URL-osoitteita, RFC-numeroita, standardeja tai dokumenttien nimiä.

## Ulkoiset lähteet

Ulkoisia lähteitä käytettäessä varmista:

- lähteen aitous
- lähteen julkaisija
- lähteen tekninen relevanssi
- lähteen ajantasaisuus
- linkin oikeellisuus

Suosi virallista verkkotunnusta ja alkuperäistä julkaisijaa.

Älä käytä hakutuloksen otsikkoa teknisenä lähteenä ilman varsinaisen lähteen tarkistamista.

## Toissijaiset lähteet

Toissijaisia lähteitä voidaan käyttää, jos:

- ensisijaista lähdettä ei ole helposti saatavilla
- aihe vaatii selittävää materiaalia
- lähde auttaa yhdistämään useita teknisiä käsitteitä

Toissijainen lähde ei kuitenkaan saa syrjäyttää ensisijaista lähdettä silloin, kun tekninen määrittely voidaan tarkistaa suoraan.

## Lähteiden määrä

Lähteiden määrää ei optimoida mahdollisimman suureksi.

Tavoitteena on riittävä ja laadukas lähdepohja.

Yksi hyvä ensisijainen lähde on parempi kuin useita heikkoja lähteitä.

Älä lisää lähteitä, jotka eivät tuo dokumentaatioon lisäarvoa.

## Lähteiden käyttö dokumentointiprosessissa

Kun kirjoitat uutta dokumentaatiota:

1. tunnista tekniset väitteet
2. tunnista mitkä väitteet tarvitsevat tarkistuksen
3. etsi tarvittaessa ensisijaiset lähteet
4. tarkista väitteet
5. kirjoita sisältö itsenäisesti
6. lisää tarvittavat lähdeviitteet
7. tarkista, että viitteet vastaavat väitteitä

Älä kopioi lähteen tekstiä dokumentaatioon.

## Kontekstin hallinta

Käytä vain tehtävän kannalta tarpeellisia lähteitä.

Älä kerää suurta määrää lähteitä ilman tarkoitusta.

Jos käyttäjä pyytää yhden aiheen tarkistamista:

- tarkista vain kyseisen aiheen kannalta relevantit lähteet
- älä tutki koko verkkoteknologian lähdehistoriaa

Jos käyttäjä pyytää koko dokumentaation lähdeanalyysiä, laajenna tarkistus vasta silloin.

## Verifiointi

Ennen työn valmistumista varmista:

- tekniset väitteet perustuvat luotettavaan tietoon
- ensisijaisia lähteitä on käytetty silloin, kun niitä tarvitaan
- lähteet ovat aiheeseen relevantteja
- lähteet eivät ole tarpeettomasti vanhentuneita
- lähdeviitteet vastaavat väitteitä
- ristiriidat on selvitetty
- lähteitä ei ole keksitty

## Älä tee näitä ilman käyttäjän pyyntöä

- Älä lisää lähteitä vain määrän vuoksi.
- Älä korvaa ensisijaista lähdettä heikommalla lähteellä ilman syytä.
- Älä keksi lähdeviitteitä.
- Älä keksi RFC-numeroita.
- Älä keksi standardien numeroita tai sisältöä.
- Älä esitä valmistajakohtaista ominaisuutta yleisenä standardina.
- Älä esitä vanhentunutta tietoa ajantasaisena.
- Älä kopioi lähdemateriaalia sellaisenaan.
- Älä tutki koko lähdeaineistoa pienen tehtävän vuoksi.
- Älä lue vanhoja todo-versioita ilman käyttäjän pyyntöä.

## Muutosten periaate

Lähteiden käytön tulee tukea dokumentaation teknistä luotettavuutta.

Tee pienin tarvittava lähdetarkistus, jolla tekninen väite voidaan perustellusti varmistaa.

Älä laajenna lähdetutkimusta tehtävän ulkopuolelle.