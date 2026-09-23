# Oletusyhdyskäytävä (Default Gateway)

**Oletusyhdyskäytävä** (default gateway) on reititin osoite, jonka kautta laitteet voivat lähettää paketit eri verkoihin – esimerkiksi internettiin. Se on yleensä reitittimen osoite samassa aliverkossa kuin laitteisto.

## Miksi oletusyhdyskäytävä on tarpeen?

Kun laitteisto lähettää paketin, se tarkistaa ensin:

> "Onko kohdeosoite samassa verkossa kuin minä?"

| Tilanne | Toimenpide |
|---------|------------|
| **Samassa verkossa** | Lähetä suoraan (ARP-pyyntö vastaanottajalle) |
| **Eri verkossa** | Lähetä oletusyhdyskäytävään (gateway) |

Oletusyhdyskäytävä on siis "lähtezysportti" – pakettien lähtiessä verkosta ulos.

## Kuinka oletusyhdyskäytävä annetaan?

Oletusyhdyskäytävä annetaan tyypillisesti **DHCP:n yhteydessä** – katso [dhcp-prosessi.md](dhcp-prosessi.md). Esimerkin vuoksi:

```text
DHCPACK:
  Subnett-mask: 255.255.255.0
  Router (gateway): 192.168.1.1
  DNS: 8.8.8.8
```

## Reititystaulun rooli oletusyhdyskäytävässä

Reitittimen reititystaulussa oletusyhdyskäytävä näkyy erityisenä **oletusreitinä** (`0.0.0.0/0`):

| Reitti | Maski | Seuraaja | Selitys |
|--------|-------|------------|---------|
| 0.0.0.0 | 0.0.0.0 | 192.168.1.254 | Kaikki paketit – lähetä tähän |
| 192.168.1.0 | 255.255.255.0 | 0.0.0.0 | Tämä verkko – paikallinen |

"0.0.0.0/0" tarkoittaa "mikään verkko" – kaikki paketit, jotka eivät ole paikallista, lähetetään tähän seuraajaan.

## Esimerkki: Asiakaan reititystaulu

```bash
ip route show
# Tuloste esimerkiksi:
# 192.168.1.0/24 dev eth0 proto kernel scope link src 192.168.1.100
# default via 192.168.1.1 dev eth0 proto dhcp metric 100
```

Tässä:

- `192.168.1.0/24` → paikallinen verkko (lähetetään suoraan)
- `default via 192.168.1.1` → kaikki muu (lähetetään gateway:n kautta)

## Miksi se on "oletus"?

"Oletusyhdyskäytävä" = "jos mitään muuta ei löydy, lähetä tänne". Tämä on tärkeä ero:

| Reitti | Selitys |
|--------|----------|
| **Spesifinen reitti** | "Tämä tarkka verkko → tänne" |
| **Oletusreitti** | "Kaikki muu → lähetä oletusyhdyskäytävään" |

Spesifiset reitit aina etusijalle. Oletusreitti on "varattu tavarat" – kaikki, mikä ei ole spesifimpiin reitteihin kuulunut.

## Useampi oletusyhdyskäytävä?

Periaatteessa yksi oletusyhdyskäytävä riittää. Jos verkossa on useita reitittimiä:

- **Yleinen versto** – yksi oletusyhdyskäytävä riittää, koska reitit päättävävät paketeista
- **Kaksinkertainen ylikuormitus** – HSRP/VRRP -protokollat tarjoavat virtuaalisen oletusyhdyskäytävän

## Esimerkki: Asiakkaan asetukset

```ini
# /etc/netplan/01-netcfg.yaml (Linux)
network:
  version: 2
  ethernets:
    eth0:
      dhcp4: true                  # DHCP antaa kaiken muun
      # tai manuaalisesti:
      # addresses: [192.168.1.100/24]
      # routes:
      #   - to: default
      #     via: 192.168.1.1
```

## Seuraavaksi

Kun olet ymmärtänyt oletusyhdyskäytävän roolin, tarkastellaan [staattinen-reititys.md](staattinen-reititys.md), jossa käsitellään reitittimen puoleiset asetukset – siis miten itse reititin päättää kuljettaa paketit.
