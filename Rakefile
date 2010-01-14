require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('ttt-generators', '0.3.3') do |p|
  p.project        = "ttt-niftygenerators"
  p.description    = "A collection of useful generator scripts for Rails, modified for TTT's use."
  p.url            = "http://github.com/threetee/nifty-generators"
  p.author         = 'Ryan Bates'
  p.email          = "ryan (at) railscasts (dot) com"
  p.ignore_pattern = ["script/*"]
  p.development_dependencies = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }
