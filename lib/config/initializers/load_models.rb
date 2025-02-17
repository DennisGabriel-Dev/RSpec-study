# frozen_string_literal: true

models = Dir["#{File.dirname(__FILE__)}/../../models/*.rb"]
models.each { |model| require model }
