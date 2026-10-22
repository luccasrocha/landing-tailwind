# Landing Page Vitrine — uma página para negócios de bairro (puro Tailwind)

Uma vitrine simples e pronta para negócios locais, sem instalar nada.

## Como usar

### CDN (mais rápido)

```html
<!doctype html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Vitrine — a página do seu negócio de bairro</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
  <!-- Copiar todo o <body> de index.html para cá -->
  <!-- Conteúdo integral disponível no repositório como index.html -->
</body>
</html>
```

### npm + Vite (build estático)

```bash
# Inicializar o projeto (se ainda não tiver)
npx create-vite@latest .
# Instalar dependências
npm install tailwindcss postcss autoprefixer
# Configurar os arquivos na raiz (tailwind.config.js, postcss.config.js)
npm run build
# Publicar dist/
```

Para mais detalhes sobre Tailwind vs. Vite, ver:

- [[Instalacao via CDN]]
- [[Instalacao via npm e Vite]]

## Prévia

Você pode ver a página ao vivo aqui:

**👉 [Vitrine — GitHub Pages](https://luccasrocha.github.io/landing-tailwind/)** *(atualizado após push inicial)*

## Principais requisitos técnicos (resumo do briefing)

| # | Requisito | Exemplo no código |
|---|-----------|---------------|
| 1 | Tailwind via CDN | `<script src="https://cdn.tailwindcss.com">` |
| 2 | Navbar | `<header><nav>` (logo, links, "Montar grátis") |
| 3 | Hero com CTA | `<section>` com título, subtítulo, 2 botões |
| 4 | 3 cartões de recursos | `<article>` em `grid-cols-1 md:grid-cols-3` |
| 5 | Footer | `<footer>` (links, copyright) |
| 6 | Zero CSS propio | Nenhum `<style>`, sem `style="` |
| 7 | `hover:` em botão | `hover:bg-amber-400 hover:text-emerald-950` |
| 8 | `sm:`/`md:` | `md:flex`, `sm:flex-row`, `md:text-6xl` |

## Sobre

- Baseado no briefing da atividade **Landing Page com Tailwind CSS**
- Zero CSS proprio — apenas composições utilitárias
- Mobile-first, acessível (`focus-visible`), responsivo

## Bugreport

Problemas? Abra uma issue com:

```
[[Atividade - Landing Page com Tailwind CSS]]
[[Briefing Original - Landing Page Tailwind CSS]]
```