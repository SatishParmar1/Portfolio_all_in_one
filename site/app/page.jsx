import Image from 'next/image'
import JsonLd from './JsonLd'
import PhotoGallery from './PhotoGallery'
import ProjectVisual from './ProjectVisual'
import { brand, description, email, experience, github, linkedin, packages, projects, site, skills } from './profile'

export const metadata = { alternates: { canonical: '/' } }

const services = [
  ['Mobile app development', 'Build or extend a cross-platform app in Flutter or React Native, from feature work to release.'],
  ['IoT prototyping', 'Prototype connected devices and build companion mobile experiences for sensor data, controls, and alerts.'],
  ['Firebase and API integration', 'Add authentication, real-time data, REST integrations, and production monitoring.'],
  ['App maintenance and collaboration', 'Work alongside freelance developers, agencies, or product teams on features, performance, debugging, and release support.'],
]

const disciplines = [
  ['flutter', 'Flutter', 'I built TyreBook and TyreMitra for fleet and field operations, and publish reusable Flutter packages.', '/work/tyrebook/', 'See TyreBook'],
  ['react-native', 'React Native', 'I maintain Riims at Regrip India as part of a portfolio of live mobile apps.', '#career', 'See my experience'],
  ['iot', 'IoT', 'I prototype connected devices, including a wearable that alerts users to obstacles through vibration and audio.', '/work/assistive-knee-guard/', 'See the wearable'],
]

const highlights = [
  ['Fleet and field operations', 'I built TyreBook and TyreMitra from scratch for tyre lifecycle tracking and field lead capture.', '/work/tyrebook/', 'See TyreBook'],
  ['Production app maintenance', 'I maintain the Regrip Tyre Management App in Flutter and Riims in React Native.', '#experience', 'See my Regrip work'],
  ['Hardware and mobile integration', 'I prototyped an ESP8266 wearable that turns obstacle detections into vibration and audio alerts.', '/work/assistive-knee-guard/', 'See the wearable'],
]

const photos = [
  ['/images/regrip-award.webp', 'Satish receiving recognition at Regrip India', 'Outstanding Performance, Regrip India', 'Recognition for Flutter development and app responsiveness.', 1200, 1804],
  ['/images/innovation.webp', 'Satish and teammate at the Institution’s Innovation Council meet', 'IIC Regional Meet, 2023', 'Third place at the regional project showcase.', 1200, 902],
  ['/images/exhibition.webp', 'Satish and teammates at Tech-Creations 2.0', 'Tech-Creations 2.0', 'Second place at the project exhibition.', 1200, 1598],
  ['/images/hackathon.webp', 'Satish receiving recognition for hackathon coordination', 'Smart India Hackathon, 2023', 'Recognition for serving as lead coordinator.', 1200, 814],
  ['/images/prototype-demo.webp', 'Satish and teammates presenting their prototype', 'Prototype showcase', 'Presenting a team project during a Rajasthan hackathon.', 1079, 1826],
]

