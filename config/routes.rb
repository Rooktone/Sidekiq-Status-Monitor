SidekiqMonitor::Application.routes.draw do
  mount Sidekiq::Web.new, :at => "/sidekiq_status"
end
