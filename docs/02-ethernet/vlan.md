# VLAN

**Virtuaaliverkko** (*Virtual Local Area Network*, lyh. **VLAN**) on
linkkikerron tasoissa oleva looginen erottelu fyysisestä verkosta. Se mahdollistaa
verkon jakamisen loogisia verkkoja eikä tarvitse lisätä uusia fyysisiä laitteita.

!!! info "Miksi VLANit ovat tärkeitä?"

    VLANit mahdollistavat verkon **osametallisuuden** ( *segmentation* )
    ilman, että jokaiselle ryhmälle tarvitsee omat kytkimet ja kaapelit. Tämä
    tuo mukanaan monia etuja:

    - **Turvallisuus**: Erilaiset ryhmät (esim. henkilöstö ja vieraat) ovat erillisissä verkoissa.
    - **Suorituskyky**: Liikenne on erillään, eikä yksi ryhmä kuormita toista.
    - **Hallinta**: Kukin VLAN voi olla oma aliverkko.

## 802.1Q -standardi

**IEEE 802.1Q** on standardi, joka määrittelee VLANien toiminnon Ethernet-verkoissa.
Se mahdollistaa paketin **tunnistamisessa** VLAN-ryhmän ( *VLAN ID* ,VID) kautta.

### VLAN-Tag

Kun paketti kulkee verkossa, **802.1Q -tagi** lisätään paketin perään EtherType-kentän
ja ennen payload-kenttää. Tagi on 4 TKY:tä (32 bitiä):

| Kenttä | Pituus | Selitys |
| --- | --- | --- |
| TPID | 2 TKU | Tag Protocol Identifier – aina `0x8100` |
| TCI | 2 TKU | Tag Control Information – sisältää PCP, DEI, VID |

### TCI-kenttä yksityiskohtaisesti

TCI (Tag Control Information) on 16-bittinen kenttö, joka jakaisee kolmeen osaan:

| Osa | Pituus | Selitys |
| --- | --- | --- |
| **PCP** | 3 bitiä | Prioriteetti (0–7) |
| **DEI** | 1 bitti | Drop Eligible Indicator (ent. CFI) |
| **VID** | 12 bitiä | VLAN-tunniste (0–4095) |

!!! info "PCP-prioriteetit"

    PCP (Priority Code Point) määrittää liikenteen prioriteetin. Tärkeimmät ovat:

    - **PCP 6 (Network Control)** – Kriittinen liikenne (esm.STP)
    - **PCP 5 (Video)** – Videoliikenne (esm. IPTV)
    - **PCP 4 (Voice)** – Puhelinliikenne (VoIP)
    - **PCP 0 (Best Effort)** – Normaali tietoliikenne

### VLAN-IDs

| VID | Selitys |
| --- | --- |
| 0 | Vara (ei käytetä) |
| 1 | Oletus-VLAN (usein "data") |
| 2–4093 | Käytetytään VLANit |
| 4094 | Vara |
| 4095 | Vara |

!!! warning "VLAN 1:stä on vältettävä käytännössä"

    VLAN 1:ssa on **oletuskonfigurointi** jokaisessa kytkimessä, ja se on
    tunnettu turvallisuusriski. Usein siksi on suositeltavaa poistaa kaikki
    portit VLAN 1:stä ja siirtää ne omioihin VLAN- tai haluamiin verkoihin.

## VLANien konfigurointi

VLANit konfiguroidaan yleensä kytkimen puolelta. Esimerkiksi Cisco-kytkingissä:

```text
Switch> enable
Switch# configure terminal
Switch(config)# vlan 10
Switch(config-vlan)# name Staff
Switch(config-vlan)# exit
Switch(config)# vlan 20
Switch(config-vlan)# name Guest
Switch(config-vlan)# exit
Switch(config)# interface fastethernet 0/1
Switch(config-if)# switchport mode access
Switch(config-if)# switchport access vlan 10
Switch(config-if)# exit
Switch(config)# interface fastethernet 0/2
Switch(config-if)# switchport mode access
Switch(config-if)# switchport access vlan 20
Switch(config-if)# exit
```

### Konfigurointi esimerkinä

Esimerkiksi, jos halutaan luoda yhteys järjestelmälle:

| Laite | VLAN | Portti |
| --- | --- | --- |
| Työasema 1 | 10 (Staff) | Fa0/1 |
| Työasema 2 | 10 (Staff) | Fa0/2 |
| Reititin | Trunk | Fa0/24 |

Tässä:

- Työasemat 1 ja 2 ovat samassa VLAN 10:ssa, ja ne voivat keskustella suoraan
- Reititin liittyy trunk-porttiin, jolloin se voi kuljettaa useita VLAN-aita

!!! info "VLANit eivät rajoita verkkoa"

    VLANit eivät itse rajoita verkkoa – ne ovat vain loogisia erotteluita. Jos
    halutaan, että kaksi VLAN-aitaa kommunikoi kansellaan, tarvitaan
    **reititin** (katso osio [07-reititys](../07-reititys/index.md)).

## Inter-VLAN-reititys (Router on a Stick)

Kun halutaan, että eri VLANit voivat kommunikoida, tarvitaan **reititin**
tai **Layer 3 -kytkin**. Yksi yleinen tapa on "kytkin ja reititin yhdistäminen"
(*router on a stick*):

| Vaihe | Selitys |
| --- | --- |
| 1 | Kytkin konfiguroidaan trunkiksi reitittelijälle |
| 2 | Reititin sub-interface ( *subinterfaces* ) on kytketty VLANiin |
| 3 | Reititin reititystaulu päättää, minne paketit kuljetetaan |

Tämä on kuvattu tarkemmin
[Staattinen reititys](../04-dhcp-routing/staattinen-reititys.md)-dokumentissa.

## VLANien käyttöönottoa tukemaan ominaisuudet

| Ominaisuus | Selitys |
| --- | --- |
| **Private VLAN** | Erottelee yhteyttä intra-VLAN-verkon sisällä |
| **VLAN pruning** | Estää valitsemattoman liikenteen kierrosta verkossa |
| **VTP** | VLAN Trunking Protocol – synkronoi VLANit kytkinten välillä |

!!! tip "Käytännön vihje"

    Kun aloitat VLAN-konfiguroinnin:

    1. Määritä tarvittavat VLANit ensin ( *management* , Staff, Guest, jne)
    2. Liitä laitteet oikeisiin portteihin access-moodissa
    3. Liitä trunk-portti reitittelijälle tai toiseen kytkimeen
    4. Testaa yhteyttä jokaisessä VLANissa erikseen ennen kuin siirryt seuraavaan

## Liittyvät standardit

| Standardi | Selitys |
| --- | --- |
| IEEE 802.1Q | VLAN-taggaus |
| IEEE 802.1ad | QinQ (tupla taggaus) – usein operaattoreissa |
| IEEE 802.1s | Multiple Spanning Trees – VLAN- ja RSTP-yhdistelmä |
