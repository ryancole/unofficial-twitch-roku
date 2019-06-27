sub init()
    m.top.setFocus(true)
    initializeVideo()
end sub

function initializeVideo()
    content = createObject("roSGNode", "ContentNode")
    content.url = "https://usher.ttvnw.net/api/channel/hls/gamesdonequick.m3u8?sig=527b1f79d782d31ad9805377a14a9b4814d487d1&token=%7B%22adblock%22:false,%22authorization%22:%7B%22forbidden%22:false,%22reason%22:%22%22%7D,%22blackout_enabled%22:false,%22channel%22:%22gamesdonequick%22,%22channel_id%22:22510310,%22chansub%22:%7B%22restricted_bitrates%22:%5B%5D,%22view_until%22:1924905600%7D,%22ci_gb%22:false,%22geoblock_reason%22:%22%22,%22device_id%22:null,%22expires%22:1561613319,%22game%22:%22Dead%20Rising%22,%22hide_ads%22:false,%22https_required%22:false,%22mature%22:false,%22partner%22:false,%22platform%22:null,%22player_type%22:null,%22private%22:%7B%22allowed_to_view%22:true%7D,%22privileged%22:false,%22server_ads%22:true,%22show_ads%22:true,%22subscriber%22:false,%22turbo%22:false,%22user_id%22:null,%22user_ip%22:%2247.189.58.178%22,%22version%22:2%7D"
    content.live = true
    content.title = "test"
    content.streamformat = "hls"
    
    m.video = m.top.findNode("twitch-stream")
    m.video.content = content
    m.video.control = "play"
end function
