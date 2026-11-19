import { notFound } from 'next/navigation'
import JsonLd from '../../JsonLd'
import ProjectCarousel from '../../ProjectCarousel'
import ProjectVisual from '../../ProjectVisual'
import { projects } from '../../profile'
import { breadcrumb, detailMetadata } from '../../seo'

export function generateStaticParams() {
  return projects.map(({ slug }) => ({ slug }))
}

export async function generateMetadata({ params }) {
  const { slug } = await params
  const project = projects.find((item) => item.slug === slug)
  if (!project) return {}
  const path = `/work/${slug}/`
  return detailMetadata({
    title: project.name,
    description: project.summary,
    path,
    image: { url: project.image, alt: project.alt },
  })
}

export default async function ProjectPage({ params }) {
  const { slug } = await params
  const project = projects.find((item) => item.slug === slug)
  if (!project) notFound()
  const screenshots = Array.from({ length: project.screenshotCount ?? 0 }, (_, index) => (
    `/images/screenshots/${slug}/${String(index + 1).padStart(2, '0')}.webp`
  ))

  return (
    <main className="wrap section detail" id="main" tabIndex={-1}>
      <JsonLd data={breadcrumb(project.name, `/work/${slug}/`)} />
      <a className="text-link" href="/#work">All selected work</a>
      <p className="eyebrow">{project.category}</p>
      <h1>{project.name}</h1>
      <p className="lede">{project.summary}</p>
      {screenshots.length > 0
        ? <ProjectCarousel name={project.name} screenshots={screenshots} />
        : <ProjectVisual project={project} />}
      <div className="split detail-info">
        <div>
          <h2>About the project</h2>
          <p>{project.detail}</p>
        </div>
        <div>
          <h3>Technology</h3>
          <ul className="tags">{project.stack.map((item) => <li key={item}>{item}</li>)}</ul>
          {project.href && <a className="button primary" href={project.href}>{project.action}</a>}
        </div>
      </div>
    </main>
  )
}
