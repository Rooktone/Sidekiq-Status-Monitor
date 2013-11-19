#Sidekiq Monitor Application

This is a rails app which can be run as a standalone Sidekiq Monitor and connect to an external or local redis.
It is built on top of sidekiq-web and can be used to keep track of your sidekiq setup.


##Usage

###Run it.
 * Clone out the app to your local machine.
 * bundle install
 * `bundle exec rackup -s thin -p 3000`
 * open your favoured web browser and navigate to http://localhost:3000/sidekiq_status
 * login using the default username and password (config.ru)
 * use the web panel to navigate around and monitor your sidekiq installation

###External Redis
In most production systems, your redis will be hosted externally.
In order to access this, you will need to provide the redis url to the app

 `REDIS_URL=redis://user:pass@myhost:12345 bundle exec rackup -s thin -p 3000`


###Configuration
There are a bunch of configuration variables available to help customize and secure your version of the sidekiq monitor.

 * REDIS_URL
 * SIDEKIQ_NAMESPACE
 * SIDEKIQ_MONITOR_USER
 * SIDEKIQ_MONITOR_PASSWORD









