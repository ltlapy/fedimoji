require "lapis"
require "emojis"
require "bulk-download"
JSON = require "JSON"

getYN = (msg, default) ->
    out = nil
    answer = ''
    while out == nil
        io.write msg
        if default
            io.write " (Y/n) "
        else 
            io.write " (y/N) "

        io\flush!
        answer = string.lower io.read 1
        if string.find answer, 'y'
            out = true
        elseif string.find answer, 'n'
            out = false
        else
            out = default or false
    
    return out

print "인스턴스 호스트 명을 입력하세요"
host = io.read!
print "#{host}의 이모지를 가져옵니다..."
emojis = assert Emojis "#{host}"
print "#{#emojis}개의 이모지를 가져왔습니다."

print "검색어를 입력해 주세요"
keyword = io.read!
emojis = emojis\filter(keyword)

for emoji in *emojis.emojis
    print emoji.name

print "#{#emojis} 개의 이모지를 다운로드합니다"

test = getYN '계속하시겠습니까?'
print test

-- emojis\download_index 1
meta = Bulk_download emojis
if f = assert io.open filename or "meta.json", 'w'
    f\write JSON\encode_pretty meta
    f\close!