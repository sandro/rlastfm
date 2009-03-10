module Rlastfm
  class Venue
    include Helpers::Scraper

    def initialize(id)
      @venue_id = id
    end

    def id
      @venue_id
    end

    def photo
      @photo ||= begin
        url = "/venue/#{id}"
        doc = doc_for(url)
        image = doc.at('#catalogueImage')
        image.attributes['src']
      end
    end
  end
end

