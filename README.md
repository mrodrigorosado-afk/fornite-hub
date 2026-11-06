# Fortnite Hub

Portal de Fortnite em português: loja em tempo real, mapa, cosméticos, Battle Passes, meta e notícias, com dados da [Fortnite-API](https://fortnite-api.com).

## Tecnologias
- **HTML + CSS:** páginas, design e animações (`index.html`, `src/styles.css`)
- **TypeScript:** lógica do site (`src/main.ts`), compilada pelo Vite
- **Node.js:** servidor sem dependências (`server/index.js`) que serve o site e faz proxy da API com cache e compressão gzip
- **Docker, GitHub Actions, YAML:** publicação e testes automáticos

## Estrutura
    index.html          páginas e SEO
    src/main.ts         lógica (rotas, API, filtros, mapa, favoritos)
    src/styles.css      design e animações
    server/index.js     servidor Node (site + proxy /api com cache)
    server/cache.js     cache com expiração (testada)
    public/             ícone, manifesto e mapa
    Dockerfile          imagem para publicar em qualquer servidor
    vercel.json, netlify.toml, render.yaml   configuração das plataformas

## Correr localmente
Precisas do Node.js 18 ou superior.

    npm install
    npm run dev

## Comandos
- `npm run dev`: servidor de desenvolvimento (com proxy `/api`)
- `npm run build`: gera a pasta `dist/`
- `npm start`: serve `dist/` com o servidor Node (corre `npm run build` antes)
- `npm test`: testes da cache
- `npm run typecheck`: verifica os tipos do TypeScript

## Publicar
- **Vercel ou Netlify:** importa o repositório. O proxy `/api` já está configurado (cache de 5 minutos).
- **Render (ou Railway, Fly.io, VPS):** usa o `Dockerfile` (no Render, `render.yaml`). O servidor Node trata de tudo e usa a variável `PORT`.
- **GitHub Pages:** envia para `main` e escolhe "GitHub Actions" em Settings > Pages. Sem servidor, o site chama a API diretamente.

O site tenta `/api` primeiro e, se falhar, usa a Fortnite-API diretamente.
