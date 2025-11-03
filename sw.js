self.addEventListener('install', (e) => {
    e.waitUntil(
      caches.open('trackva-v1').then((cache) =>
        cache.addAll(['./', './index.html'])
      )
    );
  });
  
  self.addEventListener('fetch', (e) => {
    e.respondWith(
      caches.match(e.request).then(
        (res) =>
          res ||
          fetch(e.request).then((resp) => {
            const copy = resp.clone();
            caches.open('trackva-v1').then((cache) =>
              cache.put(e.request, copy)
            );
            return resp;
          })
      )
    );
  });
  