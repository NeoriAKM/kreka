# frozen_string_literal: true
require_relative './api'

home = Dir.home

class ExtAPI < BasicObject
  KrekaExt = ::KrekaExt
end

begin
  ext = ExtAPI.new

  Dir.glob("#{home}/.progwi0/kreka/ext/*.{kreka,rb,kr}").each do |filus|
    readus = File.read(filus)
    ext.instance_eval(readus, filus)
  end
rescue StandardError => e
  puts "Sorry."
end