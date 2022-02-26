require "test_helper"
require "coolkit/core/string/snake_case"

module CoreTest
  module StringTest
    class SnakeCaseTest < TestCase
      {
        "Number of Accepted Transaction Sets"           => "number_of_accepted_transaction_sets",
        "Free Form Message"                             => "free_form_message",
        "Free-Form Message"                             => "free_form_message",
        "Pick-up Date"                                  => "pick_up_date",
        "Harbor Maintenance Fee (HMF) Exemption Code"   => "harbor_maintenance_fee_exemption_code",
        "Product/Service Substitution Code"             => "product_service_substitution_code",
        "Bill of Lading/Waybill Number"                 => "bill_of_lading_waybill_number",
        "Pre-Cooled (Rule 710) Code"                    => "pre_cooled_code",
        "Surface/Layer/Position Code"                   => "surface_layer_position_code",
        "U.P.C./EAN Consumer Package Code"              => "upc_ean_consumer_package_code",
        "D-U-N-S Number"                                => "d_u_n_s_number", # TODO: Don't like this result.
        "Service, Promotion, Allowance, or Charge Code" => "service_promotion_allowance_or_charge_code",
        "Shipper's Export Declaration Requirements"     => "shippers_export_declaration_requirements",
        "Resource Code (or Identifier)"                 => "resource_code",
        "Interchange ID Qualifier"                      => "interchange_id_qualifier",
        "Length of Binary Data"                         => "length_of_binary_data",
      }.each do |input, want|
        define_method("test_normalize_#{input}") do
          assert_equal(want, Coolkit.snake_case(input))
        end
      end
    end
  end
end
