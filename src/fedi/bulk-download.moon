socket = require "socket"
uuid = require "uuid"
JSON = require "JSON"
http = require "http.request"
require "lfs"


uuid.randomseed socket.gettime!*10000

DownloadWorker = (emoji, downloader, host) ->
    print "Downloading #{emoji.name} ..."
    filename = downloader emoji, 'downloaded/'
    downloaded = filename and true or false
    
    return { :filename, :downloaded, :emoji }

    
export Bulk_download = (emojis) ->
    list = {}

    for emoji in *emojis.emojis
        table.insert list, DownloadWorker emoji, emojis.__class.download, emojis.host
    
    return {
        metaVersion: 2
        host: emojis.host
        exportedAt: "NA"
        emojis: list
    }
'
{
    "metaVersion": 2,
    "host": "stella.place",
    "exportedAt": "Sat Feb 25 2023 05:10:57 GMT+0000 (Coordinated Universal Time)"
    "emojis": [
        {filename: "filename", downloaded: true or false, emoji: {
            #{emoji}
        }}
    ]
}
'