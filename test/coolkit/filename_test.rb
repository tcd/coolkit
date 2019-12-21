require "test_helper"

class FileNameTest < TestCase

  def test_file_extension
    # Given the key as input, we want the value as output.
    #
    # - https://github.com/bkeepers/dotenv#what-other-env-files-can-i-use
    # - https://webpack.js.org/guides/production/#setup
    cases = {
      ".test."           => "",
      ".gitignore"       => ".gitignore",
      ".rubocop.yml"     => ".rubocop.yml",
      ".dev.rubocop.yml" => ".dev.rubocop.yml",
      "webpack.dev.js"   => ".dev.js",
    }
    cases.each do |key, val|
      assert_equal(val, Coolkit.full_extension(key))
    end

  end

end
