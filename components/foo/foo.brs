sub init()
    m.top.setFocus(true)
    
    ' accessToken = fetchAccessToken()
    ' print accessToken
    
    initializeVideo()
end sub

function fetch(url)
    xfer = CreateObject("roURLTransfer")
    xfer.SetUrl(url)
    return xfer.gettostring()
end function

function fetchAccessToken()
    channel = "chocotaco"
    applicationId = "pcdjy8a0sdxa91gw3tlav9iotrv7xn"
    url = Substitute("https://api.twitch.tv/api/channels/${0}/access_token?client_id=${1}", channel, applicationId)
    return fetch(url)
end function

function initializeVideo()
    content = createObject("roSGNode", "ContentNode")
    content.url = "https://usher.ttvnw.net/api/channel/hls/joolie.m3u8?sig=fbd1a88365ae85ae29460f3d1efa5865ac2b3a5f&token=%7B%22adblock%22:false,%22authorization%22:%7B%22forbidden%22:false,%22reason%22:%22%22%7D,%22blackout_enabled%22:false,%22channel%22:%22joolie%22,%22channel_id%22:109974018,%22chansub%22:%7B%22restricted_bitrates%22:%5B%5D,%22view_until%22:1924905600%7D,%22ci_gb%22:false,%22geoblock_reason%22:%22%22,%22device_id%22:null,%22expires%22:1563429972,%22game%22:%22PLAYERUNKNOWN%27S%20BATTLEGROUNDS%22,%22hide_ads%22:false,%22https_required%22:false,%22mature%22:false,%22partner%22:false,%22platform%22:null,%22player_type%22:null,%22private%22:%7B%22allowed_to_view%22:true%7D,%22privileged%22:false,%22server_ads%22:true,%22show_ads%22:true,%22subscriber%22:false,%22turbo%22:false,%22user_id%22:null,%22user_ip%22:%2247.189.58.168%22,%22version%22:2%7D"
    content.live = true
    content.title = "test"
    content.streamformat = "hls"
    
    m.video = m.top.findNode("twitch-stream")
    m.video.content = content
    m.video.control = "play"
    m.video.setFocus(true)
end function
