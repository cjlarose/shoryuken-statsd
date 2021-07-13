module Shoryuken
  module StatsD
    class Listener
      attr_reader :reporter

      def initialize(reporter:)
        @reporter = reporter
      end

      def register(shoryuken_config)
        shoryuken_config.on :dispatch, &method(:handle_dispatch)
      end

      private

      def handle_dispatch(event)
        puts "dispatch: #{event}"
        report_processor_metrics group: event[:group],
                                 manager: event[:manager]
        # report initial stats on first dispatch
        # After first dispatch, just update the dispatch counter
      end

      def report_processor_metrics(group:, manager:)
        @reporter.report_busy_processors group, manager.send(:busy)
        @reporter.report_max_processors group, manager.instance_variable_get(:@max_processors)
      end
    end
  end
end
