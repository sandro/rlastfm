require File.join(File.dirname(__FILE__), %w(.. spec_helper))

describe Rlastfm::Venue do
  before do
    @venue = Rlastfm::Venue.new("8953935")
    FakeWeb.register_uri("http://www.last.fm/venue/#{@venue.id}", :file => site_file("venue.#{@venue.id}.html"))
  end

  it 'should give me a photo for a venue' do
    image_src = @venue.photo
    URI.parse(image_src).should be_kind_of(URI::HTTP)
  end
end

