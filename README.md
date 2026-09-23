# Computer Networks – A Guide to the Fundamentals

This project contains a clear and practical guide to the fundamentals of computer networks. The guide was created after a university of applied sciences course by revising and expanding my own notes. However, the material has been completely rewritten and is based on general networking concepts, standards, and established practices.

## Purpose of the Project

The goal is to provide a clear, easy-to-navigate, and technically accurate networking guide that can be used for:

- self-study
- supporting different courses
- strengthening fundamental networking skills for professional use

## Content

The guide covers topics including:

- What computer networks are and how they work
- Nodes, connections, packets, and protocols
- The OSI model and TCP/IP model
- IPv4 and IPv6 addressing
- Ethernet, switches, and VLANs
- Routing and network structures
- Internet infrastructure (IANA, IETF, IEEE, ISP, IXP, PoP)
- Data representation (bits, bytes, binary, hexadecimal, ASCII, UTF-8)
- Air-gapped networks and isolated environments

All texts are written by Mikko Pohjola and form an independent, self-contained body of work.

===

# Tietoverkot – opas perusteisiin

Tämä projekti sisältää selkeän ja käytännönläheisen oppaan tietoverkkojen perusteisiin. Opas on kirjoitettu ammattikorkeakoulussa käymäni kurssin jälkeen muokkaamalla ja laajentamalla omia muistiinpanojani. Se on kuitenkin kirjoitettu kokonaan uudelleen ja pohjautuu tietoverkkojen yleisiin peruskäsitteisiin, standardeihin ja käytäntöihin.

## Projektin tarkoitus

Tavoitteena on tuottaa selkeä, helposti navigoitava ja teknisesti täsmällinen verkko-opas, joka soveltuu:

- itseopiskeluun
- erilaisten kurssien tueksi
- työelämän perustason verkko-osaamisen vahvistamiseen

## Sisältö

Opas kattaa muun muassa seuraavat osa-alueet:

- Mitä tietoverkot ovat ja miten ne toimivat
- Solmut, yhteydet, paketit ja protokollat
- OSI-malli ja TCP/IP-malli
- IPv4- ja IPv6-osoitteet
- Ethernet, kytkimet ja VLANit
- Reititys ja verkon rakenteet
- Internetin infrastruktuuri (IANA, IETF, IEEE, ISP, IXP, PoP)
- Tiedon esitystavat (bitit, tavut, binääri, heksadesimaali, ASCII, UTF-8)
- Air-gapped-verkot ja eristetyt ympäristöt

Kaikki tekstit ovat Mikko Pohjolan kirjoittamia ja muodostavat itsenäisen kokonaisuuden.

===

## The Role of AI in Building and Developing the Project

The project started from the content of an old university course and the related notes. These materials are being transformed into an independent and comprehensive guide to computer networks through agent-based development.

---

The development of the project is guided by Claude Code instructions located in the `.claude/` directory. These instructions define the AI's operating principles, content processing principles, task-specific workflows, and quality assurance practices.

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
```

## Rules

`.claude/rules/` contains the project's permanent operating principles:

- **content.md** – principles for content writing and technical presentation
- **structure.md** – rules for documentation structure and Markdown/MkDocs structure
- **sources.md** – rules for source usage, reliability, and referencing
- **quality.md** – general requirements for technical and documentation quality

## Skills

`.claude/skills/` contains task-specific workflows:

- **source-analysis** – analysis of source material
- **networking-content** – creation of technical networking content
- **mkdocs-documentation** – handling MkDocs Material documentation
- **technical-review** – verification of technical accuracy
- **documentation-qa** – verification of documentation quality and structure
- **visual-design** – development of the documentation's visual presentation
- **quick-docs-edit** – small and focused documentation changes
- **content-review** – separate review of content coverage and clarity
- **beginner-examples** – creation of practical examples for beginners
- **content-expansion** – identification of content gaps and planning of additions

Skills are enabled according to the task. In particular, **content-review**, **beginner-examples**, and **content-expansion** are explicitly requested review and development phases rather than automatic document modifications.

## Claude Code Configuration

The project's **`.claude/settings.json`** defines Claude Code's project-specific permissions and enables normal development work without unnecessary approval requests.

**`claude-permission.md`** documents the Windows development environment's system-level settings and their purpose.

**Together, these separate** Claude Code's project-specific permissions from operating system settings and help keep the development environment controlled and reproducible.

---

## Site Generation

The site is built with MkDocs:

- **MkDocs Material** theme
- Clear navigation structure
- Consistent visual presentation
- Easy to extend and maintain

=== 

## Tekoälyn rooli projektin rakentamisessa ja kehittämisessä

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
```

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