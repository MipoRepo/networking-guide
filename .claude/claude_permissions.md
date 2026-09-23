# Claude Code – Project Execution Permissions

Tämä tiedosto dokumentoi projektin Windows-kehitysympäristöön tehdyt
järjestelmätason asetukset.

Tämä tiedosto ei itsessään anna Claude Codelle käyttöoikeuksia.
Claude Coden varsinaiset permission-säännöt määritellään erikseen
tiedostossa `.claude/settings.json`.

## Windows Permissions

Projektin kehitysympäristössä on määritetty seuraavat Windows-asetukset:

- PowerShellin `ExecutionPolicy` on asetettu arvoon `RemoteSigned`
  `LocalMachine`-tasolla.
- Microsoft Defenderiin on lisätty poikkeukset:
  - `python.exe`
  - `git.exe`
  - projektin käyttämät Python-asennushakemistot
  - Git-asennushakemistot
- Microsoft Defenderin PUA Protection on poistettu käytöstä.

Näiden asetusten tarkoituksena on estää Windowsin suojausmekanismeja
häiritsemästä normaalia Python-, Git- ja dokumentaatiokehitystä.

## Claude Code Permissions

Claude Coden varsinaiset projektikohtaiset käyttöoikeudet määritellään:

`.claude/settings.json`

Tavoitteena on sallia normaali kehitystyö projektin työskentelyalueella
ilman jatkuvia hyväksyntäpyyntöjä.

Tähän kuuluvat esimerkiksi:

- projektin tiedostojen lukeminen ja muokkaaminen
- hakemistojen luominen ja käsittely
- Python ja projektin `venv`-ympäristö
- Git
- MkDocs
- projektin rakentaminen ja tarkistaminen

Järjestelmätason muutoksia ei tehdä automaattisesti.

Claude Code ei saa ilman käyttäjän nimenomaista pyyntöä:

- muuttaa Windowsin suojausasetuksia
- lisätä tai poistaa Microsoft Defender -poikkeuksia
- muuttaa PowerShellin `ExecutionPolicy`-asetusta
- muuttaa muita järjestelmätason asetuksia
- ottaa käyttöön järjestelmänlaajuista automaattista käyttöoikeutta

## Git-haaranhallinta

Projekti kayttaa **vain `main`-haaraa**. Kaikki muutokset commitataan suoraan `main`-haaraan.

**Gh-pages-haaran kaytto ja luominen on kielletty absoluuttisesti.** Aina koskaan:

- vilaa sisautoa `gh-pages`-haaraan
- kayta `mkdocs gh-deploy`-komentoa tai vastaavaa työkalua
- muuta MkDocs-deploy-asetuksia `gh-pages`-haaraan kohdistuksi
- yrita palauttaa poistettua `gh-pages`-haaraa

MkDocs-generoitu sivusto sijaitsee ainoastaan `site/`-hakemistossa paikallisesti. Sen julkaisemin on toteutettava muilla keinoin – **ei koskaan `gh-pages`-haaran kautta**.

## Scope

Projektin Claude Code -permissionit ovat projektikohtaisia.

Tavoitteena on, että Claude Code voi työskennellä vapaasti projektin
työskentelyalueella ja sen Python-virtuaaliympäristössä, mutta projektin
permission-asetuksia ei tule tulkita koko tietokonetta koskevaksi
yleiseksi käyttöluvaksi.

Windowsin järjestelmätason asetukset ja Claude Coden projektikohtaiset
permission-asetukset ovat erillisiä asioita:

- Windows-asetukset määrittävät käyttöjärjestelmän toimintaa.
- `.claude/settings.json` määrittää Claude Coden projektikohtaisia
  permission-sääntöjä.
- Tämä tiedosto dokumentoi näiden asetusten tarkoituksen ja rajauksen.