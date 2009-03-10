module Rlastfm
  class Album
    include Helpers::Scraper

    attr_reader :raw
    attr_accessor :artist, :images, :name, :play_count, :rank, :url

    def initialize(hash={})
      @raw = hash.stringify_keys!
      @images = hash['images'] || hash['image']
      @name = hash['name']
      @play_count = hash['play_count'] || hash['playcount']
      @rank = hash['rank']
      @url = hash['url']
      if (a = hash['artist'])
        @artist = a.is_a?(Hash) ? a['name'] : a
      end
    end

    def tracks
      @tracks ||= get_tracks
    end

    private

    def get_tracks
      doc = doc_for(url)
      artist_container = doc.at(".albumHead h1")
      artist = artist_container.at("a").inner_text
      track_container = doc.at("#albumTracklist")

      track_container.search("tbody tr").map do |row|
        Track.new \
          :artist => artist,
          :album => name,
          :number => row.at(".positionCell").to_plain_text,
          :name => row.at(".subjectCell a").inner_text,
          :duration => row.at(".durationCell").to_plain_text
      end
    end
  end
end
