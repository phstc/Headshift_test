require 'rake'
require 'rspec/core/rake_task'
require File.dirname(__FILE__) + '/app/main.rb'


desc "Run all specs"
RSpec::Core::RakeTask.new(:default) do |spec|
  main = Main.new
  main.show_questions
  main.serialize
  spec.pattern = 'spec/*_spec.rb'
  # spec.rspec_opts = ['--backtrace']
end