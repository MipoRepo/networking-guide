# Palomuuri (Firewall)

**Palomuuri** (firewall) on verkon turvajako, joka suodattaa liikennettä määrättyjen sääntöjen perusteella. Se on keskeinen osa verkon tietoturva-arkkitehtuuria ja toimii usein DMZ:n ja sisäverkon välillä. Tämä dokumentti perustuu **NIST SP 800-92** -standardiin ja yleisiin palomuinteknologiisiin.

## Mitä tämä sivu käsittelee?

- **Palomuun perusteet** – filtterisäännöt ja liikenteen suodatus
- **Stateful vs Stateless** – istuntoon perustuvan suodatus
- **Esimerkkikonfiguraatioit** – iptables- ja Cisco ACL -säännökset

## Mitkä ovat palomuun perusteet?

Palomuuri toimii kahdella tavalla:

1. **Pakettiyhteys (Packet filtering)** – tarkistaa yksittäisiä paketit
2. **Istunto (Stateful inspection)** – seuraa yhteyksiä

### Paketin suodatus

Palomuuri tarkistaa paketin:

| Kenttä | Selitys |
|--------|---------|
| **Lähde-osoite** | Kuka lähetti |
| **Kohde-osoite** | Kuka ottaa vastaan |
| **Lähdeportti** | Lähettäjän portti |
| **Kohdeportti** | Vastaanottajan portti |
| **protokolla** | TCP, UDP, ICMP |

### Esimerkki suodatussäännöksestä

```bash
iptables -A INPUT -s 192.168.1.0/24 -p tcp --dport 22 -j ACCEPT
```

Tämä sallii SSH-liikenteen (portti 22) verkosta `192.168.1.0/24`.

## Stateful vs Stateless

| Ominaisuus | Stateless | Stateful |
|------------|-----------|----------|
| Istintoit | Ei | Kyllä |
| Tehokkuus | Korkea | Vähä |
| Turva | Perus | Syvällinen |
| Muisti | Ei tarvitse | Tarvitsee |

### Stateful palomuuri

Seuraa yhteyttä:

- **SYN** – alkuperäinen yhteys
- **ESTABLISHED** – yhteys on avoin
- **RELATED** – liittyvä yhteys (esim. FTP-data)

```text
Client → SYN → Firewall → SYN+ACK → Server
Client ← ACK ← Firewall ← SYN+ACK ← Server
```

### Esimerkkikonfiguraatio (iptables)

```bash
# Oleta yleinen yhteys
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Sallii SSH-pääsyn
iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# Estää muut
iptables -A INPUT -j DROP
```

## DMZ:n ja palomuun yhdistäminen

```text
Internet
    ↓
[Firewall (alhdinta)]
    ↓
DMZ Verkko (WWW, Mail)
    ↓
[Firewall (sisällä)]
    ↓
Sisäverkko
```

| Firewall-osa | Vastuu |
|--------------|--------|
| Ulkoinen | Julkisten palvelinten suojelu ulkoverkilta |
| Sisäinen | Sisäverkon suojelu DMZ:lt |

## Palomuun tyyppit

| Tyyppi | Selitys | Esimerkki |
|--------|---------|-----------|
| **Packet filter** | Tarkistsisaat paketit | iptables |
| **Statefull proxy** | Seuraa istuntoja | Squid |
| **Circuit gateway** | Luo istunto | SOCKS |
| **Application layer** | Sovellustason tarkistus | WAF |

## Cisco ACL – esimerkki

```text
access-list 100 permit tcp 192.168.1.0 0.0.0.255 any eq 80
access-list 100 deny ip any any
```

Tämä sallii HTTP-liikennettä verkosta `192.168.1.0/24` ja ottaa kaiken muun estetyksi.

## Palomuun rajoitukset

| Rajoite | Selitys |
|---------|---------|
| Ei salaa | Palomuuri ei salaa liikennettä |
| Ei dekriptoimaan | TLS-paketit eivät dekriptota |
| Virheelliset säännökset | Voi estää laillisen liikennettä |

## Hyvät käytännöt

| Käytäntö | Selitys |
|----------|--------|
| Alkuperäisen `deny` | Ota kaikki kiellettäväksi, salli kerran kerrallaan |
| Väilijäiset säännöt | Säilytä yksinkertaisuus |
| Lokia | Seuraa palomuinlogit |

## Seuraavaksi

Seuraavaksi tarkastellaan [ips.md](ips.md), jossa käsitellään intrusiohavaitsemista (IDS/IPS) ja signature- sekä anomaly-pohjaisia järjestelmiä.
