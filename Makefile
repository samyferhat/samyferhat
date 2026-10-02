# Bascule le README du profil entre plusieurs thèmes (voir THEMES.md).
#
#   make <theme>   copie themes/<theme>.md vers README.md et note le thème dans .theme
#   make current   affiche le thème actif
#   make push      commit "theme: <nom>" puis push
#   make help      liste les cibles (cible par défaut)

THEMES     := terminal neon minimal fun
THEME_FILE := .theme
README     := README.md

.DEFAULT_GOAL := help
.PHONY: help current push $(THEMES)

help: ## Liste les cibles disponibles
	@echo "Usage : make <cible>"
	@echo ""
	@echo "Thèmes :"
	@for t in $(THEMES); do printf "  make %-10s applique themes/%s.md\n" "$$t" "$$t"; done
	@echo ""
	@echo "Autres cibles :"
	@grep -hE '^[a-zA-Z_-]+:.*## ' $(MAKEFILE_LIST) | awk 'BEGIN { FS = ":.*## " } { printf "  make %-10s %s\n", $$1, $$2 }'

# Règle générique : make <theme>  ->  themes/<theme>.md devient README.md
$(THEMES): %: themes/%.md
	@cp $< $(README)
	@echo $@ > $(THEME_FILE)
	@echo "Thème actif : $@  ($< -> $(README))"

current: ## Affiche le thème actif
	@if [ -f $(THEME_FILE) ]; then echo "Thème actif : $$(cat $(THEME_FILE))"; else echo "Aucun thème appliqué ($(THEME_FILE) absent)"; fi

push: ## Commit "theme: <nom>" puis push
	@test -f $(THEME_FILE) || { echo "Aucun thème appliqué : lance d'abord make <theme>"; exit 1; }
	@theme=$$(cat $(THEME_FILE)); \
	git add $(README) $(THEME_FILE); \
	if git diff --cached --quiet; then echo "Rien à committer : $(README) est déjà sur le thème $$theme"; exit 0; fi; \
	git commit -m "theme: $$theme" && git push
