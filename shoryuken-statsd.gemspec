Gem::Specification.new do |s|
  s.name        = 'shoryuken-statsd'
  s.version     = '0.0.0'
  s.summary     = "StatsD integration for shoryuken"
  s.description = "Publishes shoryuken metrics to StatsD"
  s.authors     = ["Chris LaRose"]
  s.email       = 'cjlarose@gmail.com'
  s.files       = `git ls-files -z`.split("\x0")
  s.homepage    = 'https://rubygems.org/gems/shoryuken-statsd'
  s.license     = 'LGPL-3.0'

  s.add_runtime_dependency 'shoryuken', '~> 5.2', '>= 5.2.3'
end
