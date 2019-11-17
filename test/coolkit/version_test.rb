require "test_helper"

class VersionTest < TestCase

  def test_that_it_has_a_version_number
    refute_nil(::Coolkit::VERSION)
  end

end
