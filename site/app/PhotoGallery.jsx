'use client'

import Image from 'next/image'
import { useRef, useState } from 'react'

export default function PhotoGallery({ photos }) {
  const viewer = useRef(null)
  const [photo, setPhoto] = useState(null)

  function openPhoto(event, item) {
    if (!viewer.current || event.metaKey || event.ctrlKey || event.shiftKey || event.altKey) return
    event.preventDefault()
    setPhoto(item)
    viewer.current.showModal()
  }

  return (
    <>
      <div className="photo-masonry">
        {photos.map((item) => {
          const [src, alt, title, caption, width, height] = item
          return (
            <figure key={src}>
              <a href={src} aria-label={`View full photo: ${title}`} onClick={(event) => openPhoto(event, item)}>
                <Image src={src} alt={alt} width={width} height={height} sizes="(max-width: 480px) 92vw, (max-width: 1000px) 44vw, 28vw" />
              </a>
              <figcaption><strong>{title}</strong><span>{caption}</span></figcaption>
            </figure>
          )
        })}
      </div>
      <dialog ref={viewer} className="photo-viewer" aria-labelledby="photo-title" onClose={() => setPhoto(null)}>
        <div className="photo-viewer-bar">
          <h3 id="photo-title">{photo?.[2]}</h3>
          <button type="button" className="button" onClick={() => viewer.current.close()}>Close</button>
        </div>
        {photo && <Image src={photo[0]} alt={photo[1]} width={photo[4]} height={photo[5]} />}
      </dialog>
    </>
  )
}
