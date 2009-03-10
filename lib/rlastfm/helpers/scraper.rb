module Rlastfm
  module Helpers
    module Scraper
      def self.included(base)
        base.class_eval do
          protected

          extend ProtectedClassMethods
          include ProtectedInstanceMethods
        end
      end

      module ProtectedClassMethods
        def last_fm_uri(path)
          URI::HTTP.build :host => "www.last.fm", :path => path
        end

        def doc_for(url_or_path)
          url_or_path = URI.parse(url_or_path)
          url = url_or_path.relative? ? last_fm_uri(url_or_path.to_s).to_s : url_or_path

          if Rlastfm.debug
            puts "Releasing scraper on: #{url}"
          end

          doc = Hpricot open(url)
        end
      end

      module ProtectedInstanceMethods
        def doc_for(url_or_path)
          self.class.doc_for(url_or_path)
        end
      end
    end
  end
end

