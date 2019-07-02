require("dotenv").config();

const fetch = require("node-fetch");

async function fetchAccessToken(channel, applicationId) {
  const url = `https://api.twitch.tv/api/channels/${channel}/access_token?client_id=${applicationId}`;
  const response = await fetch(url);
  const { sig, token } = await response.json();
  return { sig, token };
}

async function fetchUsherStream(channel, sig, token) {
  const encodedToken = encodeURI(token);
  const url = `https://usher.ttvnw.net/api/channel/hls/${channel}.m3u8?sig=${sig}&token=${encodedToken}`;
  const response = await fetch(url);
  return response.url;
}

async function main() {
  const { CHANNEL, APPLICATION_ID } = process.env;
  const { sig, token } = await fetchAccessToken(CHANNEL, APPLICATION_ID);
  const url = await fetchUsherStream(CHANNEL, sig, token);
  console.log(url);
}

main();
