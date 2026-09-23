# DHCP (Dynamic Host Configuration Protocol)

**DHCP** (Dynamic Host Configuration Protocol) on IETF:n määrittelemä protokolla, joka tarjoaa verkkolaitteille automaattisesti IPv4-asetukset: osoitteen, aliverkon maskin, oletusyhdyskäytävän sekä muita palveluita (esim. DNS-serverit). Tämä dokumentti perustuu **RFC 2131** (1997, nykyään päivitetty **RFC 9318**).

## Mikä DHCP on?

DHCP on palvelin-asiakasprotokolla (UDP-portit 67 palvelin, 68 asiakas), joka poistaa tarpeen konfiguroida verkkoasetukset manuaalisesti. Se toimii seuraavasti:

1. **Asiakas** lähettää kyselyn verkolle
2. **Palvelin** vastaa tarjouksella osoitteista ja asetuksista
3. Asiakas hyväksyy tarjouksen
4. Palvelin vahvistaa (ACK) asetukset – asiakkaan verkkoasetukset ovat käytössä

## Miksi DHCP on tärkeä?

| Ilman DHCP:ää | DDHCP:llä |
|----------------|------------|
| Jokainen laite tarvitsee manuaalisen asetuksen | Asiakkaat saavat asetukset automaattisesti |
| Riski kaksinkertaisuus – kaksi laitetta samalla osoitteella | Osoitteiden varaus estää konfliktit |
| Muutokset vaativat manuaalista työtä joka koneessa | Palvelin päivittää asetukset keskitetysti |
| Liikkuvat laitteet menettävät sijainnin | Siirtyminen eri verkkoon = uusi asetus |

## DHCP-palvelin

DHCP-palvelin ylläpitää **vuokratavaralistan** – taulukkoa, jossa kerrotaan, mitkä osoitteet ovat käytössä ja mihin laitteisiin kuuluvat. Tyypillisesti:

- **Osoitteiden alue** – esim. `192.168.1.100–192.168.1.200`
- **Vuokra-aika** – esim. 24h; sen päätyttyä osoite palaa varattavaksi
- **Kiinteät osoitteet** – tietty MAC-osoite → kiinteä IP (esim. palvelimille)

## DHCP-operaatiot (RFC 2131)

DHCP tukee viittainoperaatioita:

| Operaatio | Selitys |
|-----------|----------|
| **DHCPDISCOVER** | Asiakas aloittaa: "Etsin palvelinta" |
| **DHCPOFFER** | Palvelin tarjoaa osoitteen |
| **DHCPREQUEST** | Asiakas pyytää tarjoamaa osoitetta |
| **DHCPACK** | Palvelin vahvistaa |
| **DHCPNAK** | Palvelin kieltää |
| **DHCPDECLINE** | Asiakas ilmoittaa, että osoite on käytössä |
| **DHCPRELEASE** | Asiakas palauttaa osoitteen |
| **DHCPINFORM** | Asiakas kysyy lisäasetuksia |

## Konfigurointiesimerkki (ISC DHCP palvelin)

```dhcpd.conf
# Verkkoalue
subnet 192.168.1.0 netmask 255.255.255.0 {
    range 192.168.1.100 192.168.1.200;  # Dynaaminen alue
    option routers 192.168.1.1;         # Oletusyhdyskäytävä
    option domain-name-servers 8.8.8.8, 8.8.4.4;
    default-lease-time 86400;           # 24h
    max-lease-time 604800;              # 7 days
}

# Kiinteä osoite tiettyä MAC:ia varten
host webserver {
    hardware ethernet 00:11:22:33:44:55;
    fixed-address 192.168.1.10;
}
```

## DHCP Relay (RFC 1542)

Jos DHCP-palvelin on eri aliverkossa kuin asiakas, tarvitaan **DHCP relay** – reititin, joka kääntää broadcastin unicastiksi ja lähettää sen palvelimelle. Tämä aktivoodaan reitittimessä:

```text
dhcp relay 10.0.0.5  # Palvelimen osoite
```

## Esimerkki: Asiakkaan näkymä

```bash
# Linuxissa tarkistaaksesi omiasi asetuksiasi:
ip addr show      # näet osoitteesi
ip route show     # näet reitin
cat /etc/resolv.conf  # näet DNS-palvelimet (DHCP-annetut)
```

## Seuraavaksi

Kun olet ymmärtänyt DHCP:n perusteidot, tarkastellaan [dhcp-prosessi.md](dhcp-prosessi.md), jossa DORA-viesti käydään läpi vaihe vaiheelta.
