RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end
