require 'csv'
STDOUT.sync = true

namespace :map do

  desc 'Create a json file from a SVG file'
  task :svg => :environment do
    doc = Nokogiri::XML(File.open(File.expand_path('map/map-usa.svg')))
    map = doc.css('path').each_with_object({}) { |node, map| map[node['id']] = node['d'] }

    file = File.expand_path('app/assets/javascripts/data/map.js')
    File.open(file, 'w') { |js| js.puts JSON.pretty_generate(map) }
  end
end