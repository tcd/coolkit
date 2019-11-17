require "test_helper"

class TimeTest < TestCase

  def test_to_est
    format_string = "%Y-%m-%d %H:%M:%S"

    epoch_utc = "1970-01-01 00:00:00"
    epoch_est = "1969-12-31 19:00:00" # or  18:00:00 depending on Daylight Savings

    epoch = Time.at(0).utc()

    assert_equal(epoch.strftime(format_string), epoch_utc)
    assert_equal(Coolkit.to_est(epoch).strftime(format_string), epoch_est)
  end

  def test_to_est_in_a_very_roundabout_way
    Time.stub :now, Time.at(0).utc() do
      assert_equal(Time.now().strftime("%Y-%m-%d %H:%M:%S"), "1970-01-01 00:00:00")
      assert_equal(Coolkit.to_est(Time.now()).strftime("%Y-%m-%d %H:%M:%S"), "1969-12-31 19:00:00")
    end
  end

end
