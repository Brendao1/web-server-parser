# frozen_string_literal: true

require_relative 'lib/parser.rb'

parser = Parser.new(ARGV[0])
parser.run

puts "\n"
puts 'PAGE VISITS:'
parser.page_visits

puts "\n"
puts 'UNIQUE PAGE VIEWS:'
parser.unique_views
