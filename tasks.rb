require 'sidekiq'

class SimpleTask
  include Sidekiq::Worker

  def perform
    puts "Executing a simple task at #{Time.now}"
  end
end
