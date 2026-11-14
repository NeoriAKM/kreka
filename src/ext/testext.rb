# frozen_string_literal: true

require_relative '../copies/api'

KrekaExt.addButton('preferences', 'right') do
  KrekaExt.newWindow('Test.', 'https://example.com/')
end
