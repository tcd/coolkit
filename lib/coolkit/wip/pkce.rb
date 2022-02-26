require "digest"
require "securerandom"

module Coolkit
  # Proof Key for Code Exchange (PKCE)
  #
  # |             |        |        |
  # | ----------- | ------ | ------ |
  # | `verifier`  | raw    | Step 3 |
  # | `challenge` | hashed | Step 1 |
  #
  # See:
  #
  # - [How do I use Proof Key for Code Exchange (PKCE)](https://help.aweber.com/hc/en-us/articles/360036524474-How-do-I-use-Proof-Key-for-Code-Exchange-PKCE-)
  # - [samuelralak/pkce-challenge-ruby](https://github.com/samuelralak/pkce-challenge-ruby)
  class Pkce

    # @return [Hash{Symbol => Integer}]
    CHAR_LENGTH = {
      default: 48,
      max: 128,
      min: 43,
    }.freeze()

    # @!attribute code_verifier [r] Raw value; used in step 3
    #   @return [String]
    attr_accessor :code_verifier

    # @!attribute code_challenge [r] Hashed value; used in step 1
    #   @return [String]
    attr_accessor :code_challenge

    # @param options [Hash{Symbol => Integer}]
    # @return [void]
    def initialize(options = {})
      @options = options
      self.code_verifier  = generate_verifier()
      self.code_challenge = generate_challenge()
    end

    private

    # @return [String]
    def generate_verifier()
      length = (@options[:char_length] || CHAR_LENGTH[:default]).to_i()

      raise StandardError "PKCE length out of range" unless length.between?(CHAR_LENGTH[:min], CHAR_LENGTH[:max])

      return urlsafe_base64(SecureRandom.base64((length * 3) / 4))
    end

    # @return [String]
    def generate_challenge()
      return urlsafe_base64(Digest::SHA256.base64digest(self.code_verifier))
    end

    # @param base64_str [String]
    # @return [String]
    def urlsafe_base64(base64_str)
      raise ArgumentError "'base64_str' can not be blank" if base64_str.blank?
      return base64_str.tr("+/", "-_").tr("=", "")
    end

  end
end
