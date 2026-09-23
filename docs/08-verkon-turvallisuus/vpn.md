# Virtuaalitietoverkot (VPN)

**Virtuaalitietoverkot** (Virtual Private Network, VPN) ovat mekanismit, jotka luovat suojatun yhteyden yli epäluotettaan verkosta (esim. Internet). Ne eivät ole itsessään protokollia, vaan käyttävät pääosin **IPsec**- tai **SSL/TLS**-protokollia suojaukseen. Tämä dokumentti perustuu **RFC 4301** (IPsec), **RFC 8220** (IPsec Security Architecture) ja **RFC 6066** (TLS:n palvelin-nimilakkaisuus).

## Mitä tämä sivu käsittelee?

- **VPN:n perusteet** – tunnelaustapa ja salaus
- **IPsec** – Layer 3 -suojaus
- **SSL/TLS-VPN** – sovellustason suojaus
- **Esimerkkikonfiguraatiot** – yhteensopivat pohjat

## Mikä on VPN:n periaate?

VPN luo **tunneelin** (tunnel) liikenteelle:

```text
Client
    | (salattu tunneli)
    ↓
VPN Server → Internet
    ↑
Yhteys kohdettuun verkkoon
```

Liikenne salataan ennen lähettämystä ja pureudutaan vastaanottamisessa.

## IPsec (Internet Protocol Security)

**IPsec** on standardi, joka tukee Layer 3 -tasossa olevaa salausta. Se koostuu kahdesta pääosasta:

| Osa | Toiminta |
|-----|----------|
| **AH (Authentication Header)** | Vahvistaa paketin ehdokkaan |
| **ESP (Encapsulating Security Payload)** | Salaa paketin sisällön |

### IPsec:n moodit

| Moodi | Käyttö | Selitys |
|-------|--------|--------|
| **Transport** | Solmu–solmu | Salaa paketin, säilyttää alkuperäisen IPv4-osoitteen |
| **Tunnel** | Solmu–verkko | Salaa koko paketin, muutta osoitteet |

### ESP:n salausrakenne

```text
[Encrypted Payload]
[ESP Trailer]
[ESP Authenticator]
```

- **Encrypted Payload** – salattu data
- **ESP Trailer** – lisäkentät (esim. padding)
- **ESP Authenticator** – tarkistettu data

## SSL/TLS-VPN

**SSL/TLS-VPN** toimii sovellustason tasolla (Layer 7). Se vaatii selaimen tai SSL-tuen, mutta ei tarvitse erillisiä ohjelmistoja.

| Etu | Selitys |
|-----|---------|
| Selainystävä | Työskentee selaimessa ilman lisäohjelmistoja |
| Portti 443 | HTTP-liikenteen kanssa samat portit |
| Tunnistautuminen | TLS-varmenteet |

## IKE (Internet Key Exchange)

**IKE** on protokolla, joka neuvottelee IPsec-yhteyden avaimet. Se koostuu kahdesta vaiheesta:

### IKEv2

1. **SA (Security Association)** – neuvotellaan protokollat ja parametrit
2. **Key Exchange** – vaihdetaan salausavaimet

!!! info "IKEv1 vs IKEv2"

    IKEv2 on kehittynyt IKEv1:stä ja tukee natiollista (NAT traversal). Se on lyhyempi ja turvallisempi.

## Esimerkkikonfiguraatio (Linux strongSwan)

```bash
# /etc/ipsec.conf
conn my-vpn
    left=192.168.1.100
    right=10.0.0.1
    keyexchange=ikev2
    authby=secret
    auto=start
```

```bash
# /etc/ipsec.secrets
192.168.1.100 %any : PSK "mysecretpassword"
```

## VPN:n käyttötyypit

| Tyyppi | Selitys | Esimerkki |
|--------|---------|----------|
| **Remote Access** | Yksiläinen käyttäjä | Työntekijä kotiverkosta |
| **Site-to-Site** | Koko verkko | Toimisto ja varasto |
| **SSL/TLS** | Sovellausaluetasolla | Selainpohjainen pääsy |

## Esimerkkiverkko

```text
Koti (192.168.1.100)
    ↓ (IKEv2/IPsec)
VPN Server (10.0.0.1)
    ↓ (Internet)
Työverkko (10.1.0.0/16)
```

Tässä kotikäyttäjä pääsee työverkon palvelimiin (10.1.0.0/16) salatun tunnelin kautta.

## VPN:n rajoitukset

| Rajoite | Selitys |
|---------|---------|
| **Resurssit** | Käsittelee suurta määrää liikennettä |
| **Suoritus** | Salaus hidastaa liikennettä |
| **Luotettavuus** | Palvelin voi olla yksittäinen virheasema |

## Seuraavaksi

Kun olet ymmärtänyt verkon tietoturvan perusteet, siirrytään [09-ipv4-nat/index.md](../09-ipv4-nat/index.md)-osioon, jossa käsitellään NAT-mekanismia.
