# WLAN-salaus (WLAN Encryption)

**WLAN-salaus** on mekanismi, joka suojaa langattoman verkin (WLAN) liikennetta. Se perustuu **IEEE 802.11 **-standardin määrittelyihin, joissa on määritelty useampia salausversioita: **WEP**, **WPA**, **WPA2** ja **WPA3**.

## Mitä tämä sivu käsittelee?

- **WEP, WPA, WPA2, WPA3** – versiot ja neuvottelut
- **Salausmekaniikat** – WEP, TKIP, CCMP
- **Salausasetukset** – WPA-Personal vs WPA-Enterprise

## WEP (Wired Equivalent Privacy)

**WEP** on vanhin WLAN-salausstandardi (IEEE 802.11). Se käyttää **RC4-salauksena** ja on tuttu virheisiin:

### Miksi WEP on turvatonta?

| Ongelma | Selitys |
|---------|--------|
| **Lyhyt siivu** | 40–128 bitin avain on helposti murattavissa |
| **Käytetty IV** | Samat vektorit toistuvat → helposti kaivattavissa |
| **Ei tarkistusta** | Paketit voivat katosaa ilman virheilmoitusta |

!!! warning "Älä käytä WEP:iä"

    WEP on **poistettu käytöstä** useissa ohjelmistoissa. Se voidaan murata muutamassa minuudessa.

## WPA (Wi-Fi Protected Access)

**WPA** on välitetty WEPin tilalle. Se tukee:

- **TKIP** (Temporal Key Integrity Protocol) – päivitettävä avain
- **WPA-Personal** – salasana
- **WPA-Enterprise** – RADIUS-tunnistautuminen

## WPA2 (Wi-Fi Protected Access II)

**WPA2** on nykyaikainen standardi (IEEE 802.11i). Se käyttää **AES/CCMP** -salauksena:

| Ominaisuus | Selitys |
|------------|---------|
| **AES** | Salausalgoritmi |
| **CCMP** | Laitteen tarkistus |
| **Pre-shared Key** | WPA2-Personal (salasana) |
| **802.1X/EAP** | WPA2-Enterprise (tunnistautuminen) |

### WPA2-Personal

Käytetään kotiverkoissa:

- **Salasana** (PSK) on 8–63 merkkiä
- AES/CCMP -salaus
- 4-vaiheinen käsintutkiminen (4-way handshake)

### WPA2-Enterprise

Käytetään yrityksissä:

- **802.1X/EAP** -tunnistautuminen
- RADIUS-palvelin (esim. FreeRADIUS)
- Käyttäjätunnistus (esim. käyttäjätunnus + salasana)

## WPA3 (Wi-Fi Protected Access III)

**WPA3** on uusin standardi (IEEE 802.11w/s). Se korjaa WPA2:n puutteet:

| Ominaisuus | WPA2 | WPA3 |
|-----------|------|------|
| SALATTAVUUS | AES-128 | AES-128/256 |
| Tunnistautuminen | 4-way handshake | SAE (Simultaneous Authentication) |
| Forward Secrecy | Ei takaa | Kyllä |

### SAE (Simultaneous Authentication of Equals)

SAE on WPA3:n uusi tunnistautumismekanisomi, joka tukee:

- **Forward secrecy**: Jos salasana pureudetaan, aiemat yhteydet eivät ole vaak näkyvissä
- **Brute-force resistance**: Salasanan arvaus on hankalampi

## Salausvertailu

| Mekani | Salaus | Status |
|--------|--------|--------|
| **WEP** | RC4 | Poistettu |
| **WPA** | TKIP | Vanhentunut |
| **WPA2** | AES/CCMP | Nykyinen |
| **WPA3** | AES/SAE | Uusin |

## Esimerkkikonfiguraatio

### WPA2-Personal (Cisco)

```text
interface Dot11Radio0
  ssid Corporate
    authentication open
    authentication key-management wpa
    wpa-psk ascii 0 MySecretPassword
```

### WPA2-Enterprise (Cisco)

```text
interface Dot11Radio0
  ssid Corporate
    authentication dot1x radius
    guest-mode
```

## Salausasetusten valinta

| Tilanne | Suositus |
|---------|----------|
| Kotiverkko | WPA2-Personal (vähintäänän) |
| Yritys | WPA2-Enterprise tai WPA3-Enterprise |
| Uusi laite | WPA3 (jos tuettu) |

## Seuraavaksi

Kun olet ymmärtänyt päätelaitteet ja WLAN-verkot, siirrytään [12-dns/index.md](../12-dns/index.md)-osioon, jossa käsitellään DNS-protokollan toiminnasta.
