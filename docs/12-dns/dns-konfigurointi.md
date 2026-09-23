# DNS-konfigurointi

Tämä sivu näyttää konkreettisia esimerkkejä **DNS-palvelimen konfiguroinnista** eri alustoissa. Esimerkit perustuvat BIND:iin (Linux), Windows DNS:ään ja macOS:iin. Kattaa myös **stubbin** ja **resolverin** konfiguroinnin.

## Mitä tämä sivu käsittelee?

- **BIND-konfigurointi** – Linux DNS-palvelin
- **Resolv.conf -asennus** – Linux-resolver
- **Windows DNS** – Windows Resolverin ja palvelimen konfigurointi
- **DNS-client -testaus** – Testatut komennot (nslookup, dig)

## BIND (Berkeley Internet Name Domain)

BIND on yleinen DNS-palvelin Unix/Linux-ympäristössä. Se perustuu standardiin **RFC 1035**.

### Asennus (Debian/Ubuntu)

```bash
sudo apt update
sudo apt install bind9 bind9utils bind9-doc
```

### Peruskonfiguraatio ( /etc/bind/named.conf )

```text
// /etc/bind/named.conf
options {
    directory "/var/cache/bind";

    // Kuuntele kaikissa liitännöissä
    listen-on { any; };

    // Rekursio sallittu tietyltä verkkokokonaisuudelta
    allow-recursion { 192.168.0.0/24; localhost; };

    // Forward DNS-osoitteet
    forwarders {
        8.8.8.8;
        8.8.4.4;
    };

    // Versio piilotus
    version "not disclosed";

    dnssec-validation auto;
};
```

### Zone-konfiguraatio ( /etc/bind/named.conf.local )

```text
// Esimerkkizone
zone "example.com" {
    type master;
    file "/etc/bind/zones/db.example.com";
    allow-transfer { none; };
};
```

### Zone-tiedosto ( /etc/bind/zones/db.example.com )

```text
$TTL    86400
@       IN      SOA     ns1.example.com. admin.example.com. (
                        2024092201 ; Serial
                        3600       ; Refresh
                        1800       ; Retry
                        604800     ; Expire
                        86400 )    ; Negative Cache TTL

; Name servers
@               IN      NS      ns1.example.com.
@               IN      NS      ns2.example.com.

; A records
@               IN      A       93.184.216.34
www             IN      A       93.184.216.34
mail            IN      A       93.184.216.35

; MX record
@               IN      MX      10 mail.example.com.

; CNAME
ftp             IN      CNAME   www.example.com.
```

### BINDin käynnistys ja testaus

```bash
# Tarkista konfigurointi
sudo named-checkconf

# Tarkista zone-tiedosto
sudo named-checkzone example.com /etc/bind/zones/db.example.com

# Käynnistä palvelu
sudo systemctl start bind9
sudo systemctl enable bind9
```

## Resolv.conf – Linux Resolver

`/etc/resolv.conf` määrittelee, missä DNS-palvelimessa asiakas kysyy:

```text
# /etc/resolv.conf
nameserver 8.8.8.8
nameserver 1.1.1.1
search example.com
options timeout:1 attempts:3
```

| Kenttä | Selitys |
|--------|---------|
| `nameserver` | DNS-palvelimen IP-osoite |
| `search` | Etsi-prefiksit |
| `options` | Asetukset (aika, yritykset) |

## Windows DNS

Windowsissa DNS-asennus on yksinkertainen:

```powershell
# Asenna DNS-palvelu
Add-WindowsFeature DNS -IncludeManagementTools

# Lisää primääri-zoni
Add-DnsServerPrimaryZone -Name "example.com" -ReplicationScope "Forest" -DynamicUpdate None
```

### Resolvointi (Windows)

```powershell
# Näytä DNS-asennus
Get-DnsClientServerAddress

# Aseta DNS-palvelin
Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses ("8.8.8.8", "1.1.1.1")
```

## DNS-testaus

### dig (Linux/macOS)

```bash
# Peruskysely
dig www.example.com A

# MX-tietue
dig www.example.com MX

# ALL-tietueet
dig www.example.com ANY
```

### nslookup (usein kaikilla alustoilla)

```bash
nslookup www.example.com 8.8.8.8
```

### drill (Linux)

```bash
# DNSSEC-tarkistus
drill www.example.com example.com -D
```

## Esimerkikonfiguraatio: Rekursiivinen Resolver

```text
Recursive Resolver (10.0.0.1)
├── Forward DNS → 8.8.8.8, 1.1.1.1
├── Cache: /var/cache/bind
└── Security: DNSSEC validation
```

### Esimerkkikysely

```bash
# Kysy rekursiivisen palvelimen kaudalta
dig @10.0.0.1 www.example.com

# Tulos:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 12345
;; flags: qr rd ra; QUERY: 1, ANSWER: 1
```

| Flagi | Selitys |
|-------|--------|
| `qr` | Vastaus (ei kysely) |
| `rd` | Recursively pyydetty |
| `ra` | Recursively sallittu |

## DNS-varastointi (Caching)

| Kerros | Tyhjennys | Selitys |
|--------|-----------|--------|
| Browser | Suljetessu selain | Selain suljetaessa |
| OS | `ipconfig /flushdns` | Windows |
| `sudo systemd-resolve --flush-caches` | Linux |
| Resolver | TTL päätyttyessä | DNS-palvelimessa |
| Authoritative | TTL määrittävä | Zone-tiedostossa |

!!! info "TTL ja varasto"

    DNS-palvelimet cachevat vastaukset määrätyn TTL:n mukaan. Tämä vähentää kyselyiden määrää, mutta estää päivitysten nopeaa leviämistä.

## DNS:n turvallisuus

| Toimenpide | Selitys |
|------------|--------|
| DNSSEC | Varmista kyselyn eheys |
| DNS-over-HTTPS | Salaa DNS-kyselyt |
| DNS-over-TLS | Salaa DNS TLS-kanavalla |

## Seuraavaksi

Kun olet ymmärtänyt DNS:n perusteet, siirrytään [13-ipv6/index.md](../13-ipv6/index.md)-osioon, jossa käsitellään IPv6-osoitteiston ja sen erityisuuksia.
