module Rlastfm
  # :stopdoc:
  VERSION = '0.0.1'
  LIBPATH = ::File.expand_path(::File.dirname(__FILE__)) + ::File::SEPARATOR
  PATH = ::File.dirname(LIBPATH) + ::File::SEPARATOR

  # :startdoc:

  # Returns the version string for the library.
  #
  def self.version
    VERSION
  end

  # Returns the library path for the module. If any arguments are given,
  # they will be joined to the end of the libray path using
  # <tt>File.join</tt>.
  #
  def self.libpath( *args )
    args.empty? ? LIBPATH : ::File.join(LIBPATH, args.flatten)
  end

  # Returns the lpath for the module. If any arguments are given,
  # they will be joined to the end of the path using
  # <tt>File.join</tt>.
  #
  def self.path( *args )
    args.empty? ? PATH : ::File.join(PATH, args.flatten)
  end

  # Utility method used to require all files ending in .rb that lie in the
  # directory below this file that has the same name as the filename passed
  # in. Optionally, a specific _directory_ name can be passed in such that
  # the _filename_ does not have to be equivalent to the directory.
  #
  def self.require_all_libs_relative_to( fname, dir = nil )
    dir ||= ::File.basename(fname, '.*')
    search_me = ::File.expand_path(
        ::File.join(::File.dirname(fname), dir, '**', '*.rb'))

    Dir.glob(search_me).sort.each {|rb| require rb}
  end

  class << self
    attr_accessor :api_key, :debug
  end

  self.debug = false
end  # module Rlastfm

%w(rubygems hpricot open-uri httparty).each { |l| require l }

module HTTParty
  class Request
    def perform_with_debug
      if Rlastfm.debug
        puts "Performing request to: #{uri.to_s}"
      end
      perform_without_debug
    end

    alias_method :perform_without_debug, :perform
    alias_method :perform, :perform_with_debug

    def query_string_with_sorting(uri)
      unsorted = query_string_without_sorting(uri)
      unsorted.split("&").sort.join("&") if unsorted
    end

    alias_method :query_string_without_sorting, :query_string
    alias_method :query_string, :query_string_with_sorting
  end
end


helper_libs = File.join(File.dirname(__FILE__), %w(rlastfm helpers *.rb))
Dir.glob(helper_libs).each { |l| require l }

require File.join(File.dirname(__FILE__), 'core_extensions')

Rlastfm.require_all_libs_relative_to(__FILE__)

# EOF
