// Retire the cache left by the previous Flutter website.
self.addEventListener('install', (event) => {
  event.waitUntil(self.skipWaiting())
})

self.addEventListener('activate', (event) => {
  event.waitUntil((async () => {
    await Promise.all([
      caches.delete('flutter-app-manifest'),
      caches.delete('flutter-temp-cache'),
      caches.delete('flutter-app-cache'),
    ])
    await self.clients.claim()
    await self.registration.unregister()
  })())
})
