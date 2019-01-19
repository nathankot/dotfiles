export function getObject(key) { // :: Object | null
  const str = window.localStorage.getItem(key);
  return JSON.parse(str); // Returns `null` when input is `null`
}

export function setObject(key, obj) {
  window.localStorage.setItem(key, JSON.stringify(obj));
}

export function cache(key, ttlSeconds, promiseProducer) {
  const now = (new Date()).getTime() / 1000;
  const existingCacheItem = getObject(key);

  if (existingCacheItem != null &&
      existingCacheItem.ts != null &&
      existingCacheItem.value != null &&
      existingCacheItem.ts > now - ttlSeconds) {
    console.log(`Returning value from cache for key: ${key}; ttl: ${ttlSeconds}s`);
    return Promise.resolve(existingCacheItem.value);
  }

  console.log(`Fetching new value for cache key: ${key}`);
  return promiseProducer()
    .then(value => {
      const newCacheItem = {
        ts: now,
        value: value,
      };
      setObject(key, newCacheItem);
      return value;
    });
};
