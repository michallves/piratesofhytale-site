#!/bin/bash
# Gera index.html a partir do template. Padrões sem dado pessoal; EMAIL e COMPANY são opcionais.
# Uso: [OPERATOR="Nome ou Razao Social"] [EMAIL="contato@piratesofhytale.com"] ./build.sh
set -eu
cd "$(dirname "$0")"
OPERATOR="${OPERATOR:-michallves}"
if [ -n "${EMAIL:-}" ]; then CONTACT_HTML="<a href=\"mailto:${EMAIL}\">${EMAIL}</a>"
else CONTACT_HTML='<a href="https://github.com/michallves/piratesofhytale-site/issues">GitHub</a>'; fi
sed -e "s|{{OPERATOR}}|${OPERATOR}|g" -e "s|{{CONTACT_HTML}}|${CONTACT_HTML//|/\\|}|g" index.template.html > index.html
grep -q '{{' index.html && { echo "placeholder restante"; exit 1; }
echo "index.html gerado"
