# Verkkolaitteet ja kaapelointi

Tämä osio käsittelee fysisiä verkkolaitteita – niiden rakennetta, roolia ja todennäkistä käyttöä verkkoissa. Ymmärtääksesi, miten verkot todella toimivat, on tärkeää tietää, mitä laitteita on käytössä ja miten ne yhteistyistlevat.

## Mitä tämä osio käsittelee?

| Sivu | Aihe | Keskeinen kysymys |
|------|------|-------------------|
| Kytkin | Switch (Layer 2) | Miten verkko laitetaan yhteyttä sisäiseen verkkoon? |
| Reititin | Router (Layer 3) | Miten verkot kytketään eri verkoihin yhteensä? |
| Palomuuri | Firewall | Miten verkkoliikenne suodatetaan turvallisuuden vuoksi? |
| Verkkokortti | NIC | Miten laitteisto liittyy fyysiseen verkkoon? |
| Kaapelointi | Kuitu ja mediat | Miten tiedot kulkeutuvat fyysisillä verkoilla? |

## Miksi laitteet ovat tärkeitä?

| Laitteisto rooli | Toiminto |
|------------------|-----------|
| **Kytkin** | Liittää useat laitteet yhteisein verkkoon (bridge) |
| **Reititin** | Yhdistää erilaiset verkot |
| **Palomuuri** | Suodattaa liikennettä turvallisuuden vuoksi |
| **Verkkokortti** | Tarjoaa fyysisen liittymän laitteistolle |
| **Kaapelit** | Katkaisevat tiedot verkosta – usein yli 100 m |

## OSI-mallin vastaavuus

Verkkolaiteet ovat usein multi-protokollista ja useita kerroksia:

| Laitteisto | Pääasiallinen kerros | Toiminto |
|------------|---------------------|----------|
| Verkkokortti | Kerros 1 (fyysinen) | Elektinen signaalin muuntaminen digitaaliseksi |
| Kytkin | Kerros 2 (linkitys) | MAC-osoitteiden kääntäminen ja kehysten kääntäminen |
| Reititin | Kerros 3 (verkko) | IPv4-osoitteiden kääntäminen ja paketin kääntäminen |
| Palomuuri | Kerros 3–4 (verkko/käyttö) | Liikenteen tarkastaminen ja suodatus |

## Seuraavaksi

Jatkomme yksityiskohtaisemmin kunkin laitteen toiminnasta. Aloitamme [kytkimen](kytkin.md) kanssa – Layer 2-laitteesta, joka on useimmissa paikallisissa verkoissa.
