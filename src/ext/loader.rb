# frozen_string_literal: true

home = Dir.home

begin
  Dir.glob("#{home}/.progwi0/kreka/ext/*.{kreka,rb,kr}").each do |filus|
    load(filus)
  end
rescue StandardError
  puts 'Sorry.'
end
