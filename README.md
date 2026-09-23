# Tietoverkot – Opas ja koonti keskeisistä aiheista

Tämä projekti sisältää selkeän ja käytännönläheisen oppaan tietoverkkojen perusteisiin. Opas on kirjoitettu ammattikorkeakoulussa käymäni kurssini jälkeen, muokaten muistiinpanojani. Se on kuitenkin kirjoitettu kokonaan uudelleen ja pohjautuu tietoverkkojen yleisiin peruskäsitteisiin, standardeihin ja käytäntöihin.

## Projektin tarkoitus

Tavoitteena on tuottaa selkeä, helposti navigoitava ja teknisesti täsmällinen verkko-opas, joka soveltuu:

- itseopiskeluun
- erilaisten kurssien tueksi
- työelämän perustason verkko-osaamisen vahvistamiseen

## Sisältö

Opas kattaa mm. seuraavat osa-alueet:

- Mitä tietoverkot ovat ja miten ne toimivat
- Solmut, yhteydet, paketit ja protokollat
- OSI-malli ja TCP/IP-malli
- IPv4- ja IPv6-osoitteet
- Ethernet, kytkimet ja VLANit
- Reititys ja verkon rakenteet
- Internetin infrastruktuuri (IANA, IETF, IEEE, ISP, IXP, PoP)
- Tiedon esitystavat (bitit, tavut, binääri, heksadesimaali, ASCII, UTF-8)
- Air-gapped-verkot ja eristetyt ympäristöt

Kaikki tekstit ovat **Mikko Pohjolan** kirjoittamia ja muodostavat itsenäisen kokonaisuuden.

---

# Tekoälyn rooli projektin rakentamisessa ja kehittämisessä

Projektin lähtökohtana on vanhan koulukurssin sisältö ja siihen liittyvät muistiinpanot, jotka muutetaan itsenäiseksi ja kattavaksi tietoverkkojen oppaaksi agenttisen kehityksen avulla.

---

Projektin kehitystä ohjataan `.claude/`-hakemistossa olevilla Claude Code -ohjeilla, jotka määrittävät tekoälyn toimintatavat, sisällön käsittelyn periaatteet, tehtäväkohtaiset työskentelymallit sekä projektin laadunvarmistuksen.

```text
.claude/
├── CLAUDE.md
├── rules/
│   ├── content.md
│   ├── structure.md
│   ├── sources.md
│   └── quality.md
└── skills/
    ├── source-analysis/
    ├── networking-content/
    ├── mkdocs-documentation/
    ├── technical-review/
    ├── documentation-qa/
    ├── visual-design/
    ├── quick-docs-edit/
    ├── content-review/
    ├── beginner-examples/
    └── content-expansion/

## Rules

`.claude/rules/` sisältää projektin pysyvät toimintaperiaatteet:

- **content.md** – sisällön kirjoittamisen ja teknisen esitystavan periaatteet
- **structure.md** – dokumentaation rakenteen ja Markdown/MkDocs-rakenteen säännöt
- **sources.md** – lähteiden käyttöä, luotettavuutta ja lähteistystä koskevat säännöt
- **quality.md** – teknisen ja dokumentaation laadun yleiset vaatimukset

## Skills

`.claude/skills/` sisältää tehtäväkohtaisia toimintamalleja:

- **source-analysis** – lähdemateriaalin analysointi
- **networking-content** – tietoverkkojen teknisen sisällön tuottaminen
- **mkdocs-documentation** – MkDocs Material -dokumentaation käsittely
- **technical-review** – teknisen oikeellisuuden tarkastaminen
- **documentation-qa** – dokumentaation laadun ja rakenteen tarkistaminen
- **visual-design** – dokumentaation visuaalisen toteutuksen kehittäminen
- **quick-docs-edit** – pienet ja rajatut dokumentaatiomuutokset
- **content-review** – sisällön kattavuuden ja ymmärrettävyyden erillinen tarkastus
- **beginner-examples** – aloittelijalle suunnattujen käytännön esimerkkien tuottaminen
- **content-expansion** – sisällöllisten puutteiden tunnistaminen ja täydentämisen suunnittelu

Skills otetaan käyttöön tehtävän mukaan. Erityisesti **content-review**, **beginner-examples** ja **content-expansion** ovat erikseen pyydettäviä tarkastus- ja kehitysvaiheita, eivät automaattisia dokumentin muokkauksia.

## Claude Code -asetukset

Projektin **.claude/settings.json** määrittää Claude Coden projektikohtaiset käyttöoikeudet ja mahdollistaa normaalin kehitystyön ilman tarpeettomia hyväksyntäpyyntöjä. 

**claude-permission.md** dokumentoi puolestaan Windows-kehitysympäristön järjestelmätason asetukset ja niiden tarkoituksen. 

**Yhdessä nämä erottavat** Claude Coden projektikohtaiset oikeudet käyttöjärjestelmän asetuksista ja auttavat pitämään kehitysympäristön hallittuna ja toistettavana.

---

## Sivuston generointi

Sivusto on rakennettu MkDocsilla:

- **MkDocs Material** -teema
- Selkeä navigaatiorakenne
- Yhtenäinen visuaalinen esitystapa
- Helppo laajentaa ja ylläpitää

--- 

## Lisenssi

### Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International

### Creative Commons Nimeä–EiKaupallinen–EiMuutoksia 4.0 Kansainvälinen

This work is licensed under the Creative Commons  
**Attribution-NonCommercial-NoDerivatives 4.0 International** license (CC BY-NC-ND 4.0).

You are free to share this material as long as you:

- attribute the original author (Mikko Pohjola),
- do not use the material for commercial purposes,
- do not modify the material or create derivative works.

Tämä teos on lisensoitu Creative Commons  
**Nimeä–EiKaupallinen–EiMuutoksia 4.0 Kansainvälinen** -lisenssillä (CC BY-NC-ND 4.0).

Saat jakaa materiaalia vapaasti, kunhan:

- nimeät alkuperäisen tekijän (Mikko Pohjola),
- et käytä materiaalia kaupallisesti,
- et muokkaa materiaalia tai tee johdannaisteoksia.

Lisenssin koko teksti:  
https://creativecommons.org/licenses/by-nc-nd/4.0/