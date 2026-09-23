# Tietoverkot – Claude Code -ohjeet

## Projektin tarkoitus

Rakennetaan `docs/`-hakemistoon suomenkielinen, itsenäinen ja teknisesti luotettava tietoverkkojen tietopohja MkDocs Material -ympäristöön.

Dokumentaatio ei ole kurssin suoritusohje eikä kurssimuistiinpano. Sen tarkoitus on toimia teknisenä tietokantana, oppimateriaalina, hakuteoksena ja kertausmateriaalina.

## Dokumentaation rakenne

Dokumentaation juurihakemisto on:

`docs/`

Pääaiheet ovat:

1. Johdatus tietoverkkoihin
2. Ethernet, kytkentä ja VLAN
3. IPv4, aliverkot ja ARP
4. DHCP ja staattinen reititys
5. Verkkolaitteet ja kaapelointi
6. Spanning Tree
7. IPv4-reititys
8. Verkon turvallisuus
9. IPv4 NAT
10. TCP, UDP, SSH ja HTTP
11. Palvelimet, päätelaitteet ja WLAN
12. DNS
13. IPv6
14. BGP

Älä luo uusia rinnakkaisia dokumentaatiorakenteita ilman käyttäjän pyyntöä.

## Sisältö

Kirjoita ensisijaisesti suomeksi ja käytä vakiintunutta englanninkielistä teknistä termiä tarvittaessa rinnalla.

Pyri selittämään:

- mitä asia on
- miksi sitä tarvitaan
- miten se toimii
- mihin se liittyy
- mitä ongelmaa se ratkaisee
- rajoitukset ja riskit
- käytännön merkitys

Lähdemateriaalia ei kopioida sellaisenaan, vaan tieto kirjoitetaan uudelleen tekniseksi dokumentaatioksi.

Älä lisää:

- kurssin aikatauluja
- suoritusohjeita
- tehtävänantoja
- harjoituksia
- tenttiohjeita
- arviointikriteerejä
- hallinnollisia ohjeita
- videoita tai videolinkkejä

## Tekninen luotettavuus

Suosi teknisissä kysymyksissä ensisijaisia ja arvostettuja lähteitä, kuten:

- IETF RFC:t
- IEEE
- Linuxin virallinen dokumentaatio
- verkkolaitteiden valmistajien virallinen dokumentaatio

Jos lähdemateriaali on puutteellinen, vanhentunut tai epätarkka, täydennä sitä luotettavilla teknisillä lähteillä.

Älä keksi teknisiä faktoja.

## MkDocs Material

Dokumentaatio toteutetaan MkDocs Materialilla.

Säilytä olemassa oleva `mkdocs.yml` ja rakenne. Muuta konfiguraatiota vain silloin, kun tehtävä sitä edellyttää.

Käytä MkDocs Materialin ominaisuuksia tarkoituksenmukaisesti.

Esimerkiksi:

```markdown
!!! info "Lisätietoa: Virtual LAN (VLAN)"

    VLAN eli Virtual LAN on...
    ```
```
Älä lisää infolaatikoita mekaanisesti.

## Git-ohjeet ja haaranhallinta

Projekti käyttää **vain `main`-haaraa** kehittämiseen. Kaikki muutokset commitataan suoraan `main`-haaraan.

**gh-pages-haaran** generaatii automaattisesti CI/CD-putki (`.github/workflows/pages.yml`)
MkDocs-generoidusta `site/`-hakemistosta. Sitä **ei tulta muokata käsin** — se on
deploy-haara, joka päivittyy jokaisen `main`-commitin yhteydessä.

# Todo-prosessi

Projektin `todo/`-hakemisto toimii laajan sisältöprojektin tilanhallintana ja jatkuvuusmekanismina.

Todo-tiedostot ovat muotoa:

- `todo/sisalto-todo1.0.md`
- `todo/sisalto-todo1.1.md`
- `todo/sisalto-todo1.2.md`
- jne.

Jokainen valmis tehtävä kasvattaa versionumeroa 0.1.

Älä koskaan ylikirjoita aikaisempaa todo-versiota.

## Laaja dokumentointiprosessi

Laajassa dokumentointiprosessissa:

1. Lue uusin `todo/sisalto-todo*.md` kokonaan.
2. Selvitä seuraava keskeneräinen tehtävä.
3. Suorita vain kyseinen tehtävä.
4. Tarkista tulos.
5. Kirjaa tehdyt muutokset.
6. Kirjaa ongelmat ja avoimet asiat.
7. Päivitä `JATKOPROMPTI`.
8. Luo uusi todo-versio.
9. Älä aloita seuraavaa tehtävää samassa työvaiheessa.

## Työn jatkaminen uudessa Claude Code -istunnossa

Jos työ jatkuu uudessa Claude Code -istunnossa:

1. Tarkista `todo/`.
2. Etsi uusin `sisalto-todo*.md`.
3. Lue se kokonaan.
4. Selvitä viimeisin suoritettu tehtävä.
5. Lue `JATKOPROMPTI`.
6. Jatka seuraavasta keskeneräisestä tehtävästä.

Älä päättele tehtävää suoritetuksi pelkästään siitä, että tarvittava tiedosto näyttää olevan olemassa.

Todo-tiedosto on prosessin tilan ensisijainen lähde.

# Pienten muutosten toimintatapa

Pienissä käyttäjän pyytämissä muutoksissa käytä mahdollisimman pientä kontekstia.

Älä tutki koko projektia ilman syytä.

Jos `.claude/skills/quick-docs-edit/SKILL.md` soveltuu tehtävään, noudata sitä.

## Tyypilliset rajaukset

### Markdown-tekstin muutos

```text
1 Markdown file
```

## Ohjeiden rakenne

Projektin ohjeet on jaettu kolmeen tasoon:

- `CLAUDE.md` määrittää projektin yleisen toimintamallin.
- `.claude/rules/` sisältää projektin pysyvät sisältö-, rakenne-, lähde- ja laatusäännöt.
- `.claude/skills/` sisältää tehtäväkohtaiset toimintamallit.

Käytä tehtävän kannalta relevantteja sääntöjä ja skillejä.

Jos käyttäjän nykyinen pyyntö poikkeaa yleisestä projektiohjeesta, noudata käyttäjän nimenomaista pyyntöä, ellei se riko ylemmän tason rajoituksia.

Älä lue kaikkia rules- tai skills-tiedostoja ilman tarvetta. Käytä vain tehtävän kannalta relevanttia ohjeistusta.