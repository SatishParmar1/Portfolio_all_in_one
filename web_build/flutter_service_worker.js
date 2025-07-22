'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "5c2bc86320a1bff91ec4335f6b0bdec8",
"assets/assets/images/iot1.jpg": "5b48cc18076273a5a53de5cb4c4b0924",
"assets/assets/images/photo4.jpg": "717b9b747e0c2ce1e78ca976f9bec0f0",
"assets/assets/images/html.png": "0ec51aa8901a3775f086d93668ce5fea",
"assets/assets/images/rms.jpg": "17a1ba456d1a162196756688c2653a53",
"assets/assets/images/photo3.jpg": "e58f0989cca9d19a7a242d6964b6ac73",
"assets/assets/images/internshala.png": "fd1b983b4cf657405e070b4e244cad9d",
"assets/assets/images/celeballogo.png": "b49e1b78e0b465a7ddf12ff2fb4e490a",
"assets/assets/images/cpp.png": "ce2ae30b32597bf866a72bc94ef156d7",
"assets/assets/images/flutter.png": "4262c71228b7aa391e995fe5f1d57795",
"assets/assets/images/shreesai.jpg": "929617bbe2449441e9bd04ab6b30fc57",
"assets/assets/images/vscode.png": "65d267fe0778bf0876b582f41bc01cd7",
"assets/assets/images/gdsclogo.png": "b882f95855e874f4a3fb900c2e86de0e",
"assets/assets/images/smartinternzlogo.png": "9794934dc3833b147968145f4455dbf9",
"assets/assets/images/iot.png": "e647b76f493f51bb1abfed18ba6b3082",
"assets/assets/images/css.png": "c0074b2af3e8ec4bb4096e008c24b41d",
"assets/assets/images/news.jpg": "420c6f23259eebdd2cce578b9bb59540",
"assets/assets/images/working1.jpg": "bfd65a56c677f877ef0741f690afb294",
"assets/assets/images/photo1.jpg": "c7006cd06fc0c847e47a61e68722faba",
"assets/assets/images/hello2.gif": "0822696e1eca68ac53ecd489566d7d8d",
"assets/assets/images/java.png": "f13e4dfde7095f4da04d1bdd5abdfa25",
"assets/assets/images/sqlite.png": "6c0257a6722c03fcf04bbb5aa93c22dd",
"assets/assets/images/headerlogo44.png": "4f1ee5a2361f94e288fe54afebd9d033",
"assets/assets/images/github.png": "9188cd819869b06cef8c2bde27ed1d53",
"assets/assets/images/arduino.png": "6c36774868dc8acc9c92776cd9628360",
"assets/assets/images/regriplogo.png": "c9d7ecc58a1f079d24fbaa0bb8bb8a92",
"assets/assets/images/git.png": "bbc51e5560d008f104435bc8abeb64a9",
"assets/assets/images/flamingo.jpg": "fd1a840c4d8abfdcf520cf32d067fd38",
"assets/assets/images/sql.png": "097d0117094aba96ebbe8393f87ae7e0",
"assets/assets/images/headerlogo4.png": "fe41395ea9f41e07d50b10457458876a",
"assets/assets/images/api.png": "2e7ad6059b9d886d922a0aaec03c2c9a",
"assets/assets/images/pietlogo.png": "a4742aa30597183d19068ff76a5f31a5",
"assets/assets/images/photo2.jpg": "3f7fc0e018843ab2697e88a6195c9742",
"assets/assets/images/SKY.jpg": "9041c675aaeed0ba43df1db369b44289",
"assets/assets/images/nobleschoollogo.png": "140d885d74be6c756ed3526d16af418a",
"assets/assets/images/android-studio.png": "5a814660c6e142c48f5d7241c45e4597",
"assets/assets/images/learnandbuildlogo.png": "11304f5643c55ac5bb4c33476e592afe",
"assets/assets/images/dart.png": "586ecc41d871afc1f3833c33c53294e4",
"assets/assets/images/headerlogo4.jpg": "6925642bdff2aa3b4cd370b3e11eb771",
"assets/assets/images/firebase.png": "0e8789d152ed2744d7f7265dc3f1457e",
"assets/assets/fonts/Outfit-VariableFont_wght.ttf": "1b443ee3b6993db873f1faedffe56133",
"assets/assets/fonts/Outfit-Regular.ttf": "9f444021dd670d995f9341982c396a1d",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/AssetManifest.json": "63ee1782805917eb5165e4345bb77b10",
"assets/fonts/MaterialIcons-Regular.otf": "c6ef9427250c3385eda4194f4ecac4b5",
"assets/AssetManifest.bin.json": "4b1b2a283d24b7df93d8a837b19d344b",
"assets/NOTICES": "9cf9d5de8a44a568c450707b32367a74",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "a2eb084b706ab40c90610942d98886ec",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "3ca5dc7621921b901d513cc1ce23788c",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "4655496372e22e93554de30649b61e9b",
"version.json": "009c9e65172e010890f7f65fde438006",
"manifest.json": "d40c47d1c161f94dbcb13094d37f1f55",
"flutter_bootstrap.js": "e9b9164daa1227a2a058f076dbf85267",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"index.html": "1ca355e99145dde138154c52cd236273",
"/": "1ca355e99145dde138154c52cd236273",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"main.dart.js": "5e4578bca9ff1d9975f380a459ee059a"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
