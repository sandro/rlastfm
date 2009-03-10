require File.join(File.dirname(__FILE__), %w(.. spec_helper))

describe Rlastfm::Track do
  describe "#initialize" do
    before do
      @raw = {:album => 'foo', :artist => 'bar', :duration => '1:24', :name => "thunder", :number => 1}
    end
    it 'album' do
      Rlastfm::Track.new(@raw).album.should == @raw[:album]
    end

    it 'artist' do
      Rlastfm::Track.new(@raw).artist.should == @raw[:artist]
    end

    it 'duration' do
      Rlastfm::Track.new(@raw).duration.should == @raw[:duration]
    end

    it 'name' do
      Rlastfm::Track.new(@raw).name.should == @raw[:name]
    end

    it 'number' do
      Rlastfm::Track.new(@raw).number.should == @raw[:number]
    end
  end
end

