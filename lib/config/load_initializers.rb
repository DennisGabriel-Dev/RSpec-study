# frozen_string_literal: true

initializers = Dir["#{File.dirname(__FILE__)}/initializers/*.rb"]
initializers.each { |initializer| require initializer }
