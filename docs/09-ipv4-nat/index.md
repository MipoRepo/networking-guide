# IPv4 NAT (Network Address Translation)

Tämä osio käsittelee **NAT:ta** (Network Address Translation) – mekanismia, jolla yksi IP-osoite voidaan kartoittaa useisiin IP-osoitteisiin, ja päinvastoin. NAT on keskeinen osa IPv4-verkkoja, erityisesti niissä, joissa on rajallinen määrä julkisia IPv4-osoitteita. Se perustuu pääosin **RFC 3022** (NAT-arkkitehtuuri) ja **RFC 4787** (NAT behavioral requirementsille).

## Mitä tämä osio käsittelee?

| Sivu | Aihe | Keskeinen kysymys |
|------|------|-------------------|
| NAT-perusteet | NAT:n periaate, taulut | Miksi NAT tarvitaan? |
| NAT-tyypit | Static, Dynamic, PAT | Kuinka NAT toimii eri tilanteissa? |
| NAT-konfigurointi | Esimerkkikonfiguraatiot | Miten otetaan NAT käyttöön? |

## Miksi NAT on tärkeä?

| Ilman NAT:ta | NAT:n kanssa |
|-------------|--------------|
| Jokaisella laitteella julkinen IPv4-osoite | Yhteiset Private + Julkiset osoitteet |
| Rajoitettu IPv4-osoitteistoja | Efektiivinen käyttö |
| Vaikeampi yksityisyys | IP-osoitteiden piilottaminen |

## NAT:n periaate

**NAT** muuntaa lähettäjän tai vastaanottajan IP-osoitteen paketin kuljetuksen aikana:

```text
Sisäverkko (10.0.0.0/24)
      ↓ (NAT: 10.0.0.5 → 203.0.113.5)
Internet
```

### NAT-taulu

NAT ylläpitää **NAT-taulua**, jossa on kirjattuna muunnokset:

| Private IP | Public IP | Portti | Istunto |
|------------|-----------|--------|---------|
| 10.0.0.5:1234 | 203.0.113.5:54321 | 54321 | TCP |

## NAT:n ja IPv4

NAT on erityisen tärkeä **IPv4**:ssä, jossa jullisten osoitteiden määrä on rajallinen. Se mahdollistaa, että:

- **Private-verkot** (`10.0.0.0/8`, `172.16.0.0/12`, `192.168.0.0/16`) voivat jaota jakautunut julkiset osoitteet
- **Yksi julkinen osoite** voi palvelevia lukuisia sisäisiä laitteita

!!! info "RFC 1918 – Private-verkot"

    Private-verkot määritellään standardina RFC 1918:ssa. Ne ovat:
    - `10.0.0.0/8` (10.x.x.x)
    - `172.16.0.0/12` (172.16.x.x – 172.31.x.x)
    - `192.168.0.0/16` (192.168.x.x)

## Tämä osio ja reititys

NAT toimii läheisesti **reitityksen** kanssa. Kun pakettimuunnos tapahtuu, se vaatii reitittimen pystyttämään NAT-skriptit ja pitämään kirjaa istunnoista. Tämä liittyy suoraan [07-reititys/index.md](../07-reititys/index.md)-osioon.

## Seuraavaksi

Aloitamme [nat-perusteet.md](nat-perusteet.md)-sivulta, jossa käsitellään NAT:n periaatetta, NAT-tauluja ja muunnostuslogiikkaa.
