require "rubygems"
require "bundler/setup"
require "multi_json"

abort("usage: dispatch.rb FILENAME") unless file = ARGV[0]
data = MultiJson.load(File.read(file))

workers  = data["workers"]
requests = data["requests"]

puts "Dispatching #{requests.size} to #{workers.size} workers..."
