# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

#"connects" carrierwave gem to the rails application
require 'carrierwave/orm/activerecord'