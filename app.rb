require 'sinatra'
require 'sidekiq'

require_relative './config'
require_relative 'tasks'

class TaskSchedulerApp < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/schedule_task' do
    schedule_time = params['schedule_time']
    task = SimpleTask.new
    parsed_time = DateTime.parse(schedule_time)
    time_diff = (parsed_time - DateTime.now).to_i
  Sidekiq::Client.enqueue_in(time_diff, SimpleTask)

  "Task scheduled at #{schedule_time}"
  end
end