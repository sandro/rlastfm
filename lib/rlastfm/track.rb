module Rlastfm
  class Track
    attr_accessor :album, :artist, :duration, :name, :number

    def initialize(hash={})
      hash.each {|k,v| instance_variable_set("@#{k}", v) }
    end
  end
end

