sub RunUserInterface()
    print "launching application ..."
    
    ' we will need somewhere for our screen to send event messages
    m.port = CreateObject("roMessagePort")
    
    ' create our scene graph canvas
    screen = CreateObject("roSGScreen")
    screen.setMessagePort(m.port)
    
    ' set the initial scene
    scene = screen.CreateScene("foo")
    
    ' show our canvas
    screen.show()
    
    while(true)
        msg = wait(0, m.port)
        msgType = type(msg)
        
        if msgType = "roSGScreenEvent"
            if msg.isScreenClosed() then return
        end if
    end while
end sub