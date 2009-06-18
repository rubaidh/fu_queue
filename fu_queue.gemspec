spec = Gem::Specification.new do |s|
  s.name = 'fu_queue'
  s.version = '1.0.0'
  s.date = '2009-06-18'
  s.authors = ['Graeme Mathieson', 'Mark Connell' 'Rubaidh Ltd']
  s.email = 'support@rubaidh.com'
  s.rubyforge_project = 'rubaidh'
  s.homepage = 'http://rubaidh.com/portfolio/open-source'
  s.summary = '[Rails] Make the life of SMQueue easier in a Rails application'

  s.description = 'Make the life of SMQueue easier in a Rails application'

  s.files = %w(
    .gitignore MIT-LICENSE Rakefile README.rdoc CHANGELOG fu_queue.gemspec
    generators/fu_queue/fu_queue_generator.rb
    generators/fu_queue/templates/fu_queue.yml.erb
    lib/fu_queue.rb
  )

  s.add_dependency 'seanohalpin-smqueue', '>=0.2.1'

  s.has_rdoc = false
end