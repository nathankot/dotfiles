export function cache(key, ttlSeconds, promiseProducer) {
  const now = (new Date()).getTime() / 1000;

  const existingCacheItemString = window.localStorage.getItem(key);
  const existingCacheItemJSON = JSON.parse(existingCacheItemString); // Returns `null` when input is `null`

  if (existingCacheItemJSON != null &&
      existingCacheItemJSON.ts != null &&
      existingCacheItemJSON.value != null &&
      existingCacheItemJSON.ts > now - ttlSeconds) {
    console.log(`Returning value from cache for key: ${key}; ttl: ${ttlSeconds}s`);
    return Promise.resolve(existingCacheItemJSON.value);
  }

  console.log(`Fetching new value for cache key: ${key}`);
  return promiseProducer()
    .then(value => {
      const newCacheItem = {
        ts: now,
        value: value,
      };
      window.localStorage.setItem(key, JSON.stringify(newCacheItem));
      return value;
    });
};
