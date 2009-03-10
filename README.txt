rlastfm
    by Sandro Turriate
    http://turriate.com

== DESCRIPTION:

Extremely minimal Last.fm wrapper.
This wrapper allows you to lookup an Artist by name, get their albums, and the tracks for each album.

== SYNOPSIS:

>> Rlastfm.api_key = "your lastfm api key"
>> Rlastfm.debug = true # watch the requests you make

>> artist = Rlastfm::Artist.new('radiohead')
=> #<Rlastfm::Artist:0x115bed0 @initialized_name="radiohead">

>> artist.name
=> "Radiohead"

>> artist.albums
[#<Rlastfm::Album:0xd598>, #<Rlastfm::Album:0xd599>]

>> artist.albums.first.name
=> "In Rainbows"

>> artist.albums.first.tracks
[#<Rlastfm::Track:0x18f38f0>, #<Rlastfm::Track:0x18f38f1>]

== REQUIREMENTS:

* hpricot
* httparty
* fakeweb (to run specs)

== INSTALL:

  FIXME

== LICENSE:

(The MIT License)

Copyright (c) 2008

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
