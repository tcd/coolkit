# Subclasses should override/implement the following methods:
#
# - {.icon_css_class}
# - {#display_name}
#
# @abstract
class ApplicationRecord < ActiveRecord::Base

  include Lib::Helpers::Stripper

  self.abstract_class = true

  # Because we're using UUIDs instead of incrementing Ids
  self.implicit_order_column = "created_at"

  # https://github.com/rubiety/nilify_blanks
  nilify_blanks()

  # ==========================================================================
  # Attributes
  # ==========================================================================

  # @!group Attributes

  # @!attribute id [r]
  #   @return [String<UUID>]

  # @!attribute created_at [r]
  #   @return [Time]

  # @!attribute updated_at [r]
  #   @return [Time]

  # @!attribute metadata [rw]
  #   @return [Hash]

  # @!endgroup Attributes

  # ==========================================================================
  # Class Methods
  # ==========================================================================

  # @return [String]
  def self.display_name()
    return self.name.pluralize.gsub(/\B(?=[A-Z])/, " ")
  end

  # @return [Symbol]
  def self.custom_instance_name()
    return self.name.underscore.to_sym
  end

  # @return [String]
  def self.kind()
    return self.name
  end

  # Icon CSS classes
  #
  # @return [String]
  def self.icon_class()
    raise NotImplementedError
  end

  # ============================================================================
  # Instance Methods
  # ============================================================================

  # @return [String]
  def display_name()
    return " " unless self.persisted?
    return self&.name || " "
  end

  # @return [String]
  def kind()
    return self.class.kind()
  end

end
