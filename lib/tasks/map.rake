require 'csv'
require 'nokogiri'
STDOUT.sync = true

namespace :map do

  desc 'Create a json file from a SVG file'
  task :svg => :environment do
    doc = Nokogiri::XML(File.open(File.expand_path('map/map-usa.svg')))
    map = doc.css('path').each_with_object([]) { |node, map| map << {:name => node['id'] , :path => node['d'], :clicks => 0} }

    file = File.expand_path('app/assets/javascripts/data/map.js')
    File.open(file, 'w') { |js|  js.puts "mapData = #{JSON.pretty_generate(map)}" }
  end
end