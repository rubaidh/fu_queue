# FuQueue
class FuQueue
  class << self
    def [](queue_name)
      ( @queues ||= {} )[queue_name] ||= new(queue_name)
    end
  end

  def initialize(queue_name)
    @sm_queue = SMQueue.new(YAML.load_file("#{RAILS_ROOT}/config/fu_queue.yml")[RAILS_ENV][queue_name.to_s])
  end

  def get
    if block_given?
      @sm_queue.get do |message|
        yield YAML.parse(message.body).transform
      end
    else
      YAML.parse(@sm_queue.get.body).transform
    end
  end

  def put(message)
    @sm_queue.put(message.to_yaml)
  end
end