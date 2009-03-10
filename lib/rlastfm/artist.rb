module Rlastfm
  class Artist
    extend Helpers::RemoteAccessor
    include Helpers::Scraper
    include HTTParty

    base_uri "http://ws.audioscrobbler.com/2.0/"

    remote_reader :name, :mbid, :stats, :url, :bio
    remote_reader :from => :image, :to => :images

    def self.top_twenty
      doc = doc_for("/charts/artist")
      top_twenty = doc.at('.mediumImageChart')
      top_twenty.search('tr').map do |artist_row|
        name =  artist_row.search('.subject < a').last
        new name
      end
    end

    def initialize(name)
      self.class.default_params :api_key => Rlastfm.api_key
      @initialized_name = name
    end

    def album_by_name(album_name)
      albums.detect {|a| a.name == album_name}
    end

    def albums
      @albums ||= begin
        response = self.class.get('', :query => {:method => "artist.gettopalbums", :artist => name})
        album_collection = response['lfm']['topalbums']['album']
        album_collection.map{|album_attrs| Album.new album_attrs} if album_collection
      end
    end

    def exists?
      ! mbid.nil?
    end

    def raw
      @raw ||= remote_sync!
    end

    def similar_artists
      @similar_artists ||= begin
        raw['similar']['artist'].map do |artist|
          Artist.new artist['name']
        end
      end
    end

    private

    def remote_sync!
      response = self.class.get('', :query => {:method => 'artist.getinfo', :artist => @initialized_name})
      @synced = true
      @raw = response['lfm']['artist']
    end

    def synced?
      @synced == true
    end
  end
end

