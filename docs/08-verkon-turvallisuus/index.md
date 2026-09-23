# Verkon turvallisuus (Security)

Tämä osio käsittelee **IPv4-verkon tietoturvaan** – sitä, miten verkkotietoliikenteen voidaan suojata hyökkäyksiltä ja tiedonsiirron yksityisyyden sekä ennustettavuuden turvaamiselta. Se perustuu muun muassa **RFC 6194** (verkon hyödyntämisestä), **RFC 6993** (ICMP-tietoturva) sekä ISO/IEC 27001 -kehikkoihin.

## Mitä tämä osio käsittelee?

| Sivu | Aihe | Keskeinen kysymys |
|------|------|-------------------|
| Tietoturva-perusteet | CIA-malli, uhka | Mitä on suojattavaa? |
| Palomuuri | Firewall, statefull | Miten estetään pahat paketit? |
| Intrusiohawkistus | IDS/IPS | Miten havaita hyökkäykset? |
| Virtuaalitietoverkot | VPN, IPsec | Miten suojata yhteyksiä? |

## Miksi verkon turvallisuus on tärkeä?

| Ilman turvallisuutta | Turvallisen verkon kanssa |
|-----------------------|--------------------------|
| Paketit voivat kantaa mitään | Liikenne suodattaa ja salaa |
| Hyökkääjät voivat seurata | Hyökkääjät estetään tai havaitaan |
| Tiedot voivat vuotaa | Tiedot salataan ja kryptataan |

## Tietoturvan perusperiaatteet

!!! info "CIA-malli"

    Tietoturvan ydinperiaatteet muodostavat **CIA-mallin**:
    - **Confidentiality** (yksityisyys) – kuka saa nähdä tiedot
    - **Integrity** (luotettavuus) – tiedot eivät ole muutuneet
    - **Availability** (saatavuus) – järjestelmä toimii kun sitä tarvitaan

## Tämä osio ja reititys

Verkon turvallisuus ja reititys liittyvät tiiviisti: reititin kautta kulkeva liikenne on tarkkailtavissa ja suodatettavissa. Tämä on erityisen tärkeää [07-reititys/index.md](../07-reititys/index.md)-osioon liittyen.

## Seuraavaksi

Aloitamme [tietoturva-perusteet.md](tietoturva-perusteet.md)-sivulta, jossa käsitellään CIA-mallia, uhkia ja tietoturva-arkkitehtuureja.
