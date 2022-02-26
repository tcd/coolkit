module Serializers
  # @abstract
  class BaseSerializer < Blueprinter::Base

    identifier(:id)

    fields(:kind)

    fields(:created_at, :updated_at)

    field(:computed_linkable_id) { |e| [e.kind, e.id.to_s].join("") }

    # ========================================================================

    view(:simple) { }

    view(:list) { }

    view(:detail) { }

    # ========================================================================

    view(:with_tags) do
      fields(:tag_list)
    end

    view(:with_hyperlinks) do
      association(:hyperlinks, blueprint: Serializers::V2::HyperlinkSerializer, view: :with_website)
    end

  end
end
