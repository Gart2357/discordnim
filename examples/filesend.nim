## Has to be compiled with 
## '-d:ssl' and '--threads:on' flags

import asyncdispatch, discord

proc messageCreate(s: Session, m: MessageCreate) =
    if s.cache.me.id == m.author.id: return
    if m.content == "img":
        # will not work without editing the httpclient library
        # refer to https://github.com/nim-lang/Nim/pull/5711/files
        discard s.SendFileWithMessage(m.channel_id, "some_image.png", "asdasd")

let s = NewSession("Bot <token>")
s.messageCreate = messageCreate

waitFor s.SessionStart()