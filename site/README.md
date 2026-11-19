# Satish Parmar portfolio

A Next.js App Router portfolio with statically rendered project pages, a photo gallery, and services for freelance clients and collaborators.

## Local development

```sh
npm ci
npm run dev
```

Open http://localhost:3000.

## Production

```sh
npm run build
```

The complete site is exported to `out/`. In Vercel, select this folder as the project root and use the Next.js preset. On another static host, publish `out/` and configure it to serve directory indexes. The site uses no server-side environment variables or contact API.

The canonical URL, sitemap, and social metadata use `https://www.satish.studio` from `app/profile.js`. If the production URL changes, update that constant before building. Project details and professional information can be edited in `app/profile.js`.

The monochrome design uses locally hosted Bricolage Grotesque and Instrument Serif. Portraits, earlier project images, and event photographs come from the original Flutter portfolio. Featured app screenshots come from the apps’ Google Play listings.
