require "time"

module Coolkit
  # Convert a `UTC` {Time} object to `EST`.
  #
  # @param time [Time]
  # @raise [ArgumentError] Unless passed a `UTC` formatted Time object.
  # @return [Time]
  def self.to_est(time)
    raise ArgumentError "argument is not in UTC format" unless time.utc?()
    return time + Time.zone_offset("EST")
  end
end
