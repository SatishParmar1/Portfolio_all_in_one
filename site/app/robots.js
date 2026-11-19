import { site } from './profile'

export const dynamic = 'force-static'

export default function robots() {
  return { rules: { userAgent: '*', allow: '/' }, sitemap: `${site}/sitemap.xml` }
}
