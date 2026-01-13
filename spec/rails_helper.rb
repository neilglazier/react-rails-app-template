require 'spec_helper'

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'

# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?

# Uncomment the line below in case you have `--require rails_helper` in the `.rspec` file
# that will avoid rails generators crashing because migrations haven't been run yet
# return unless Rails.env.test?

require 'rspec/rails' # Add additional requires below this line. Rails is not loaded until this point!


begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_paths = [ Rails.root.join('spec/fixtures') ]

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = false

  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do |example|
    DatabaseCleaner.start

    # Configure Rails.cache to use RedisCacheStore with mock_redis
    # We disable connection pooling so Rails.cache.redis returns the mock directly
    mock_redis = MockRedis.new

    # Store mock_redis on the example so it's accessible in tests and cleanup
    example.instance_variable_set(:@mock_redis, mock_redis)

    Rails.cache = ActiveSupport::Cache::RedisCacheStore.new(
      redis: mock_redis,
      compress: true,
      compress_threshold: 1024,
      pool_size: 1,
      pool_timeout: 0
    )

    # Stub Rails.cache.redis to return the mock_redis directly
    # This bypasses the ConnectionPool wrapper
    allow(Rails.cache).to receive(:redis).and_return(mock_redis)
  end

  config.append_after(:each) do |example|
    DatabaseCleaner.clean


    mock_redis = example.instance_variable_get(:@mock_redis)
    mock_redis&.flushdb # Clean up mock_redis after each test
  end


  config.filter_rails_from_backtrace!
end
