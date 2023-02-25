export Emojis

JSON = require "JSON"
http = require "http.request"
-- utf8 = require "lapis.util.utf8"
-- lpeg = require "lpeg"

log = => nil

class Emojis
    new: (host) =>
        @host = host
        @emojis = @@.fetch_host(host)
        
    __index: (key) => if key then @emojis[key] else @emojis
    __len: => #@emojis
    __tostring: => "Emojis: #{#@emojis} emoji(s) of #{@host}"

    download_index: (index) => @@.download @emojis[index]

    filter: (keyword) =>
        copy = @
        hits = {}

        for emoji in *@emojis
            if string.find emoji.name, keyword
                table.insert hits, emoji

        copy.emojis = hits
        return copy
        
    @fetch_host: (host) ->
        apiPath = "https://#{host}/api/emojis"
        log host
        headers, stream = assert http.new_from_uri(apiPath)\go!
        body = assert stream\get_body_as_string!
    
        if headers\get ":status" != 200
            error body
        emojis = JSON\decode body
        -- emojis = from_json body

        return emojis.emojis
    
    @download: (emoji, path using nil) ->
        { :url, :name } = emoji
        if path ~= nil then lfs.mkdir(path) else path = ''
        headers, stream = assert http.new_from_uri(url)\go!
        
        if headers\get ":status" != 200
            body = stream\get_body_as_string!
            error body
            
        ext = string.gsub headers\get("content-type"), ".+/", ""
        filename = "#{name}.#{ext}"
        log "#{url} -> #{filename}"

        if f = assert io.open path.."#{filename}", 'wb'
            assert stream\save_body_to_file f
            f\close!
        log "#{filename} downloaded"
        return filename