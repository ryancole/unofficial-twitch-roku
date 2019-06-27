const fetch = require("node-fetch");

const username = "gamesdonequick";
const applicationId = "pcdjy8a0sdxa91gw3tlav9iotrv7xn";

async function fetchAccessToken() {
  const url = `https://api.twitch.tv/api/channels/${username}/access_token?client_id=${applicationId}`;
  const response = await fetch(url);
  const { sig, token } = await response.json();
  return { sig, token };
}

async function fetchUsherStream(sig, token) {
  const url = `https://usher.ttvnw.net/api/channel/hls/${username}.m3u8?sig=${sig}&token=${encodeURI(
    token
  )}`;
  const response = await fetch(url);
  return response.url;
}

async function main() {
  const { sig, token } = await fetchAccessToken();
  const url = await fetchUsherStream(sig, token);
  console.log(url);
}

main();
