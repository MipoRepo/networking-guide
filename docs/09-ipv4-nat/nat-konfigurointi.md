# NAT:n konfigurointi

Tämä sivu näyttää konkreettisia esimerkkejä **NAT:n konfiguroinnista** eri laitteistoissa. Esimerkit perustuvat **RFC 3022** (NAT Architecture) ja valmistolähteisiin: Linux `iptables`, Cisco IOS ja OpenBSD PF.

## Mitä tämä sivu käsittelee?

- **Linux (iptables)** – avoimen lähdekoodin NAT-konfigurointi
- **Cisco IOS** – Cisco-reitittimen NAT-toiminnot
- **OpenBSD PF** – PF-firewallin NAT-asetukset

## Linux (iptables)

Linuxissa NAT konfiguroidaan `iptables`-työkalulla `nat`-taulussa:

### SNAT (Source NAT)

```bash
# Muutetaan kaikki lähtevät paketit yhtä julkiseen osoitteeseen
iptables -t nat -A POSTROUTING -o eth0 -s 10.0.0.0/24 -j SNAT --to-source 203.0.113.5
```

| Parametri | Selitys |
|-----------|--------|
| `-t nat` | Käytetään NAT-taulua |
| `-A POSTROUTING` | Lisätään jälikäsittelyyn (lähtevät paketit) |
| `-o eth0` | Ulos lähtevyytetyssä verkossa |
| `-s 10.0.0.0/24` | Lähde verkko |
| `SNAT --to-source` | Muutetaan lähdeosoite |

### MASQUERADE (Dynamic SNAT)

```bash
# Käytetään dynaamiselle verkolle (esim. DHCP)
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
```

### DNAT (Destination NAT)

```bash
# Ohjataan palvelu toiseen isäntään
iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to-destination 10.0.0.5:8080
```

### Täydellinen esimerkki

```bash
# Ota IP-välitys käynnissä
echo 1 > /proc/sys/net/ipv4/ip_forward

# SNAT sisäverkolle
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 203.0.113.5

# DNAT WWW-palvelulle
iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to-destination 10.0.0.5:80

# Sallii muutetun liikeneen
iptables -A FORWARD -p tcp --dport 80 -d 10.0.0.5 -j ACCEPT
iptables -A FORWARD -p tcp --sport 80 -s 10.0.0.5 -m state --state ESTABLISHED -j ACCEPT
```

## Cisco IOS

Cisco-laitteissa NAT määritellään globaalisti:

### Perusasetukset

```text
! Ota NAT käyttöön
ip routing
interface GigabitEthernet0/0
  ip address 203.0.113.1 255.255.255.0
  ip nat outside

interface GigabitEthernet0/1
  ip address 10.0.0.1 255.255.255.0
  ip nat inside

! Määritä NAT-reitti
access-list 1 permit 10.0.0.0 0.0.0.255
ip nat inside source list 1 interface GigabitEthernet0/0 overload
```

### NAT-tyypit Ciscoissa

| Komento | Tyyppi | Selitys |
|---------|--------|---------|
| `ip nat inside source list` | Dynamic | Usein PAT:lla |
| `ip nat inside source static` | Static | Kiinteä käännös |
| `ip nat outside` | Rajaus | Ulkoverkon puolen |
| `ip nat inside` | Rajaus | Sisäverkon puolen |

## OpenBSD PF

PF (Packet Filter) tukee NAT:ta seuraavasti:

### Perus-NAT

```text
# /etc/pf.conf
ext_if = "em0"
int_if = "em1"

# SNAT kaikille sisäverkolta lähteville
nat on $ext_if from 10.0.0.0/24 to any -> ($ext_if)

# DNAT HTTP-liikenteelle
rdr on $int_if proto tcp from any to any port 80 -> 10.0.0.5 port 8080
```

## NAT:n tarkistus

| Komento | Selitys |
|---------|---------|
| `iptables -t nat -L -n -v` | Näytä NAT-säännökset |
| `ip nat translations` | Näytä NAT-translated istunnnot (Cisco) |
| `pfctl -s nat` | Näytä PF:n NAT-säännökset |

## Vianmääritys

Jos NAT ei toimi:

1. Tarkista IP-välitys käynnissä (`/proc/sys/net/ipv4/ip_forward` Linuxissa)
2. Tarkista NAT-säännökset (`iptables -t nat -L`)
3. Tarkista liikenteen suunta ( sisään/ulos)

## Rajoitukset

| Rajoite | Selitys |
|---------|--------|
| **Protokolla | Joissain protokolloissa (esim. SIP) NAT voi aiheuttaa ongelmia |
| **Porttipaketit | NAT voi häiritä portti-reititystä |
| **Salaus | NAT salattuun liikenkeeseen vaatii lisäkonfigurointia |

## Seuraavaksi

Kun olet ymmärtänyt NAT:n perusteet ja konfiguroinnin, siirrytään [10-tcp-udp-ssh-http/index.md](../10-tcp-udp-ssh-http/index.md)-osioon, jossa käsitellään TCP-, UDP-, SSH- ja HTTP-protokollia.
