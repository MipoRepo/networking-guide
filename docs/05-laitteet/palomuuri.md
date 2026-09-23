# Palomuuri (Firewall)

**Palomuuri** (firewall) on turvajärjestely – laitteisto tai ohjelmisto – joka valvoo ja suodattaa verkkoliikennettä sääntysten perusteella. Tämä dokumentti perustuu **RFC 6973** (Privacy Considerations in Internet Protocols) ja yleisiin palomuurimekaniikoihin.

## Mikä palomuuri on?

Palomuuri toimii **pääsääntöjen avulla** – jokainen yhteys tarkastetaan näiden sääntsten mukaan:

| Sääntö | Toimenpide |
|--------|------------|
| Salli | Yhteys kulkee läpi |
| Katkaise | Yhteys torjutaan |

## Miksi palomuuri on tärkeä?

| Ilman palomuuria | Palomuurin kanssa |
|-------------------|-------------------|
| Kaikki portit aukeat | Valitut portit aukeet |
| Tuntemattomat yhteydet | Turvalliset yhteydet |
| Hyökkäykset helpohia | Hyökkäykset vaikeampia |

## Palomuurin perusperiaatteet

### 1. Pohjimmus (Default Policy)

Jokaisella palomuurilla on kaksi perusasetusta:

| Asetus | Selitys |
|--------|---------|
| **default allow** | Kaikki sallittu ellei erikseen kiellata |
| **default deny** | Kaikki kiellitty ellei erikseen sallita |

!!! warning "Paras käytäntö"

    Modernit verkot käyttävät "default deny" -periaatetta – vain varatut liikkeet ovat sallittuja. Tämä on NSA Cybersecurity -suositus.

### 2. Läpimenoaika (Stateful vs Stateless)

| Tyyppi | Selitys | Esimerkki |
|--------|---------|-----------|
| **Stateful** | Seuraa yhteyttä – "Tämä vastaus kuuluu tuohon kyselyyn?" | Linux `conntrack`, iptables |
| **Stateless** | Tarkastelee kukin paketin erikseen | Perusreititin suodatus |

Stateful on turvallisempi, koska se ei tarvitse erikäsitellä vastauksia erikseen.

## Palomuurin muodot

| Muoto | Selitys | Käyttö |
|-------|---------|--------|
| **Verkkopalomuuri** | Fysikaalinen laite erillään reitittimen tai kytkennin edessä | Unternehmen |
| **Ohjelmistopuiminen** | Linux `iptables`, Windows Firewall | Yksiläishenkilöt, palvelimet |
| **Sovelluspohjainen** | Sovelluksen sisällä oleva suodatin | Tietty sovellus |

## Esimeke: Linux `iptables`

```bash
# Oletussääntö: kaikki kiellitty
iptables -P INPUT DROP

# Salli joajo set yhteydet (esim. jo palatessa)
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Salli SSH (portti 22)
iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# Salli ICMP
iptables -A INPUT -p icmp -j ACCEPT

# Salli loopback
iptables -A INPUT -i lo -j ACCEPT

# Näytä säännökset
iptables -L -n -v
```

## Palomuurin sääntöjen rakenne

| Sarakkeet | Selitys |
|-----------|---------|
| **Chain** | INPUT / OUTPUT / FORWARD |
| **Protocol** | TCP / UDP / ICMP |
| **Source** | Lähdeosoite (esim. 192.168.1.0/24) |
| **Destination** | Kohdeosoite |
| **Portti** | (TCP/UDP) – esim. 22 (SSH) |
| **Action** | ACCEPT / DROP / REJECT / LOG |

## DMZ: Demilitarisoituvyysalue

DMZ (Demilitarized Zone) on erillinen aliverkko, jossa palvelimet (esim. www-palvelin) ovat eristettynä sisäverkosta ja ulompiusta. Palomuuri sallii vain tietyt yhteydet tähän alueeseen.

## Palomuurin rajoitukset

| Rajoite | Selitys |
|---------|---------|
| **Deep Packet Inspection** | Kaikki paketit eivät ole tarkistettu syvällisesti |
| **Suorituskyky** | Liian monet sääntöt hidastavat liikennettä |
| **Man-in-the-Middle** | Salaamaton liikenne voi purettaa |
| **Zero-day** | Tuntemattomat hyökkäykset voivat ohittaa |

## Seuraavaksi

Kun olet ymmärtänyt palomuurin roolin, siirrytään [verkkokorttiin](verkkokortti.md), joka käsittelee laitteen ja fyysisen verkon välistä yhteyttä.
