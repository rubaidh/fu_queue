class FuQueueGenerator < Rails::Generator::NamedBase
  def initialize(runtime_args, runtime_options = {})
    runtime_args = ["default_queue"] if runtime_args.blank?
    super
  end

  def manifest
    record do |m|
      m.directory 'config'
      m.template 'fu_queue.yml.erb', File.join('config', 'fu_queue.yml')
    end
  end

  def queue_name
    file_name
  end

  def app_name
    File.basename(RAILS_ROOT)
  end
end
