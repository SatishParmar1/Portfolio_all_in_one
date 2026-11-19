import '@fontsource-variable/bricolage-grotesque/wght.css'
import '@fontsource/instrument-serif/latin-400-italic.css'
import Navigation from './Navigation'
import { brand, description, email, github, linkedin, site, siteTitle } from './profile'
import { shareImage } from './seo'
import './styles.css'

export const metadata = {
  metadataBase: new URL(site),
  title: { default: siteTitle, template: '%s | Satish Parmar' },
  description,
  openGraph: {
    siteName: brand,
    title: siteTitle,
    description,
    type: 'website',
    url: site,
    images: [shareImage],
  },
  twitter: { card: 'summary_large_image', title: siteTitle, description, images: [shareImage] },
}

export default function Layout({ children }) {
  return (
    <html lang="en">
      <body id="page-top">
        <a className="skip" href="#main">Skip to content</a>
        <Navigation />
        <div className="site-content">
          {children}
          <footer className="footer">
            <div className="wrap">
              <div className="footer-links">
                <p>Mobile &amp; IoT Developer</p>
                <nav aria-label="Portfolio links">
                  <a href="/#work">Selected work</a>
                  <a href="/#open-source">Packages</a>
                  <a href="/#contact">Contact</a>
                </nav>
                <nav aria-label="Social and email links">
                  <a href={github}>GitHub</a>
                  <a href={linkedin}>LinkedIn</a>
                  <a href={`mailto:${email}`}>Email</a>
                </nav>
                <a className="footer-top" href="#page-top">Back to top</a>
              </div>
              <a className="footer-signature" href="/#top" aria-label="Satish Parmar, home">
                <span>Satish</span>{' '}<em>Parmar.</em>
              </a>
            </div>
          </footer>
        </div>
      </body>
    </html>
  )
}
