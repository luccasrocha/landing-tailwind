# Landing Page Vitrine — uma página para negócios de bairro (puro Tailwind)

Uma vitrine simples e pronta para negócios locais, construída **apenas com classes
utilitárias do Tailwind CSS** — zero CSS próprio.

> **Rota oficial:** npm + Vite com build estático (Tailwind v3.4).
> **Rota rápida (alternativa):** CDN via `cdn.tailwindcss.com` para testes rápidos.

## Prévia

Você pode ver a página ao vivo aqui:

**👉 [Vitrine — GitHub Pages](https://luccasrocha.github.io/landing-tailwind/)** *(atualizado após push inicial)*

## Estrutura do projeto

```text
landing-tailwind/
├── index.html            # markup completo (quatro seções)
├── package.json
├── tailwind.config.js    # configuração do Tailwind (cores customizadas)
├── postcss.config.js
├── src/
│   └── input.css         # @tailwind base/components/utilities (único .css do projeto)
├── dist/
│   └── output.css        # saída do build (gerado, não editado à mão)
├── scripts/
│   └── screenshot.js     # captura mobile (375px) e desktop (1280px) com Playwright
├── shots/
│   ├── desktop.png       # evidência de entrega
│   └── mobile.png
└── .github/workflows/
    └── deploy.yml        # CI: checagens de qualidade + deploy no GitHub Pages
```

## Como usar

### npm + Vite (rota oficial)

```bash
# instalar dependências
npm install

# rodar em desenvolvimento
npm run dev

# build estático para produção
npm run build
```

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

## Principais requisitos técnicos (resumo do briefing)

| # | Requisito | Exemplo no código |
|---|-----------|---------------|
| 1 | Tailwind configurado (npm + Vite) | `tailwind.config.js` + `src/input.css` |
| 2 | Navbar | `<header><nav>` (logo, links, "Montar gratis") |
| 3 | Hero com CTA | `<section>` com título, subtítulo, 2 botões |
| 4 | 3 cartões de recursos | `<article>` em `grid-cols-1 md:grid-cols-3` |
| 5 | Footer | `<footer>` (links, copyright) |
| 6 | Zero CSS propio | Nenhum `<style>`, sem `style="`, sem `@apply` |
| 7 | `hover:` em botão | `hover:bg-amber-400 hover:text-emerald-950` |
| 8 | `sm:`/`md:` | `md:flex`, `sm:flex-row`, `md:text-6xl`, `md:grid-cols-3` |

## Verificação automática

O workflow em `.github/workflows/deploy.yml` roda um pipeline de checagens em cada
push. São verificados:

- [ ] **Zero CSS próprio** — procura `<style`, `style="`, `@layer`, `@apply`
- [ ] **`hover:` em botão** — pelo menos um `hover:` em `<a>` ou `<button>`
- [ ] **Prefixo responsivo** — pelo menos um `sm:` ou `md:`
- [ ] **Exatamente 3 cartões** — `grep -c '<article' index.html` == 3
- [ ] **Estrutura semântica** — `header`, `nav`, `main`, `section`, `footer`
- [ ] **Meta viewport** — `width=device-width, initial-scale=1`
- [ ] **`lang="pt-BR"`** no `<html>`
- [ ] **Tamanho do CSS** — purge gerando < 50 KB

## Screenshots (evidência de entrega)

- `shots/desktop.png` — 1280px, página inteira
- `shots/mobile.png` — 375px, página inteira

Gerados com `npm run screenshot` (Playwright + Chromium).

## Sobre

- Baseado no briefing da atividade **Landing Page com Tailwind CSS**
- Zero CSS próprio — apenas composições utilitárias
- Mobile-first, acessível (`focus-visible`, `sr-only`), responsivo
- Deploy automático no GitHub Pages via Actions

## Bugreport

Problemas? Abra uma issue com:

```
[[Atividade - Landing Page com Tailwind CSS]]
[[Briefing Original - Landing Page Tailwind CSS]]
```