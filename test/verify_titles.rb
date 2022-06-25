# frozen-string-literal: true

require_relative '../lib/base_test_case'

class VerifyTitles < BaseTestCase
  def initialize
    super
    @description = "#{__FILE__.split('/').last} - " \
      'Verify post titles display properly'
  end

  def run
    visit '/'

    titles = page.all('h3').map(&:text)
    puts "#{titles.length} titles found."
    raise 'No titles found, reddit broke?' if titles.empty?

    titles.each_with_index do |text, idx|
      warn 'Blank title found, reddit bent?' if text.empty?
      puts "#{idx + 1}: #{text}"
    end
  end
end
