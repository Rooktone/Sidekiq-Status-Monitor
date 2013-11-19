require 'sidekiq'
require 'sidekiq/web'

if !ENV['SIDEKIQ_MONITOR_USER'] || !ENV['SIDEKIQ_MONITOR_PASSWORD']
  puts "DANGER! DANGER! DOCTOR JONES!"
  puts "You haven't setup your monitor username and password correctly. Make sure to set SIDEKIQ_MONITOR_USER and SIDEKIQ_MONITOR_PASSWORD before running this app"
end

ENV['SIDEKIQ_MONITOR_USER'] ||= "rickashley"
ENV['SIDEKIQ_MONITOR_PASSWORD'] ||= "nevergonnagiveyouup"

Sidekiq::Web.use Rack::Auth::Basic do |username, password|
  username == ENV['SIDEKIQ_MONITOR_USER'] && password == ENV['SIDEKIQ_MONITOR_PASSWORD']
end
run Sidekiq::Web

require ::File.expand_path('../config/environment',  __FILE__)
run SidekiqMonitor::Application
