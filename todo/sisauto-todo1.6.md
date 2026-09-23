# Tietoverkot – sisältöprosessi (versio 1.6)

## ALKUPERÄINEN PROMPTI

( alkuperäinen prompti säilytetään sellaisenaan – ks. sisauto-todo1.0.md )

## ALKUPERÄINEN TEHTÄVÄLISTA

1. Etsi ja varmista JAMKin Tietoverkot -lähdemateriaalin URL sekä sen keskeiset osa-alueet
2. Luo mkdocs.yml -konfiguraatio MkDocs Material -projektille
3. Kirjoita juorimaksikon (docs/index.md)
4. Täydennä 01-johdatus -osio (5 sivua)
5. Täydennä 02-ethernet -osio (7 sivua)
6. Täydennä 03-ipv4 -osio (7 sivua)
7. Täydennä 04-dhcp-routing -osio (6 sivua)
8. Täydennä 05-laitteet -osio (6 sivua)
9. Täydennä 06-spanning-tree -osio (4 sivua)
10. Täydennä 07-reititys -osio (5 sivua)
11. Täydennä 08-verkon-turvallisuus -osio (5 sivua)
12. Täydennä 09-nat -osio (4 sivua)
13. Täydennä 10-tcp-udp -osio (6 sivua)
14. Täydennä 11-palvelimet-ja-wlan -osio (5 sivua)
15. Täydennä 12-dns -osio (5 sivua)
16. Täydennä 13-ipv6 -osio (5 sivua)
17. Täydennä 14-bgp -osio (5 sivua)
18. Laadunvarmistus ja lopullinen tarkistus koko dokumentaatiolle
19. Alusta ympäristö ja ota sivusto käyttöön (rakenneprompti.md)

## TEHDYT TEHTÄVÄT

- [x] Tehtävä 0–5: Katso edelliset versiot
- [x] **Tehtävä 19 (ympäristön alustus):** suoritu rakenneprompti.md. (Valmis – 1.6)
  - Luotu `.venv/` Python-virtuaalinen ympäristö (Python 3.12)
  - Asennettu: mkdocs==1.6.0, mkdocs-material==9.7.7, mkdocs-mermaid2-plugin, mkdocs-git-revision-date-localized-plugin, mkdocs-minify-plugin, mkdocs-redirects, mkdocs-awesome-pages-plugin
  - Huomio: `mkdocs-katex` ei ollut saatavilla PyPI:stä – korvattu `pymdownx.arithmatex`-lisäyksellä
  - mkdocs.yml korjattu MkDocs 2.0 -yhteensopivuudeksi:
    - Poistettiin `version.provider: mike` (ei asennettu)
    - Poistettiin `permalink_depth` toc-asetuksista (ei sallittu)
    - Poistettiin `min_search_length` search-pluginista (ei tuettu)
    - Poistettiin `custom_span` superfences-asetuksista
    - `icon` siirretty `theme`-asetuksen alle
    - Lisätty `theme.name: material`
  - Luotu `.secrets/config.env` paikkamerkeillä (4 avainta)
  - Luotu `.gitignore` `.secrets/`, `site/`, `.venv/` kansioille
  - Git-repositorio alustettu, `main`-haara luotu
  - GitHub-etäyhteys lisätty `git@github.com:MipoRepo/networking-guide.git`
  - Projekti työntyntu GitHubiin (`git push -u origin main`)
  - `mkdocs build` toimii (exit code 0, --strict -moodissa)
  - `mkdocs serve` palvelee paikallisesti (200 OK)
  - `mkdocs gh-deploy --force` julkaistu GitHub Pagesille
  - Lopullinen URL: **https://MipoRepo.github.io/networking-guide/**

## NYKYINEN TEHTÄVÄ

**Tehtävä 6:** Täydennä 03-ipv4 -osio (index.md, ipv4.md, ip-osoite.md, aliverkot.md, subnetointi.md, arp.md, broadcast.md).

**Status:** Ei vielä aloitettu. Odottaa "jatka"-komentoa.
