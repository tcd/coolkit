module Lib
  module Sidekiq

    # @return [void]
    def self.reset_web_counters()
      ::Sidekiq::Stats.new.reset("failed", "processed")
    end

    # Sleep until a given queue is empty.
    #
    # @param queue_name [String] ("default")
    # @param poll_duration [Integer] (10) How often (in seconds) to check if the queue is empty
    # @return [void]
    def self.wait_on_job_queue(queue_name: "default", poll_duration: 10)
      q = ::Sidekiq::Queue.new(queue_name)
      loop do
        break if q.size == 0
        sleep(poll_duration)
      end
      return nil
    end

  end
end
