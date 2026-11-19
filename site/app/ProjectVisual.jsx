import Image from 'next/image'

export default function ProjectVisual({ project }) {
  return (
    <div className={`project-visual ${project.storeImage ? 'store-visual' : 'original-visual'}`}>
      <Image src={project.image} alt={project.alt} fill sizes="(max-width: 680px) 95vw, 60vw" />
    </div>
  )
}
