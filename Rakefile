# Look in the tasks/setup.rb file for the various options that can be
# configured in this Rakefile. The .rake files in the tasks directory
# are where the options are used.

begin
  require 'bones'
  Bones.setup
rescue LoadError
  begin
    load 'tasks/setup.rb'
  rescue LoadError
    raise RuntimeError, '### please install the "bones" gem ###'
  end
end

ensure_in_path 'lib'
require 'rlastfm'

task :default => 'spec:run'

PROJ.name = 'rlastfm'
PROJ.summary = "minimal Last.fm wrapper."
PROJ.description = %Q(#{PROJ.summary}
This wrapper allows you to lookup an Artist by name, get their albums, and the tracks for each album.)
PROJ.authors = 'Sandro Turriate'
PROJ.email = 'sandro.turriate@gmail.com'
PROJ.url = 'http://turriate.com'
PROJ.version = Rlastfm::VERSION
PROJ.rubyforge.name = 'rlastfm'
PROJ.gem.development_dependencies = []

PROJ.spec.opts << '--color'
PROJ.ignore_file = '.gitignore'

# EOF
