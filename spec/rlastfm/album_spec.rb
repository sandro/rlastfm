require File.join(File.dirname(__FILE__), %w(.. spec_helper))

describe Rlastfm::Album do
  before do
    @album_url = 'http://www.last.fm/music/The+Decemberists/The+Crane+Wife'
    FakeWeb.register_uri(@album_url, :file => site_file('the_decemberists.the_crane_wife.html'))
    @album = Rlastfm::Album.new(:artist => "The Decemberists", :url => @album_url)
  end

  describe "#tracks" do
    it "has tracks" do
      Rlastfm::Track.should_receive(:new).at_least(2).times
      @album.tracks
    end
  end
end


__END__
{"name"=>"The Crane Wife", "artist"=>{"name"=>"The Decemberists", "url"=>"http://www.last.fm/music/The+Decemberists", "mbid"=>"97b1142f-c71e-4971-8736-4a8ceaf6b4c3"}, "url"=>"http://www.last.fm/music/The+Decemberists/The+Crane+Wife", "rank"=>"1", "playcount"=>"810107", "mbid"=>nil, "image"=>["http://userserve-ak.last.fm/serve/34s/16877009.jpg", "http://userserve-ak.last.fm/serve/64s/16877009.jpg", "http://userserve-ak.last.fm/serve/126/16877009.jpg"]}
