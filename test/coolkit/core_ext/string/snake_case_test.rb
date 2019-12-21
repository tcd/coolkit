require "test_helper"
require "coolkit/core_ext/string/snake_case"

module CoreExtTest
  module StringTest
    class SnakeCaseTest < TestCase

      def test_snake_case
        cases = {
          "Number of Accepted Transaction Sets" => "number_of_accepted_transaction_sets",
          "Free Form Message" => "free_form_message",
          "Free-Form Message" => "free_form_message",
          "Pick-up Date" => "pick_up_date",
          "Harbor Maintenance Fee (HMF) Exemption Code" => "harbor_maintenance_fee_exemption_code",
          "Product/Service Substitution Code" => "product_service_substitution_code",
          "Bill of Lading/Waybill Number" => "bill_of_lading_waybill_number",
          "Pre-Cooled (Rule 710) Code" => "pre_cooled_code",
          "Surface/Layer/Position Code" => "surface_layer_position_code",
          "U.P.C./EAN Consumer Package Code" => "upc_ean_consumer_package_code",
          "D-U-N-S Number" => "d_u_n_s_number", # TODO: Don't like this result.
          "Service, Promotion, Allowance, or Charge Code" => "service_promotion_allowance_or_charge_code",
          "Shipper's Export Declaration Requirements" => "shippers_export_declaration_requirements",
          "Resource Code (or Identifier)" => "resource_code",
          "Interchange ID Qualifier" => "interchange_id_qualifier",
          "Length of Binary Data" => "length_of_binary_data",
        }
        cases.each do |key, val|
          want = val
          input = key
          have = input.snake_case
          message = <<~END
            input:  #{input}
            wanted: #{want}
            have:   #{have}
          END
          assert_equal(want, have, message)
        end
      end

    end
  end
end
