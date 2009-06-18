require 'rake'
require 'rake/rdoctask'
require 'rake/gempackagetask'
require 'rubyforge'

task :clean => [:clobber_rdoc, :clobber_package]

desc 'Generate documentation for the fu_queue gem.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Fu Queue'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

gem_spec = eval(File.read('fu_queue.gemspec'))

Rake::GemPackageTask.new(gem_spec) do |p|
  p.need_tar = false
  p.need_zip = false
end

desc 'Package and upload the release to rubyforge.'
task :release => [:clean, :package] do |t|
  rubyforge = RubyForge.new.configure
  rubyforge.login
  rubyforge.add_release gem_spec.rubyforge_project, gem_spec.name, gem_spec.version.to_s, "pkg/#{gem_spec.name}-#{gem_spec.version}.gem"
end

task :bamboo => [ :package ]
