module Lib
  class Auth

    # @return [String]
    ALGORITHM = "HS256".freeze()

    # @return [String]
    SECRET = Lib::Util.get_credential(:secret_key_base)

    # @param payload [Hash]
    # @param exp [Time] Expiration time
    # @return [String]
    def self.encode(payload, exp = 1.week.from_now)
      payload[:exp] = exp.to_i()
      return JWT.encode(
        payload,
        SECRET,
        ALGORITHM,
        {},
      )
    end

    # Verify a JSON Web Token and return its decoded content.
    #
    # @param token [String]
    # @return [Hash]
    def self.decode(token)
      return JWT.decode(
        token,
        SECRET,
        true,
        { algorithm: ALGORITHM },
      )[0]
    end

  end
end
