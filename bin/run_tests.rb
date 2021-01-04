# frozen_string_literal: true

require './lib/base_test_case'
require 'require_all'

require_all './test'

ObjectSpace.each_object(Class) do |klass|
  next unless klass < BaseTestCase

  begin
    test = klass.new
    puts "\n\n*** #{test.description} ***\n\n"
    test.run
  rescue StandardError => e
    puts e.full_message
  end
end
