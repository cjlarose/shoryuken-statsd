module Shoryuken
  module StatsD
    class DogStatsDReporter
      attr_reader :statsd

      def initialize(statsd)
        @statsd = statsd
      end

      def report_max_processors(group, processors)
        @statsd.gauge 'shoryuken.max_processors',
                      processors,
                      tags: ["group:#{group}"]
      end

      def report_busy_processors(group, processors)
        @statsd.gauge 'shoryuken.busy_processors',
                      processors,
                      tags: ["group:#{group}"]
      end
    end
  end
end
