lapis = require "lapis"
require "fedi.emojis"
require "fedi.bulk-download"

SampleHosts = {
  'k.lapy.link'
}

class extends lapis.Application
  "/": =>
    "Welcome to Lapis #{require "lapis.version"}!"

  [emojis_default: "/emojis"]: =>
    @html ->
      h1 "Emojis for hosts"
      p ->
        "Sample:"
        for host in *SampleHosts
          a href: @url_for("emojis", :host), host

  [emojis: "/emojis/:host"]: =>
    host_emojis = assert Emojis "#{@params.host}"
    @html ->
      h1 'Test hosts'
      hr
      p 'You requested the host: ' .. @params.host
      p "The host has #{#host_emojis} emoji(s)"
      

  