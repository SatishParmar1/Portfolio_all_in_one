import { brand, site } from './profile'

export const shareImage = {
  url: '/share.jpg',
  width: 1200,
  height: 630,
  alt: 'Satish Parmar, mobile and IoT developer',
}

export function detailMetadata({ title, description, path, image = shareImage }) {
  const socialTitle = `${title} | Satish Parmar`
  return {
    title,
    description,
    alternates: { canonical: path },
    openGraph: { type: 'website', siteName: brand, title: socialTitle, description, url: path, images: [image] },
    twitter: { card: 'summary_large_image', title: socialTitle, description, images: [image] },
  }
}

export function breadcrumb(title, path) {
  return {
    '@context': 'https://schema.org',
    '@type': 'BreadcrumbList',
    itemListElement: [
      { '@type': 'ListItem', position: 1, name: brand, item: `${site}/` },
      { '@type': 'ListItem', position: 2, name: title, item: site + path },
    ],
  }
}
