import { notFound } from 'next/navigation'
import JsonLd from '../../JsonLd'
import { packages } from '../../profile'
import { breadcrumb, detailMetadata } from '../../seo'

export function generateStaticParams() {
  return packages.map(({ name }) => ({ name }))
}

export async function generateMetadata({ params }) {
  const { name } = await params
  const item = packages.find((entry) => entry.name === name)
  if (!item) return {}
  const path = `/packages/${name}/`
  return detailMetadata({ title: item.title, description: item.description, path })
}

export default async function PackagePage({ params }) {
  const { name } = await params
  const item = packages.find((entry) => entry.name === name)
  if (!item) notFound()

  return (
    <main className="wrap section detail package-detail" id="main" tabIndex={-1}>
      <JsonLd data={breadcrumb(item.title, `/packages/${name}/`)} />
      <a className="text-link" href="/#open-source">All packages</a>
      <p className="eyebrow">{item.category}</p>
      <h1>{item.title}</h1>
      <p className="lede">{item.description}</p>
      <div className="package-detail-grid">
        <section aria-labelledby="package-features">
          <h2 id="package-features">What it does</h2>
          <dl className="package-facts">
            {item.features.map(([title, detail]) => <div key={title}><dt>{title}</dt><dd>{detail}</dd></div>)}
          </dl>
        </section>
        <section className="package-setup" aria-labelledby="package-install">
          <h2 id="package-install">Get started</h2>
          <p>{item.useCase}</p>
          <div className="package-command">
            <span>Install with Flutter</span>
            <code>flutter pub add {item.name}</code>
          </div>
          <div className="actions">
            <a className="button primary" href={`https://pub.dev/packages/${item.name}`}>Read on pub.dev</a>
            <a className="text-link" href={item.repository}>Source on GitHub</a>
          </div>
        </section>
      </div>
    </main>
  )
}
