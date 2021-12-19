ENV["RUBY_ENV"] ||= "development"
require "bundler/setup"
require "dotenv/load" if ENV["RUBY_ENV"] != "production"

Bundler.require(:default, ENV["RUBY_ENV"])
loader = Zeitwerk::Loader.for_gem
loader.push_dir(File.dirname(__FILE__) + "/")
loader.setup

task :bot do
  NarutoBot.run
end

task :web do
  Rack::Server.start(
    Port: ENV["PORT"] || 4567,
    app: Webserver.new,
  )
end
  
task :all do
  Process.fork { Rake::Task["bot"].invoke }
  Process.fork { Rake::Task["web"].invoke }
  Process.waitall
end