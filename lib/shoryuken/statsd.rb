require_relative './statsd/listener'
require_relative './statsd/dogstatsd_reporter'

module Shoryuken
  module StatsD
    class << self
      def register(shoryuken_config:, reporter:)
        listener = Listener.new reporter: reporter
        listener.register shoryuken_config
        nil
      end
    end
  end
end
