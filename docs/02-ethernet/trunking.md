# Trunkking

**Trunkking** (*trunking*) on prosessi, jossa useita VLAN-aita kuljetetaan
yhtä yhteyttä pitkin. Tämä mahdollistaa paketin läpikulun monen verkon yli
ilman, että jokaiselle VLANille tarvitsee oman fyysisen yhteyden.

!!! info "MIksen trunk?"

    - **Access-portti** (yksinkertainen portti): kantaa yhtä VLANia, tagaamatonta
    - **Trunk-portti** (trunk): kantaa useita VLAN-aita, tagattuina (802.1Q -tagit)

## 802.1Q -taggaus trunkissa

Kun paketti kulkee trunk-portin kautta, siihen lisätään **802.1Q -tagi** ennen
payload-kenttää. Tämä on kuvattu [VLAN](vlan.md) -dokumentissa, mutta
trunkissa se on erityisen tärkeä.

### Tagatut vs. tagaamattomat paketit

| Tyyppi | Selitys | Esimerkki |
| --- | --- | --- |
| **Tagattu** ( *tagged* ) | Pakettiin on lisätty 802.1Q -tagi | Lähetetään toisen kytjimen tai reitittelijän välillä |
| **Tagaamaton** ( *untagged* ) | Ei lisättyä tagia | Lähetetään päätelaitteelle (työasema, palvelin) |

!!! info "Tagaamattomat paketit pääosassa VLAN 1:ssa?"

    Usein, kun paketti on tagaton, se kuuluu **oletus-VLANiin** (yleensä VLAN 1).
    Tämä on varmaa otta erityisesti turvallisuussyistä, että päätelaitteet eivät
    koskaan käytä oletus-VLANia.

## Trunkin konfigurointi

### Trunkin perustekijät

| Osa | Selitys |
| --- | --- |
| **Encapsulation** | Tagaustapa (802.1Q) |
| **Native VLAN** | VLAN, jonka paketit lähetetään tagaamattomina |
| **Allowed VLANs** | VLANit, jotka sallitaan trunkissa |

### Trunkin Native VLAN

**Native VLAN** on erityinen VLAN, jonka paketit kuljetetaan trunkissa
**tagaamattomina**. Tämä tarkoittaa, että kaikki paketit tässä VLANissä
ovat ilman 802.1Q -tagia.

!!! warning "Native VLAN -turvallisuus"

    Native VLAN -tagaamattomat paketit voivat aiheuttaa turvallisuusriskiä.
    Jos esimerkiksi päätelaitteet ovat eri VLANeissa mutta kytkin ottaa niistä
    Native VLANiksi, paketit voivat kulkea eri VLANien välillä tunnistaen. Tästä
    syystä on suositeltavaa:

    1. Vältä Native VLAN:a (aseta se erilliseksi VLANiksi)
    2. Älä koskaan käytä VLAN 1:tä Native VLAN:nä

## Trunkin konfigurointi esimerkinä

Esimerkkinä, että kytkin A ja kytkin B on yhdistetty trunkin kautta, ja
halutaan kuljettaa VLANit 10, 20 ja 30:

### Kytkin A konfigurointi

```text
Switch-A> enable
Switch-A# configure terminal
Switch-A(config)# interface gigabitEthernet 0/1
Switch-A(config-if)# switchport mode trunk
Switch-A(config-if)# switchport trunk allowed vlan 10,20,30
Switch-A(config-if)# switchport trunk native vlan 99
Switch-A(config-if)# exit
```

### Kytkin B konfigurointi

```text
Switch-B> enable
Switch-B# configure terminal
Switch-B(config)# interface gigabitEthernet 0/1
Switch-B(config-if)# switchport mode trunk
Switch-B(config-if)# switchport trunk allowed vlan 10,20,30
Switch-B(config-if)# switchport trunk native vlan 99
Switch-B(config-if)# exit
```

!!! info "Mikä on sallittu?"

    - `switchport mode trunk` – asettaa portin trunk-moodiin
    - `switchport trunk allowed vlan 10,20,30` – sallii vain nämä VLANit tulla
    - `switchport trunk native vlan 99` – asettaa Native VLANiksi VLAN 99

## Trunkin liikenteen risteys (Trunk Leaguing)

Kun kaksi trunkia on kytketty virheellisesti (esim. molemmat päällä ja molemmat
samassa Native VLANissa), se voi aiheuttaa **trunkin liikenteen risteyttä**
( *trunking leaguing* ). Tämä on haavoittuvuus, jonka avulla hyökkääjä voi
saada pääsyn muihinkin VLANiin.

!!! warning "Torjunna trunking leaguing"

    Joka tapauksessa:

    1. Vältä Native VLAN:a
    2. Käytä **Private VLANs** ( *PVLANs* )
    3. Ota käyttöön trunkin tarkistus ( *trunk pruning* )

## Trunkin tarkka leikkaus (Trunk Pruning)

**Trunk Pruning** on prosessi, jossa estetään turhien VLANien pakettien
kulkeutuminen verkossa. Se on standardoitu IEEE 802.1Q -standardissa.

Esimerkiksi, jos trunkissa on VLANit 10–30, mutta VLAN 30 ei ole käytössä
johonkin päätepisteeseen, se voidaan estää ( *prune* ):

| Toimenpide | Selitys |
| --- | --- |
| **Manual pruning** | Käyttäjä määrittää manuaalisesti, mitkä VLANit kulkeutuvat |
| **VTP pruning** | Käytetään VLAN Trunking Protocol:ia (katkeraan) |

!!! tip "Käytännön vihje: Trunkin valinta"

    Kun valitset trunkin:

    1. Määritä ensin Native VLAN erilliseksi VLANiksi (esim. VLAN 999)
    2. Rajoita sallitut VLANit `allowed vlan`-komennolla
    3. Vältä VLAN 1:tä trunkissa missään tilanteessa
    4. Testaa yhteys jokaisen VLANin läpi erikseen

## Linkkityylien käyttö trunkissa

| Tyyppi | Nopeus | Selitys |
| --- | --- | --- |
| 1G | 1 Gb/s | Tyypillinen käyttöönotto |
| 10G | 10 Gb/s | Korkea suorituskyky vaatiiin |
| 40G / 100G | 40–100 Gb/s | Keskusverkot ( *core* ) |

!!! info "Linkin yhdistäminen trunkissa"

    Trunkin voi myös tehdä monen vuorostaan ( *link aggregation* ), esimerkiksi
    IEEE 802.3ad (LACP). Tämä antaa yhden trunkin kautta enemmän kapasiteettia.

## Liittyvät standardit

| Standardi | Selitys |
| --- | --- |
| IEEE 802.1Q | VLAN-taggaus |
| IEEE 802.1Qav | Audio-Video Bridging – priorisointi läpikäyneelle |
| IEEE 802.1QinQ | QinQ ( *stacked* VLAN) – kaksinkertainen taggaus |
| IEEE 802.1Qbg | EVB – Verkon kytkennöiden päivitys |
