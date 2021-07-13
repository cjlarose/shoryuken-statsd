module Shoryuken
  module StatsD
    class Listener
      attr_reader :reporter

      def initialize(reporter:)
        @reporter = reporter
      end

      def register(shoryuken_config)
        shoryuken_config.on :utilization_update, &method(:handle_utilization_update)
      end

      private

      def handle_utilization_update(event)
        group = event[:group]
        @reporter.report_max_processors group, event[:max_processors]
        @reporter.report_busy_processors group, event[:busy_processors]
      end
    end
  end
end
