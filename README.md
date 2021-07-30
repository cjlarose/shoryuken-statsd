# shoryuken-statsd

Report Shoryuken metrics to StatsD or to DogStatsD

## Configuration

Using standard StatsD (and the [`statsd-ruby` gem](https://rubygems.org/gems/statsd-ruby)):

```ruby
Shoryuken.configure_server do |config|
  # configure middleware, if any, first, then:
  reporter = Shoryuken::StatsD::StatsDReporter.new Statsd.new('localhost', 9125)
  Shoryuken::StatsD.register shoryuken_config: config, reporter: reporter
end
```

For use with Datadog and DogStatsD (and the [`dogstatsd-ruby` gem](https://rubygems.org/gems/dogstatsd-ruby)):

```ruby
require 'datadog/statsd'

Shoryuken.configure_server do |config|
  # configure middleware, if any, first, then:
  reporter = Shoryuken::StatsD::DogStatsDReporter.new Datadog::Statsd.new('localhost', 8125)
  Shoryuken::StatsD.register shoryuken_config: config, reporter: reporter
end
```
