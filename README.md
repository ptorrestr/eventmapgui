== README

Stop to run application:

rake db:create
rake db:migrate
#Optionally rake db:populate

#install bootstrap, less
rails generate bootstrap:install less

# Production
rake assets:clean
rake assets:precompile

rake db
