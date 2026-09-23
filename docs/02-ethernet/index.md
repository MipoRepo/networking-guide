# Ethernet, kytkintä ja VLANit

Tämä osio käsittelee linkkikeran (OSI-kerroksen 2) keskeisiä mekanismeja:
miten laitteet yhdistyvät fyysisesti verkkoon, miten osoitteistus toteutuu
MAC-osoitteilla, miten kytkimet kuljettavat paketit, ja miten virtuaaliset
verkot (VLANit) mahdollistavat verkon logiikan erottamisen fyysisestä
infrastruktuurista.

## Mitä tämä osio kattaa?

| Aihe | Selitys |
| --- | --- |
| Ethernet | Linkkikeran vakiintunut standardi, joka määrittelee fyysisen siirron ja kehysmuodon. |
| MAC-osoitteet | 48-bittinen osoite joka on kiinnitetty jokaisen verkkokortin (NIC:n) alla. |
| Ethernet-kehys | Paketin muoto, joka kulkee linkkikerroksessa. |
| Kytkintä (Switching) | Laite, joka kuljettaa kehyksiä paikasta toiseen MAC-osoitteiden perusteella. |
| VLAN | Virtuaalinen erottelu fyysisestä verkosta loogisten verkkojen osaksi. |
| Trunkking | Miten useita VLAN-aita kuljetetaan samalla yhteydessä. |

## Miksi nämä ovat tärkeitä?

Verkkoyhteyden perdeokeissa on kolme ongelmaa:

1. **Miten laite tietää, mihin paketti lähetetään?** Tämä ratkaistaan osoitteistuksemmall – kunkin laitteen on oltava ainutlaatuinen tunnus.
2. **Miten paketit päätyvät oikeaan paikkaan verkossa?** Tämä ratkaistaan kytkemin – laitteisto, joka lukee osoitteet ja päättää kuljetuksen.
3. **Miten eri ryhmät voivat jakaa saman fyysisen verkon?** Virtuaalisilla verkoilla (VLAN) voidaan jakaa loogisia erotteluja eikä tarvitse rakentaa erillistä fyysistä verkkoa.

!!! info "Lisätietoa: Linkkikerros ja sen standardit"

    Linkkikerros (OSI-kerros 2) on vastuussa:

    - Datan välityksestä fyysisen välityslaitteen kautta
    - päätösten tekemisestä MAC-osoitteiden perusteella
    - Virheiden havaitsemisesta kehyksessä (FCS)

    Tärkeät standardit tässä kerroksessa ovat IEEE 802.3 (Ethernet),
    IEEE 802.11 (WLAN) ja IEEE 802.1Q (VLAN-taggaus).

## Miten jatkaa?

Suositeltu järjestys:

1. **[Ethernet](ethernet.md)** – Aloita linkkikeran peruskäsitteet.
2. **[MAC-osoitteet](mac-osoitteet.md)** – Sitten osoitteistus, jolla kukin laite on ainutlaatuinen.
3. **[Ethernet-kehys](frame.md)** – Kuinka ne paketit muotoillaan täsmälleen.
4. **[Kytkintä (Switching)](switching.md)** – Miten paketit kuljetetaan lopulta.
5. **[VLAN](vlan.md)** – Sitten siirrymään verkon erottamiseen.
6. **[Trunkking](trunking.md)** – Lopuksi miten useita VLAN-aita kuljetetaan yhteen.

!!! tip "Käytännön vihje"

    Jos pelaat verkkokokeiluja (esimerkiksi [Packet Tracer](https://www.netacad.com/portal/learn/packet-tracer)
    tai [GNS3](https://www.gns3.com/)), kokeile aluksi yksinkertaista verkkoa:
    kaksi päätelaitetta yhteydessä kytkimeen. Lisää sitten VLANit ja tarkista,
    kuinka liikenne etenee eri verkoissa.
