# NAT:n tyypit

NAT:llä on useita eri muotoja, joista jokainen sopii eri käyttötarkoitukseen. Tämä dokumentti perustuu **RFC 3022** ja **RFC 4631** (NAT traversal -standardiin).

## Mitä tämä sivu käsittelee?

- **Static NAT** – kiinteä käännös
- **Dynamic NAT** – vuorovaikutteinen käännös
- **PAT** – Port Address Translation (N:1-muunnos)

## Static NAT

**Static NAT** on kiinteä yhden-yhden muunnos, jossa yksi private-osoite aina käännetään yhteen julkaan osoitteeseen:

```text
10.0.0.5  ←→  203.0.113.5
10.0.0.6  ←→  203.0.113.6
```

### Hyödyt

| Hyöty | Selitys |
|------|---------|
| Ennustus | Muunnos on aina sama |
| Palvelut | Palvelin päällä jatkuvasti odottaa yhteyttä |
| Yksinkertainen | Ei tarvitse liikaa konfigurointia |

### Esimerkkikonfiguraatio (iptables)

```bash
iptables -t nat -A PREROUTING -d 203.0.113.5 -j DNAT --to-destination 10.0.0.5
iptables -t nat -A POSTROUTING -s 10.0.0.5 -j SNAT --to-source 203.0.113.5
```

## Dynamic NAT

**Dynamic NAT** antaa NAT-laitteelle valita vapaa julkinen osoite taulusta:

```text
Pool: 203.0.113.100–203.0.113.200
10.0.0.5 → 203.0.113.100 (tämä istunto)
10.0.0.6 → 203.0.113.101 (seuraava istunto)
```

### Esimerkkikonfiguraatio (iptables)

```bash
# Määritä address pool
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

# Tai valitse erityinen address pool
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 203.0.113.100-203.0.113.200
```

!!! info "MASQUERADE vs SNAT"

    - **SNAT --to-source**: Käytetään kiinteälle julkiselle osoitteelle
    - **MASQUERADE**: Käytetään dynaamiselle verkolle (esim. DHCP)

## PAT (Port Address Translation)

**PAT** (Port Address Translation) – myös tunnettu nimellä **NAT44** – yhdistää useita private-osoitteita yhteen julkiseen osoitteeseen eri porttien avulla:

```text
10.0.0.5:1024 → 203.0.113.5:10001
10.0.0.6:1024 → 203.0.113.5:10002
10.0.0.7:1024 → 203.0.113.5:10003
```

### Kuinka PAT toimii?

1. Lähettäjältä saatu paketti kirjataan
2. Lähdeosoite ja -portti muutetaan julkiseen osoitteeseen + satunnaiseen/porttiin
3. Vastaanotto palaa samoin
4. NAT palauttaa alkuperäisen lähdeosoitteen

### Esimerkkikonfiguraatio (iptables)

```bash
# Yksi julkinen osoite kaikille
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 203.0.113.5

# PAT toimii oletuksen mukaisesti porttien avulla
```

## NAT-tyypien vertailu

| Tyyppi | Määrä | Portti | Käyttö | Resurssit |
|--------|-------|-------|--------|-----------|
| Static NAT | 1:1 | Sama | Palvelimet | Vakaa |
| Dynamic NAT | N:1 | Sama | Käyttäjät | Rajoitettu |
| PAT | N:1 | Eri | Laajat verkot | Tehokas |

## Esimerkkiverkko

```text
Sisäverkko (10.0.0.0/24)
    ↓
NAT-reititin (203.0.113.5)
    ↓
Internet (julkinen IP)
```

Tässä:

- **PAT** mahdollistaa, että 250 laitteesta käyttää yhtä julkista osoitetta
- Jokainen yhteys saa erillisen portin
- NAT muuntaa ja palauttaa osoitteet automaattisesti

## NAT:n valinta

| Tilanne | Suositus |
|---------|----------|
| Palvelin julkisena | Static NAT |
| Rajoitettu julkinen osoitteita | Dynamic NAT |
| Laaja sisäverkko | PAT |

## Seuraavaksi

Seuraavaksi tarkastellaan [nat-konfigurointi.md](nat-konfigurointi.md), jossa nähdään konkreettisia esimerkkejä NAT:n konfiguroinnista eri laitteistoissa.
