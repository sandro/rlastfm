# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rlastfm}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sandro Turriate"]
  s.date = %q{2009-03-10}
  s.description = %q{minimal Last.fm wrapper. This wrapper allows you to lookup an Artist by name, get their albums, and the tracks for each album.}
  s.email = %q{sandro.turriate@gmail.com}
  s.extra_rdoc_files = ["History.txt", "README.txt"]
  s.files = ["History.txt", "README.txt", "Rakefile", "init.rb", "lib/core_extensions.rb", "lib/rlastfm.rb", "lib/rlastfm/album.rb", "lib/rlastfm/artist.rb", "lib/rlastfm/helpers/remote_accessor.rb", "lib/rlastfm/helpers/scraper.rb", "lib/rlastfm/track.rb", "lib/rlastfm/venue.rb", "rlastfm.gemspec", "script/console", "spec/rlastfm/album_spec.rb", "spec/rlastfm/artist_spec.rb", "spec/rlastfm/track_spec.rb", "spec/rlastfm/venue_spec.rb", "spec/site/charts.artist.html", "spec/site/the_decemberists.getinfo.xml", "spec/site/the_decemberists.gettopalbums.xml", "spec/site/the_decemberists.the_crane_wife.html", "spec/site/venue.8953935.html", "spec/spec_helper.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://turriate.com}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{rlastfm}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{minimal Last.fm wrapper.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
