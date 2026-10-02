# Thèmes du README

Le README du profil existe en plusieurs variantes, rangées dans `themes/`. Le fichier `README.md` à la racine
est une **copie** du thème actif, dont le nom est noté dans `.theme`. Tous les thèmes affichent le même contenu
(identité, études, stack, stats, snake, projets, contacts, citation) avec une identité visuelle différente.

## Usage

```bash
make help        # liste les cibles (cible par défaut)
make current     # affiche le thème actif
make neon        # applique themes/neon.md -> README.md et écrit "neon" dans .theme
make push        # commit "theme: neon" puis push
```

Cibles disponibles : `make terminal`, `make neon`, `make minimal`, `make fun`.

Changer de thème ne demande **aucun rerun** des workflows : `metrics.yml` génère en une seule exécution tous les
SVG dont les quatre thèmes ont besoin, et `snake.yml` produit les quatre palettes du snake sur la branche `output`.

> Ne modifie pas `README.md` directement : édite `themes/<theme>.md` puis relance `make <theme>`.

## Les thèmes

| thème | ambiance | header | séparateurs | stack | metrics | snake |
|:--|:--|:--|:--|:--|:--|:--|
| `terminal` | session SSH, vert phosphore sur fond sombre | bannière ASCII + prompt animé `samy@evry:~$` | blocs de commandes shell | icônes skillicons.dev | template **terminal** × 2 (`metrics.terminal.svg`, `metrics.languages.svg`) | `github-snake-dark.svg` / `github-snake.svg` selon le mode |
| `neon` | cyberpunk, magenta `#ff00ff` et cyan `#00ffff` sur `#0d1117` | `assets/neon-header.svg` : titre néon avec glow et flicker, grille animée, curseur clignotant | `assets/neon-divider.svg` : ligne dégradée avec éclair qui défile | badges for-the-badge noirs, logos alternés magenta/cyan | template **classic**, langages en palette néon, calendrier sur un an, graphiques d'habitudes, activité (`metrics.classic-dark.svg`) | `github-snake-neon.svg` (serpent magenta, cases violettes → cyan) |
| `minimal` | chic et silencieux, un seul accent `#3B5BDB`, aucune image décorative, ni GIF ni emoji | simple `# Samy Ferhat` + deux lignes de texte | espace blanc et filets | tokens `code` en texte | template **classic** en `config_display: large`, sans animations, deux plugins seulement (`metrics.classic-light.svg`) | `github-snake.svg` (palette claire uniquement, via `<picture>`) |
| `fun` | coloré et joyeux, GIFs et emojis | `assets/fun-header.svg` : lettres qui rebondissent sur un dégradé animé, confettis | GIF arc-en-ciel animé | badges for-the-badge aux couleurs des marques | template **classic**, langages arc-en-ciel, achievements, graphiques d'habitudes (`metrics.classic-color.svg`) | `github-snake-fun.svg` (serpent corail, cases jaune → violet) |

## Aperçus

### terminal

<div align="center">
<img src="https://readme-typing-svg.demolab.com/?font=Fira+Code&weight=500&size=20&duration=3000&pause=800&color=00FF41&center=true&vCenter=true&width=600&lines=samy%40evry%3A~%24+whoami;%3E+Computer+Science+student+%40+Paris-Saclay;samy%40evry%3A~%24+_" alt="terminal header" />
<br/>
<img src="https://raw.githubusercontent.com/samyferhat/samyferhat/main/metrics.terminal.svg" alt="terminal metrics" width="420" />
<img src="https://raw.githubusercontent.com/samyferhat/samyferhat/main/metrics.languages.svg" alt="terminal languages" width="420" />
</div>

### neon

<div align="center">
<img src="https://raw.githubusercontent.com/samyferhat/samyferhat/main/assets/neon-header.svg" alt="neon header" width="700" />
<br/>
<img src="https://raw.githubusercontent.com/samyferhat/samyferhat/main/assets/neon-divider.svg" alt="neon divider" width="700" />
<br/>
<img src="https://raw.githubusercontent.com/samyferhat/samyferhat/main/metrics.classic-dark.svg" alt="neon metrics" width="420" />
<img src="https://raw.githubusercontent.com/samyferhat/samyferhat/output/github-snake-neon.svg" alt="neon snake" width="700" />
</div>

### minimal

<div align="center">
<img src="https://raw.githubusercontent.com/samyferhat/samyferhat/main/metrics.classic-light.svg" alt="minimal metrics" width="700" />
<br/>
<img src="https://raw.githubusercontent.com/samyferhat/samyferhat/output/github-snake.svg" alt="minimal snake" width="700" />
</div>

### fun

<div align="center">
<img src="https://raw.githubusercontent.com/samyferhat/samyferhat/main/assets/fun-header.svg" alt="fun header" width="700" />
<br/>
<img src="https://raw.githubusercontent.com/samyferhat/samyferhat/main/metrics.classic-color.svg" alt="fun metrics" width="420" />
<img src="https://raw.githubusercontent.com/samyferhat/samyferhat/output/github-snake-fun.svg" alt="fun snake" width="700" />
</div>

## Fichiers générés

| fichier | produit par | utilisé par |
|:--|:--|:--|
| `metrics.terminal.svg` | `metrics.yml` → Terminal overview | terminal |
| `metrics.languages.svg` | `metrics.yml` → Terminal languages & calendar | terminal |
| `metrics.classic-dark.svg` | `metrics.yml` → Classic dark | neon |
| `metrics.classic-light.svg` | `metrics.yml` → Classic light | minimal |
| `metrics.classic-color.svg` | `metrics.yml` → Classic color | fun |
| `output/github-snake.svg` | `snake.yml` | terminal (mode clair), minimal |
| `output/github-snake-dark.svg` | `snake.yml` | terminal (mode sombre) |
| `output/github-snake-neon.svg` | `snake.yml` | neon |
| `output/github-snake-fun.svg` | `snake.yml` | fun |

Les SVG `metrics.*.svg` sont commités sur `main` par le workflow Metrics (tous les jours à 3h UTC, ou via
*Run workflow*). Les snakes sont poussés sur la branche `output` toutes les 12 h.

## Ajouter un thème

1. Crée `themes/<nom>.md` avec le même contenu que les autres.
2. Si le thème a besoin d'un nouveau SVG metrics, ajoute une étape dans `.github/workflows/metrics.yml`
   (toujours `token: ${{ secrets.METRICS_TOKEN }}` et `user: samyferhat`) ; pour une nouvelle palette de snake,
   ajoute une ligne dans `outputs:` de `.github/workflows/snake.yml`.
3. Ajoute `<nom>` à la variable `THEMES` du `Makefile`, puis `make <nom>`.
