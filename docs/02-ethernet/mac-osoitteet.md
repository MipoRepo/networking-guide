# MAC-osoitteet

**MAC-osoite** (*Media Access Control address*, lyh. **MAC-osoite**) on
48-bittinen ainutlaatuinen tunnus, joka on kiinnitetty jokaiseen verkkokorttiin
(NIC:ään). Se on standardoituna IEEE 802 -standardilla ja on keskeinen osa
linkkikeran osoitteistusta.

!!! info "MAC-osoitteiden rooli"

    MAC-osoite toimii kuin verkon "postiosoite" linkkikerroksessa. Kun laite
    lähettää paketin verkon läpi, paketin lähtee ja päätakuu sisältävät
    lähettäjän ja vastaanottajan MAC-osoitteet. Kytkin lukee nämä osoitteet ja
    päättää, minne pakettia kuljetetaan.

## MAC-osoitteen muoto ja rakenne

MAC-osoite on 48 bitiä, joka esitetään yleensä:

1. **Kuudessa tavussa heksalukuina** eroteltuna kaksoispisteellä:

    ```text
    00:1A:2B:3C:4D:5E
    ```

2. **Hexadesimaalimuodossa** välilyöneillä:

    ```text
    00-1A-2B-3C-4D-5E
    ```

3. **Bittijonona** (6 tavua = 48 bitiä):

    ```text
    00000000 00011010 00101011 00111100 01001101 01011110
    ```

### OUI ja laitetyksioyksiköt

MAC-osoitteen kahdessa osaan on:

| Osa | Pituus | Selitys |
| --- | --- | --- |
| **OUI** (*Organizationally Unique Identifier*) | 3 tavua (24 bitiä) | Valmistajan yksilöllinen tunnus |
| **Laitetyksikön osa** | 3 tavua (24 bitiä) | Valmistajan antama ainuttainen tunnus |

!!! info "Mac-osoitteen OUI:n tarkistus"

    OUI:t ovat ISO:n ylläpitämälista. Jos haluat tarkistaa, ketk valmistajat
    omistavat tietyn OUI:n, voit katsella sen esimerkiksi osoitteessa
    https://maclookup.app/.

## Multicast- ja Broadcast-osoitteet

MAC-osoitteet jaetaan kolmeen ryhmään:

| Tyyppi | Esimerkkimuoto | Selitys |
| --- | --- | --- |
| **Unicast** | `00:1A:2B:3C:4D:5E` | Yksi vastaanottava laite |
| **Multicast** | `01:00:5E:00:00:01` | Usea vastaanottava laite |
| **Broadcast** | `FF:FF:FF:FF:FF:FF` | Kaikki laitteet verkossa |

### Multicast

Multicast-osoitteissa **ensimmäinen kolme tavua määrittelevät**:

- `01:00:5E` on IPv4-multicastille varattu alue (alkuperäiset 23 tavua)
- `33:33` on IPv6-multicastille varattu alue

### Broadcast

Broadcast-osoite `FF:FF:FF:FF:FF:FF` lähetetään kaikille laitteille samassa
verkossa. Se on esimerkiksi käytössä **ARP-kyselyissä**, joissa laite etsii
joltakulta tiettyä IP-osoitetta vastaavan MAC-osoitteen.

## Universaalisuus ja paikallisuus

MAC-osoitteen ensimmäinen kolmoite (tavu) määrää, onko kyseessä:

| Bitti | Arvo | Selitys |
| --- | --- | --- |
| **U/L-bitti** (Universal/Local) | 0 | Globaalisti rekisteröity (valmistajan osoite) |
| **U/L-bitti** (Universal/Local) | 1 | Paikallinen (käyttäjän määrittelemä) |
| **IG (Individual/Group)** | 0 | Yksittäinen laite (unicast) |
| **IG (Individual/Group)** | 1 | Ryhmä (multicast tai broadcast) |

!!! warning "Paikalliset osoitteet voivat aiheuttaa ongelmia"

    Jos MAC-osoitteen ensimmäinen tavu on esimerkiksi `02` (tai muu, jossa
    U/L-bitti on 1), se tarkoittaa, että osoite on **paikallinen** eikä sitä ole
    rekisteröity valmistajalle. Tämä voi aiheuttaa ongelmia verkossa, jos useampi
    laite käyttää samaa paikkaista osoitetta.

## MAC-osoitteen tarkastus

Voit tarkastaa oman MAC-osoitteemsi seuraavilla komennoilla:

| Käyttöjärjestelmä | Komento |
| --- | --- |
| Linux / macOS | `ip link` tai `ifconfig` |
| Windows | `ipconfig /all` |
| Kaikki | `arp -a` (näyttää naapolin MAC-osoitteet) |

Esimerkin Linux-komennon tulos:

```text
eth0: ether 00:1a:2b:3c:4d:5e
```

!!! tip "Muistutettuna käytännössä"

    MAC-osoitteet ovat **kiemurotettuja** laitteissa. Ne muuttuvat ainoastaan,
    jos ne annetaan ohjelmistomme, kuten virtuaalisissa koneteissä. Tämä on
    tärkeä ominaisuus virtualisoinnissa, jossa usea virtuaalinen konetti voi
    jakaa saman fyysisen NIC:n, mutta jokaisella pitää olla oma MAC-osoitteensa.

## Liittyvät standardit

| Standardi | Selitys |
| --- | --- |
| IEEE 802 | MAC-osoitteiden ja niiden osoitteistuksen perusstandardi |
| IEEE 802.1AB | Link Layer Discovery Protocol (LLDP) |
| IEEE 802.1AE | MAC Sec (salattu tiedonsiirto) |
