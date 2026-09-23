# IPv4-protokolla

IPv4 (Internet Protocol version 4) on verkkokerhon kolmannen kerroksen (verkkokerros) protokolla, joka määrittelee Internet-protokollan paketin rakenteen ja osoitteistuksen. Se on IANA:n ylläpitämä standardi, joka määritellään tarkasti **IETF RFC 791** (1981).

## Mikä IPv4 on?

IPv4 on **osoitteointiprotokolla**, joka antaa jokaiselle verkkolaitteelle yksiläisen 32-bittisen osoitteen. Tämä osoite kertoo, mistä laitteesta paketti lähetetään ja mihin laitteeseen se kuljettavaksi on suuntaus.

32-bittisestä osoitteesta muodostuu neljä oktetta (8 bittiä kerrallaan), jotka esitetään desimaalimuodossa pisteillä erotettuina:

```text
192.168.1.1
```

## Miksi IPv4 on tärkeä?

- **Reititys** – Paketit saadaan eri verkkoihin loppuun saakka kotiovitse
- **Yksiläisyys** – Jokaisen lähetyksen laitteessa on yksiläinen osoite
- **Nimennäisyys** – Osoitteen avulla laitteet voivat keskustella keskenään ilman keskitettyä ohjausta

## IPv4-paketin rakenne (RFC 791)

IPv4-paketin otsake on vähintään 20 tavua (160 bittiä). Sen kentät ovat:

| Kenttä | Bitit | Tarkoitus |
|--------|-------|-----------|
| Version | 4 | 4 = IPv4 |
| IHL | 4 | Otsakkeen pituus (minimuut 5 = 20 tavua) |
| DSCP | 6 | Laatu- ja prioriteetin merkintä (IPv4:ssä "Type of Service") |
| ECN | 2 | Congestion Notification |
| Total Length | 16 | Kokonaisen paketin koko (otsake + data) tavuissa |
| Identification | 16 | Fragmentaation tunniste |
| Flags | 3 | "Don't Fragment", "More Fragments" |
| Fragment Offset | 13 | Palikoiden sijainti kokonaisessa paketissa |
| TTL | 8 | Time To Live – jokainen hyppy vähentää yhdellä |
| Protocol | 8 | Yläkerroksen protokolla (TCP=6, UDP=17, ICMP=1) |
| Header Checksum | 16 | Otsakkeen virhe tarkistus |
| Source IP | 32 | Lähettävän laitteen IPv4-osoite |
| Destination IP | 32 | Käsittelevän laitteen IPv4-osoite |
| Options | 0–32 | Lisäkentät (jos IHL > 5) |

!!! example "Esimerkki IPv4-paketista"

    ```text
    4500003c00004000401100000a00000a0a00000a
    ```

    Tässä paketissa:
    - `45` → versio 4, IHL = 5 (20 tavua otsake)
    - `00` → DSCP/ECN = 0
    - `003c` → kokonaispituus = 60 tavua
    - `0000` → Identification = 0
    - `4000` → ei fragmentointia (DF-asetettu)
    - `40` → TTL = 64
    - `11` → protokolla = UDP (17)
    - `0000` → checksum (ei laskettu tässä esimerkissä)
    - `0a00000a` → lähdeosoite = 10.0.0.10
    - `0a00000a` → kohdeosoite = 10.0.0.10

## Fragmentaatio

Koska Ethernetin maksimaalainen kehys on noin 1500 tavua (MTU), suuremmat paketit jaetaan useaksi fragmentiksi. Jokaisen paketin `Identification`-kenttä saa saman arvon – vastaanottava laite kääntää ne kokonaisuudeksi takaisin. `Fragment Offset` kertoo, missä järjestyksessä osa kuuluu.

## Miksi TTL on tärkeä?

TTL (Time To Live) on suoja mekanismi verkon ääriin pääsemistä vastaan. Se aloitetaan arvolla (yleensä 64 tai 128) ja vähenee jokaisen hyppymksen yhteydessä. Kun TTL päätyy nollaan, pakettipala on "kadonnut" ja siitä lähetetään ICMP-ilmoitus (katso [ICMP](icmp.md) tai [10-tcp-udp](../10-tcp-udp/index.md)).

## Kuinka IPv4 liittyy ARP:ään?

IPv4 antaa loogisen osoitteen, mutta fyysisessä siirrossa tarvitsemme MAC-osoitteen. **ARP** (Address Resolution Protocol, RFC 826) kääntää IPv4-osoitteen MAC-osoitteeksi – kääntäen [03-ipv4/arp.md](arp.md)-dokumentissa.

## IPv4 ja reititys

Kun paketin kohdeosoite kuuluu toiseen verkkoon kuin lähtevä, reititin päättää, mihin seuraavaan hyppyyn paketin lähetetään. Tämä prosessi perustuu **reititystauluun**, joka muodostuu [04-dhcp-routing/staattinen-reititys.md](../04-dhcp-routing/staattinen-reititys.md)-osiossa.
