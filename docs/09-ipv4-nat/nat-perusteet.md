# NAT:n perusteet

**NAT** (Network Address Translation) on mekanismi, jossa verkkolaitteiden välillä tapahtuva IP-osoitteiden käännös. Tämä dokumentti perustuu **RFC 3022** (NAT Architecture) ja **RFC 4787** (NAT Behavioral Requirements).

## Mitä tämä sivu käsittelee?

- **NAT:n periaate** – miten osoitteet muunnetaan
- **NAT-taulu** – miten muutokset tallennetaan
- **Muunnostuslogiikka** – miten päätetään mikä muunnos tehdään

## NAT:n periaate

Kun paketti lähetetään NATin läpi, sen lähettäjän tai vastaanottajan osoite muuttuu:

1. Lähettäjältä saatu paketti tarkastellaan
2. Lähettäjän osoite muutetaan julkiseksi (esim. NATista)
3. Vastaanotto palvelin vastaa julkiseen osoitteeseen
4. NAT palauttaa vastauksen ensisijaisen (private) osoitteeseen

### Esimerkkipaketti

| Vaihe | Lähde | Kohde | Selitys |
|-------|-------|-------|---------|
| Lähetys | 10.0.0.5:1234 | 192.0.2.10:80 | Private lähettäjä |
| NAT | 203.0.113.5:54321 | 192.0.2.10:80 | Muutetaan julkaiseksi |
| Vastaus | 192.0.2.10:80 | 203.0.113.5:54321 | Paluu NAT-koneelle |
| Paluu | 192.0.2.10:80 | 10.0.0.5:1234 | Private vastaanottaja |

## NAT-taulu

NAT ylläpitää **NAT-taulua** (NAT table), jossa on kirjattu, miten jokainen yhteys on käännetty:

| Private Address | Public Address | Protokolla | Private Port | Public Port | Istunto |
|-----------------|----------------|------------|--------------|-------------|---------|
| 10.0.0.5 | 203.0.113.5 | TCP | 1234 | 54321 | Active |
| 10.0.0.6 | 203.0.113.5 | UDP | 53 | 49234 | Active |

Tämä taulu on **tilapäinen** – se poistuu kun istunto päättyy.

## NATin Tyypit

| Tyyppi | Selitys |
|--------|--------|
| **SNAT** | Lähdeosoitteen muuttaminen |
| **DNAT** | Kohdeosoitteen muuttaminen |

!!! info "SNAT vs DNAT"

    - **SNAT** (Source NAT): Muuttaa paketin lähettäjän osoitteen. Usein käytetty sisäverkon ulkopuoliseen yhteyteen.
    - **DNAT** (Destination NAT): Muuttaa paketin vastaanottajan osoitteen. Usein käytetty palvelun näyttämiseen eri palvelimella.

## Muunnostuslogiikka

NAT päättää, miten osoitteet muutetaan seuraavien periaatteiden mukaan:

### 1. Longest Prefix Match

Kun useampi NAT-sääntö on olemassa, valitaan **pidin verkko-osoite** (pidin /-luku).

### 2. First Match

NAT käsittelee säännökset **järjestettyyn järjesteeseen** ja käyttää ensimmäisen täsmäävän.

## NAT:n istunto seuranta

Jokainen yhteys pitää erillisen istunnon:

| Istuntoavain | Selitys |
|--------------|---------|
| Lähde-osoite | Private IP + Portti |
| Kohde-osoite | Julkinen IP + Portti |
| Protokolla | TCP/UDP |

TCP-istunnon avaaminen vaatii **SYN**:n, ja se suljetaan **FIN**- tai **RST-viesteillä**.

## NAT-tilan hallinta

| Toiminto | Selitys |
|----------|--------|
| **Lisää istunto** | Uusi yhteys avattiin |
| **Päivitä istunto** | Viesti virtaa istunnossa |
| **Poista istunto** | Istunto aika- tai virhekäynnillä päättyi |

## Esimerkkikonfiguraatio (iptables)

```bash
# SNAT: muuta lähdeosoite julkiseksi
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 203.0.113.5

# DNAT: ohjaa liikenne toiseen porttiin
iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to-destination 10.0.0.5:8080
```

## NAT:n rajoitukset

| Rajoite | Selitys |
|---------|--------|
| **Portti-rajoitus** | PATissa on max 65535 porttia per osoite |
| **Istunnon hallinta** | Pitkät istunnot voivat täyttää taulun |
| **Salauston yhteys** | Joissain sovelluksissa yhteys voi katkeaa |

## Seuraavaksi

Seuraavaksi tarkastellaan [nat-tyypit.md](nat-tyypit.md), jossa käsitellään NAT:in eri muotoja: Static NAT, Dynamic NAT ja PAT (Port Address Translation).
