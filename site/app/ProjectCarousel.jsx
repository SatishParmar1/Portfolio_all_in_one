'use client'

import Image from 'next/image'
import { useEffect, useRef, useState } from 'react'

export default function ProjectCarousel({ name, screenshots }) {
  const [active, setActive] = useState(0)
  const [inView, setInView] = useState(false)
  const [pageVisible, setPageVisible] = useState(false)
  const [allowMotion, setAllowMotion] = useState(false)
  const [hovered, setHovered] = useState(false)
  const [focused, setFocused] = useState(false)
  const [paused, setPaused] = useState(false)
  const stage = useRef(null)
  const swipeStart = useRef(null)
  const swiped = useRef(false)
  const total = screenshots.length
  const playing = inView && pageVisible && allowMotion && !hovered && !focused && !paused

  useEffect(() => {
    const preference = window.matchMedia('(prefers-reduced-motion: no-preference)')
    const updateMotion = () => setAllowMotion(preference.matches)
    const updateVisibility = () => setPageVisible(!document.hidden)
    const observer = new IntersectionObserver(([entry]) => setInView(entry.intersectionRatio >= 0.3), { threshold: 0.3 })

    updateMotion()
    updateVisibility()
    preference.addEventListener('change', updateMotion)
    document.addEventListener('visibilitychange', updateVisibility)
    observer.observe(stage.current)
    return () => {
      preference.removeEventListener('change', updateMotion)
      document.removeEventListener('visibilitychange', updateVisibility)
      observer.disconnect()
    }
  }, [])

  useEffect(() => {
    if (!playing) return
    const timer = window.setTimeout(() => setActive((index) => (index + 1) % total), 5500)
    return () => window.clearTimeout(timer)
  }, [active, playing, total])

  function advance(step) {
    setActive((index) => (index + step + total) % total)
  }

  function handleKeys(event) {
    if (event.altKey || event.ctrlKey || event.metaKey || event.shiftKey) return
    if (event.key !== 'ArrowLeft' && event.key !== 'ArrowRight') return
    event.preventDefault()
    advance(event.key === 'ArrowLeft' ? -1 : 1)
  }

  function startSwipe(event) {
    swiped.current = false
    if (event.pointerType === 'touch' && event.isPrimary) {
      swipeStart.current = { x: event.clientX, y: event.clientY }
    }
  }

  function endSwipe(event) {
    const start = swipeStart.current
    swipeStart.current = null
    if (!start) return
    const horizontal = event.clientX - start.x
    const vertical = event.clientY - start.y
    if (Math.abs(horizontal) >= 45 && Math.abs(horizontal) > Math.abs(vertical)) {
      swiped.current = true
      advance(horizontal < 0 ? 1 : -1)
    }
  }

  return (
    <section className="app-carousel" aria-label={`${name} screenshot carousel`}>
      <div
        ref={stage}
        className="app-carousel-stage"
        onKeyDown={handleKeys}
        onFocus={() => setFocused(true)}
        onBlur={(event) => { if (!event.currentTarget.contains(event.relatedTarget)) setFocused(false) }}
        onPointerEnter={(event) => { if (event.pointerType === 'mouse') setHovered(true) }}
        onPointerLeave={() => setHovered(false)}
      >
        {screenshots.map((src, index) => (
          <div className="app-carousel-slide" key={src} data-active={active === index} aria-hidden={active !== index}>
            <Image src={src} alt={`${name} screenshot ${index + 1} of ${total}`} fill sizes="(max-width: 760px) 92vw, 65rem" loading={index === 0 ? 'eager' : 'lazy'} draggable={false} />
          </div>
        ))}
        <button
          className="app-carousel-surface"
          type="button"
          aria-label="Pause automatic slideshow"
          aria-pressed={paused}
          onClick={() => { if (!swiped.current) setPaused((value) => !value) }}
          onPointerDown={startSwipe}
          onPointerUp={endSwipe}
          onPointerCancel={() => { swipeStart.current = null }}
        />
        <button className="app-carousel-arrow app-carousel-prev" type="button" aria-label="Previous screenshot" onClick={() => advance(-1)}>
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" aria-hidden="true"><path d="m15 5-7 7 7 7" /></svg>
        </button>
        <button className="app-carousel-arrow app-carousel-next" type="button" aria-label="Next screenshot" onClick={() => advance(1)}>
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" aria-hidden="true"><path d="m9 5 7 7-7 7" /></svg>
        </button>
      </div>
      <p className="visually-hidden" aria-live={playing ? 'off' : 'polite'}>{active + 1} of {total}</p>
    </section>
  )
}
