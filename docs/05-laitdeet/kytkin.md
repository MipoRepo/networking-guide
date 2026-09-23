# Kytkin (Switch)

**Kytkin** (switch) on verkkolaitteisto, joka yhdistää useita laitteita yhteiseen verkkoon. Se on **Layer 2** (linkitys)-laitteisto, joka käyttää MAC-osoitteita päätösten tekemiseen. Tämä dokumentti on johdonmukainen [02-ethernet](../02-ethernet/switching.md)-osion kanssa.

## Mikä kytkin on?

Kytkin on laite, joka:

- Saa kehykset useista porteista
- Tietää, mikä MAC-osoite kuuluu mihin porttiin
- Lähettää kehykset tarkalle kohdelle (ei broadcastia)

## Miksi kytkin on tärkeä?

| Ilman kytkinden | Kytkimen kanssa |
|------------------|-----------------|
| Kaikki kehykset menevät kaikkiin portteihin | Kehykset menevät vain oikeaan porttiin |
| Kaksinkertainen varaus – varatut osoitteet | Tunnistaa kaikki osoitteet |
| Kaksinkertainen kokonaisuus – kaikki yhteydet | Useita yhteyksiä samanaikaisesti |

## MAC-osoite-taulu (MAC Address Table)

Kytkin ylläpitää taulukkoa, jossa on:

| MAC-osoite | Portti | VLAN |
|------------|--------|------|
| 00:11:22:33:44:55 | Gi0/1 | VLAN 10 |
| 66:77:88:99:AA:BB | Gi0/2 | VLAN 10 |

Kun kytkin saa kehyksen, se:

1. Tallettaa lähettäjän MAC-osoitteen ja siitä tulevan portin
2. Tarkistaa kohde-MAC-osoitteen
3. Lähettää kehykset vain oikeaan porttiin

## Flooding, Filtering, Forwarding

Kytkin käyttää kolmea perusperiaattia:

| Toiminto | Selitys | Esimerkki |
|----------|---------|-----------|
| **Flooding** | Lähetä kaikkiin portteihin (ei lähettäjälle) | Tuntematon kohde-MAC |
| **Filtering** | Älä lähetä porttiin, jossa se tuli | Saman portin sisään-tulo |
| **Forwarding** | Lähetä tarkalle portille | Tunnettu kohde-MAC |

## Store-and-Forward vs Cut-Through

| Mekanismi | Selitys | Hyöty |
|----------|---------|-------|
| **Store-and-Forward** | Lukee koko kehyksen, tarkistakseen virheet | Tarkkuus, virheenjärkitys |
| **Cut-through** | Lähetä heti, kun käänne tiedetään | Nopeus, viive (latency) |

!!! info "Virheenjärkitys"

    Store-and-Forward -mallissa tarkistetaan FCS-ele (Frame Check Sequence) – jos se ei täsmää, kehys hylätään hiljallisesti.

## Porttien tilat (Port States)

Kytkin käsittelee yhteyttä useissa vaiheessa:

| Tila | Selitys |
|-------|---------|
| **Blocking** | Ei hyväksy kehykiä (esim. STP-silmus) |
| **Listening** | Odottaa, kuuntelee yhteyttä |
| **Learning** | Oppii MAC-osoitteet |
| **Forwarding** | Lähettää kehykset normaalisti |

## Spanning Tree -yhteys (STP)

Kytkimet käyttävät STP:ää estämään verkkosilmukset. Tämä on tärkeä osa [06-spanning-tree/index.md](../06-spanning-tree/index.md).

## Esimerkki: Porttien tarkastelu

```bash
show mac address-table
show spanning-tree interface GigabitEthernet0/1
show interfaces status
```

## Multiportti-kytkin

| Tyyppi | Portit | Käyttö |
|--------|--------|---------|
| Tarjoilijat (Unmanaged) | 5–8 | Kotiverkot |
| Hallitut (Managed) | 24–48 | Organisaatiot |
| Layer 3 -kytkin | 24–48 | Yhdistää Layer 2 ja Layer 3 |

## Seuraavaksi

Kun olet ymmärtänyt kytkimen toiminnan, siirrytään [reititin](reititin.md)-osaan, joka käsittelee Layer 3 -reitittimen roolia verkojen välisessä yhteydessä.
