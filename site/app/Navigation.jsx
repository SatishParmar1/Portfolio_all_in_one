'use client'

import { useEffect, useState } from 'react'
import { usePathname } from 'next/navigation'
import { brand } from './profile'

const items = [
  ['top', 'Home', 'M3 10.5 12 3l9 7.5V21h-6v-6H9v6H3z'],
  ['services', 'Services', 'M5 5h14 M5 12h14 M5 19h14 M9 3v4 M15 10v4 M9 17v4'],
  ['contact', 'Contact', 'M3 5h18v14H3z M3 6l9 7 9-7'],
  ['work', 'Work', 'M3 7h18v14H3z M8 7V3h8v4 M3 12h18 M10 12v2h4v-2'],
  ['about', 'About', 'M16 8a4 4 0 1 1-8 0 4 4 0 0 1 8 0z M4 21v-2a4 4 0 0 1 4-4h8a4 4 0 0 1 4 4v2'],
  ['open-source', 'Packages', 'm12 3 8.5 4.75v8.5L12 21l-8.5-4.75v-8.5z M3.5 7.75 12 12.5l8.5-4.75 M12 12.5V21 M8 5.25l8.5 4.75'],
  ['photos', 'Photos', 'M3 4h18v16H3z M3 17l5-5 4 4 3-3 6 6 M17 8h.01'],
]

export default function Navigation() {
  const pathname = usePathname()
  const [current, setCurrent] = useState('top')
  const activeSection = pathname === '/'
    ? current
    : pathname.startsWith('/work/') ? 'work' : pathname.startsWith('/packages/') ? 'open-source' : null

  useEffect(() => {
    if (pathname !== '/') return
    const sections = items.map(([id]) => document.getElementById(id)).filter(Boolean)
    const update = () => {
      const readingLine = Math.min(window.innerHeight * 0.35, 270)
      const section = sections.findLast((item) => item.getBoundingClientRect().top <= readingLine)
      setCurrent(section?.id || 'top')
    }
    update()
    window.addEventListener('scroll', update, { passive: true })
    window.addEventListener('resize', update)
    return () => {
      window.removeEventListener('scroll', update)
      window.removeEventListener('resize', update)
    }
  }, [pathname])

  return (
    <header className="site-header">
      <a className="mastmark" href="/#top" aria-label={`${brand}, home`}>
        <span className="mastmark-symbol" aria-hidden="true">SP</span>
        <span className="mastmark-title">{brand}</span>
      </a>
      <nav aria-label="Main navigation">
        {items.map(([id, label, path]) => (
          <a key={id} href={`/#${id}`} aria-current={activeSection === id ? 'location' : undefined}>
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.55" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true" focusable="false">
              <path d={path} />
            </svg>
            <span>{label}</span>
          </a>
        ))}
      </nav>
    </header>
  )
}
