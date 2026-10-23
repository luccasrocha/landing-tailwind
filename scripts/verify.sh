#!/usr/bin/env bash
# Verificacao local rapida - espelha o que o CI faz

set -euo pipefail

echo "Verificando requisitos do briefing..."
echo

# 1. CSS proprio (ignorando node_modules e .git)
echo "1. Zero CSS proprio?"
if grep -RniE '<style|style="|@layer|@apply' . --exclude-dir=node_modules --include=*.html | grep -v 'about:blank'; then
  echo "   FALHA: CSS proprio detectado"
  grep -RniE '<style|style="|@layer|@apply' . --exclude-dir=node_modules --include=*.html | grep -v 'about:blank' | head -5
  exit 1
else
  echo "   Zero CSS proprio"
fi

# 2. hover: em botao
echo "2. hover: em botao/link?"
if grep -RnE '(button|a )[^>]*hover:' index.html >/dev/null; then
  echo "   hover: presente"
  grep -RnE '(button|a )[^>]*hover:' index.html | head -2
else
  echo "   FALHA: nenhum hover:"
  exit 1
fi

# 3. breakpoint responsivo
echo "3. Prefixo responsivo (sm: ou md:)?"
if grep -RnE '\b(sm|md):' index.html >/dev/null; then
  echo "   Responsivo presente"
  grep -RnE '\b(sm|md):' index.html | head -5
else
  echo "   FALHA: nenhum sm: ou md:"
  exit 1
fi

# 4. 3 cartoes
echo "4. Exatamente 3 cartoes (<article>)?"
COUNT=$(grep -c '<article' index.html)
if [ "$COUNT" -eq 3 ]; then
  echo "   3 cartoes"
else
  echo "   FALHA: esperado 3, encontrado $COUNT"
  exit 1
fi

# 5. HTML semantico
echo "5. Estrutura semantica?"
for tag in header nav main section footer; do
  if grep -q "<$tag" index.html; then
    echo "   <$tag> presente"
  else
    echo "   <$tag> ausente"
    exit 1
  fi
done

# 6. viewport
echo "6. Meta viewport?"
if grep -q 'name="viewport"' index.html; then
  echo "   Meta viewport presente"
else
  echo "   FALHA: meta viewport ausente"
  exit 1
fi

# 7. lang
echo "7. lang=pt-BR?"
if grep -q 'lang="pt-BR"' index.html; then
  echo "   lang=pt-BR"
else
  echo "   FALHA: lang incorreto"
  exit 1
fi

# 8. CSS buildado
echo "8. CSS buildado?"
if [ -f dist/output.css ]; then
  SIZE=$(wc -c < dist/output.css)
  echo "   dist/output.css ($SIZE bytes)"
else
  echo "   FALHA: dist/output.css nao existe - rode 'npm run build'"
  exit 1
fi

echo
echo "Todos os requisitos atendidos!"