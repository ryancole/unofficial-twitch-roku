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
  const channel = extractCommandArgs(process.argv);
  if (channel) {
    const { APPLICATION_ID } = process.env;
    const { sig, token } = await fetchAccessToken(channel, APPLICATION_ID);
    const url = await fetchUsherStream(channel, sig, token);
    console.log(url);
  }
}

function extractCommandArgs(argv) {
  if (argv.length != 3) {
    console.error("expects channel name on command line");
  } else {
    return argv[2];
  }
}

main();
