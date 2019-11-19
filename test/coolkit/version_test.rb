require "test_helper"
require "rubygems"

class VersionTest < TestCase

  def test_that_it_has_a_version_number
    refute_nil(::Coolkit::VERSION)
  end

  def test_that_versions_match
    spec_path = File.join(Coolkit.root_dir, "coolkit.gemspec")
    spec = Gem::Specification.load(spec_path)
    assert_equal(Coolkit::VERSION, spec.version.to_s)
  end

end
