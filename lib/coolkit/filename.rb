require "pathname"

module Coolkit
  # See:
  #
  # - [Pathname](https://ruby-doc.org/stdlib-2.6.3/libdoc/pathname/rdoc/Pathname.html)
  # - [`\z` vs `\Z`](https://stackoverflow.com/questions/2707870/whats-the-difference-between-z-and-z-in-a-regular-expression-and-when-and-how)
  #
  # @return [String]
  def self.full_extension(file)
    raise ArgumentError, "argument must be a string or a filepath" unless file.is_a?(String) || file.is_a?(Pathname)
    # /^\.\w+$/
    # /\A\.\w+\z/
    return "" if file.match(/\.\z/)
    return "." + file.split(".")[1..].join(".")
  end
end