export default function Home() {
  const featuredProjects = projects.filter((project) => project.storeImage)
  const more = projects.filter((project) => !project.storeImage)
  const [currentRole, ...previousRoles] = experience
  const [featuredPackage, ...otherPackages] = packages
  const profile = {
    '@context': 'https://schema.org',
    '@graph': [
      { '@type': 'WebSite', '@id': `${site}/#website`, url: `${site}/`, name: brand, alternateName: 'Satish Parmar' },
      {
        '@type': 'ProfilePage',
        '@id': `${site}/#profile`,
        url: `${site}/`,
        name: 'Satish Parmar',
        description,
        isPartOf: { '@id': `${site}/#website` },
        mainEntity: {
          '@type': 'Person',
          '@id': `${site}/#satish-parmar`,
          name: 'Satish Parmar',
          url: `${site}/`,
          jobTitle: 'Mobile & IoT Developer',
          image: site + '/images/satish.webp',
          description,
          sameAs: [github, linkedin],
          knowsAbout: ['Flutter', 'React Native', 'Internet of Things', 'Dart', 'Firebase'],
        },
      },
    ],
  }
  return (
    <main id="main" tabIndex={-1}>
      <JsonLd data={profile} />
      <section className="hero" id="top" aria-labelledby="intro-title">
        <div className="wrap">
          <div className="hero-layout">
            <div className="hero-copy">
              <h1 id="intro-title"><span>Satish</span>{' '}<em>Parmar.</em></h1>
              <p className="lede">I build mobile apps and the devices they connect to.</p>
              <ul className="hero-disciplines" aria-label="Development specialties">
                {disciplines.map(([id, title]) => <li key={id}><a href={`#${id}`}>{title}</a></li>)}
              </ul>
              <div className="actions">
                <a className="button primary" href="#work">Explore my work</a>
              </div>
            </div>
            <figure className="portrait">
              <Image src="/images/satish.webp" alt="Satish Parmar" width={840} height={847} preload sizes="(max-width: 760px) 96vw, (max-width: 1400px) 58vw, 800px" />
            </figure>
          </div>
        </div>
      </section>

      <section className="work-highlights" aria-label="Work highlights">
        <div className="wrap highlight-grid">
          {highlights.map(([title, detail, href, label]) => (
            <article key={title}>
              <h2>{title}</h2>
              <p>{detail}</p>
              <a className="text-link" href={href}>{label}</a>
            </article>
          ))}
        </div>
      </section>

      <section className="section band" id="services" aria-labelledby="services-title">
        <div className="wrap">
          <h2 id="services-title">How I can <em>help.</em></h2>
          <div className="services">
            {services.map(([title, detail]) => <article key={title}><h3>{title}</h3><p>{detail}</p></article>)}
          </div>
          <dl className="skills">
            {skills.map(([title, detail]) => <div key={title}><dt>{title}</dt><dd>{detail}</dd></div>)}
          </dl>
          <section className="contact" id="contact" aria-labelledby="contact-title">
            <div>
              <h3 id="contact-title">Let’s <em>talk.</em></h3>
              <p>Hiring for a mobile or IoT role, planning an app, or looking for a development partner?</p>
            </div>
            <div className="contact-details">
              <div className="actions">
                <a className="button contact-primary" href={`mailto:${email}?subject=Mobile%20or%20IoT%20enquiry`}>Email me</a>
                <a className="button contact-secondary" href={linkedin}>Connect on LinkedIn</a>
              </div>
              <a className="contact-address" href={`mailto:${email}`}>{email}</a>
            </div>
          </section>
        </div>
      </section>

      <section className="section paper" id="work" aria-labelledby="work-title">
        <div className="wrap">
          <div className="section-head">
            <h2 id="work-title">Selected <em>work.</em></h2>
            <p>Production mobile apps, web projects, and hardware prototypes.</p>
          </div>
          <div className="project-grid">
            {featuredProjects.map((project) => (
              <article className="project" key={project.slug}>
                <ProjectVisual project={project} />
                <div className="project-info">
                  <p className="eyebrow">{project.category}</p>
                  <h3><a className="project-link" href={`/work/${project.slug}/`}>{project.name}</a></h3>
                  <p>{project.summary}</p>
                </div>
              </article>
            ))}
          </div>
          <div className="more-work">
            <h3>More projects</h3>
            <ul>{more.map((project) => (
              <li key={project.slug}>
                <a href={`/work/${project.slug}/`}>
                  <Image src={project.image} alt="" width={112} height={72} />
                  <span>{project.name}</span><span className="eyebrow">{project.category}</span>
                </a>
              </li>
            ))}</ul>
          </div>
        </div>
      </section>

      <section className="section about" id="about" aria-labelledby="about-title">
        <div className="wrap about-layout">
          <div className="about-copy">
            <h2 id="about-title">About <em>me.</em></h2>
            <p className="about-intro">I develop mobile and IoT products in Jaipur. I ship apps for fleet and field teams, publish Flutter tools, and take hardware ideas through to working prototypes.</p>
            <a className="text-link" href="#experience">Where I’ve worked</a>
            <div className="discipline-ledger">
              {disciplines.map(([id, title, detail, href, label]) => (
                <div className="discipline" id={id} key={id}>
                  <h3>{title}</h3>
                  <div><p>{detail}</p><a className="text-link" href={href}>{label}</a></div>
                </div>
              ))}
            </div>
          </div>
          <figure className="about-photo">
            <Image src="/images/prototype-demo.webp" alt="Satish and teammates presenting their prototype" width={1079} height={1826} />
            <figcaption>Presenting a team prototype at a Rajasthan hackathon. <a className="text-link" href="#photos">See field notes</a></figcaption>
          </figure>
        </div>
      </section>

      <section className="section paper experience" id="experience" aria-labelledby="experience-title">
        <div className="wrap" id="career">
          <div className="section-head">
            <h2 id="experience-title">Experience.</h2>
          </div>
          <div className="experience-layout">
            <article className="experience-feature">
              <p className="eyebrow">{currentRole.dates}</p>
              <h3>{currentRole.company}</h3>
              <p className="experience-role">{currentRole.role}</p>
              <ul>{currentRole.details.map((detail) => <li key={detail}>{detail}</li>)}</ul>
              <div className="experience-projects">
                <a href="/work/tyrebook/">TyreBook</a>
                <a href="/work/tyremitra/">TyreMitra</a>
              </div>
            </article>
            <div className="experience-history">
              <h3>Earlier roles</h3>
              {previousRoles.map((job) => (
                <details key={job.company}>
                  <summary>
                    <span className="eyebrow">{job.dates}</span>
                    <strong>{job.company}</strong>
                    <span>{job.role}</span>
                  </summary>
                  <ul>{job.details.map((detail) => <li key={detail}>{detail}</li>)}</ul>
                </details>
              ))}
            </div>
          </div>
        </div>
      </section>

      <section className="section open-source" id="open-source" aria-labelledby="packages-title">
        <div className="wrap">
          <div className="section-head">
            <div><h2 id="packages-title">Open <em>source.</em></h2><p>Flutter and Dart tools for networking, navigation, media, and in-app reviews.</p></div>
            <a className="text-link" href={github}>Browse GitHub</a>
          </div>
          <div className="package-showcase">
            <article className="package-feature">
              <p className="eyebrow">{featuredPackage.category}</p>
              <h3><a href={`/packages/${featuredPackage.name}/`}>{featuredPackage.name}</a></h3>
              <p>{featuredPackage.description}</p>
              <div className="package-command">
                <span>Install with Flutter</span>
                <code>flutter pub add {featuredPackage.name}</code>
              </div>
            </article>
            <ul className="package-index">
              {otherPackages.map(({ name, description }) => (
                <li key={name}>
                  <h3><a href={`/packages/${name}/`}>{name}</a></h3>
                  <p>{description}</p>
                </li>
              ))}
            </ul>
          </div>
        </div>
      </section>

      <section className="section paper" id="photos" aria-labelledby="photos-title">
        <div className="wrap">
          <div className="section-head">
            <h2 id="photos-title">Field <em>notes.</em></h2>
            <p>Project exhibitions, hackathons, and the people I built with.</p>
          </div>
          <PhotoGallery photos={photos} />
        </div>
      </section>

    </main>
  )
}
