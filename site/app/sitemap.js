import { packages, projects, site } from './profile'

export const dynamic = 'force-static'

export default function sitemap() {
  return ['/', ...projects.map(({ slug }) => `/work/${slug}/`), ...packages.map(({ name }) => `/packages/${name}/`)]
    .map((path) => ({ url: site + path }))
}
