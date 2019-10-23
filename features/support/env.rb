require 'json'
require 'rest-client'
require 'date'
require_relative './helper.rb'

# Sets up the Rails environment for Cucumber

SUPPORT_DIR = File.dirname(__FILE__)

class Cucumber::Core::Test::Step
  def name
    text
  end
end
