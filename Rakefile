require "bundler/gem_tasks"
require "rake/testtask"

desc "Import new elasticsearch-paramedic version"
task :import do
  [
    "rm -rf public/elasticsearch-paramedic",
    "git clone https://github.com/karmi/elasticsearch-paramedic.git public/elasticsearch-paramedic",
    "cd public/elasticsearch-paramedic && rm -rf .git* elasticsearch-paramedic-screenshot.png MIT-LICENSE Rakefile README.md",
    "git add public/elasticsearch-paramedic && git commit -m 'update elasticsearch-paramedic'"
  ].each do |command|
    puts command
    `#{command}`
  end
end

Rake::TestTask.new do |t|
  t.libs << "lib"
  t.test_files = FileList["test/*_test.rb"]
  t.ruby_opts = ["-r./test/test_helper.rb"]
  t.verbose = true
end

task :default => :test
