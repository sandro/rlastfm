require File.join(File.dirname(__FILE__), %w(.. spec_helper))

describe Rlastfm::Artist do
  describe 'top artists' do
    before :all do
      FakeWeb.register_uri('http://www.last.fm/charts/artist', :file => site_file('charts.artist.html'))
      @top_artists = Rlastfm::Artist.top_twenty
    end

    it 'should be a list of 20 most popular bands' do
      @top_artists.size.should == 20
    end

    it 'should contain artists' do
      Rlastfm::Artist.should_receive(:new).at_least(20).times
      Rlastfm::Artist.top_twenty
    end
  end

  describe "instance" do
    before :all do
      FakeWeb.register_uri("http://ws.audioscrobbler.com/2.0?api_key=&artist=The%20Decemberists&method=artist.getinfo", :response => File.read(site_file("the_decemberists.getinfo.xml")))
    end

    before :each do
      @artist = Rlastfm::Artist.new 'The Decemberists'
    end

    describe 'albums' do
      before :all do
        FakeWeb.register_uri('http://ws.audioscrobbler.com/2.0?api_key=&artist=The%20Decemberists&method=artist.gettopalbums', :response => File.read(site_file('the_decemberists.gettopalbums.xml')))
      end

      it 'should return albums for an artist' do
        Rlastfm::Album.should_receive(:new).at_least(2).times
        @artist.albums
      end

      it 'should find an album by name' do
        album1 = mock(:album, :name => "one")
        album2 = mock(:album, :name => "two")
        @artist.stub!(:albums).and_return([album1, album2])
        @artist.album_by_name("two").should == album2
      end
    end

    describe '#exists?' do
      it 'has a music brainz id' do
        @artist.stub!(:mbid).and_return(nil)
        @artist.exists?.should_not be
      end

      it 'has no music brainz id' do
        @artist.stub!(:mbid).and_return('12345')
        @artist.exists?.should be
      end
    end

    describe "#similar_artists" do
      it 'has similar artists' do
        raw = {'similar' => {'artist' => [{"name"=>"Radiohead"}]}}
        @artist.stub!(:raw).and_return(raw)
        Rlastfm::Artist.should_receive(:new).with('Radiohead')

        @artist.similar_artists
      end
    end
  end
end

