# WLAN Access Pointit

**Access Point** (AP) on laitteisto, joka tarjoaa verkossa pääsyn langallisille laitteille. Se toimii silikkana langallisessa verkossa ja kiinnittää langattoman yhteyden verkkoon. Tämä dokumentti perustuu **IEEE 802.11** -standardiin.

## Mitä tämä sivu käsittelee?

- **Access Pointin rooli** – miten langatut laitteistot liittyvät verkkoon
- **SSID** – verkon nimi
- **Kanavat** – taajuuksien valinta
- **Voimakkuus** – lähetysvoimakas

## Access Pointin periaate

Access Point on verkossa kahden verkon välissä väline:

```text
Langallinen laite
    (WLAN)
      ↓
Access Point (AP)
    (Ethernet)
      ↓
Switch → Internet
```

1. Laite yhteyttää **SSID**–n avulla
2. AP vastaanottaa signaalin
3. AP kääntää langatun liikennety Ethernetiin
4. Liikenne kulkee jatkuvasti verkkoon

## SSID (Service Set Identifier)

**SSID** (Service Set Identifier) on verkon nimi, jonka langatut laitteet näkevät:

| Ominaisuus | Selitys |
|------------|---------|
| **Nimi** | 2–32 merkkiä |
| **Broadcast** | Julkinen – näkyy kaikille |
| **Hidden** | Ei-näkyvä – pitää piilossa |

!!! info "Hidden SSID"

    Hidden SSID piilottaa verkon nimen, mutta se ei lisää turvallisuutta – se pelkästään "security through obscurity".

## Kanavat (Channels)

IEEE 802.11 -standardi määrittelee kanavat 2.4 GHz ja 5 GHz taajuuksilla:

### 2.4 GHz (802.11b/g/n)

| Kanaa | Taajuuks | Käytetty |
|-------|----------|----------|
| 1 | 2.412 GHz | USA |
| 6 | 2.437 GHz | Eurooppa |
| 11 | 2.462 GHz | Yleinen |

### 5 GHz (802.11a/n/ac/ax)

| Kanaa | Taajuuks | Selitys |
|-------|----------|---------|
| 36 | 5.180 GHz | Alhaisempi |
| 149 | 5.745 GHz | Korkeampi |

## Kanavan valinta

| Kriteeri | Selitys |
|----------|--------|
| Vältä päällekkäisiä | Valitse eri kanavat |
| Voimakkuus | Rajoita kuuluvuus |
| Taajuu | Vältä 5 GHz, jos laite ei tue |

## Voimakkuus (Transmit Power)

| Säätö | Selitys |
|-------|---------|
| Korkea | Laajempi kuvaus |
| Alhainen | Pieni kuuluvuus |
| Automaattinen | Säädytään kuuluvuuden perusteella |

## Access Pointin tyypit

| Tyyppi | Selitys |
|--------|---------|
| **Autonomous AP** | Itsenäinen (esim. Cisco Aironet) |
| **Lightweight AP** | Tarvitsee ohjainpalvelimen (controller) |
| **Cloud-managed AP** | Hallitaan pilvessä (esim. Ubiquiti) |

## Access Pointin konfigurointi (Cisco)

```text
interface Dot11Radio0
  ssid Corporate
    authentication open
    authentication key-management wpa
    guest-mode
  no shutdown
```

## Esimerkkiverkko

```text
SSID: Office-WiFi
Kanavi: 6 (2.4 GHz)
Salaus: WPA2-PSK
AP: 10.0.0.2/24

Yhteydet:
PC1 → WLAN → AP → Switch → Reititin
```

## AP:n rajoitukset

| Rajoite | Selitys |
|---------|--------|
| Signaalin leviäminen | Kauas kulkeva signaali voi kuulua ulkopuolisille |
| Kanavan kuormitus | Ylikuormaatutut kanavat voivat hidastaa |
| Salauksen puute | Jos salaus puuttuu, yhteys on helposti kaivattavissa |

## Seuraavaksi

Seuraavaksi tarkastellaan [wlan-salaus.md](wlan-salaus.md), jossa käsitellään WLAN-verkkoissa käytetyt salausmekaniikat: WEP, WPA2 ja WPA3.
