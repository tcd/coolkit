require "test_helper"
require "coolkit/core_ext/string/pascal_case"

module CoreExtTest
  module StringTest
    class PascalCaseTest < TestCase

      def test_pascal_case
        cases = {
          "Number of Accepted Transaction Sets" => "NumberOfAcceptedTransactionSets",
          "Free Form Message" => "FreeFormMessage",
          "Free-Form Message" => "FreeFormMessage",
          "Pick-up Date" => "PickUpDate",
          "Harbor Maintenance Fee (HMF) Exemption Code" => "HarborMaintenanceFeeExemptionCode",
          "Product/Service Substitution Code" => "ProductServiceSubstitutionCode",
          "Bill of Lading/Waybill Number" => "BillOfLadingWaybillNumber",
          "Pre-Cooled (Rule 710) Code" => "PreCooledCode",
          "Surface/Layer/Position Code" => "SurfaceLayerPositionCode",
          "U.P.C./EAN Consumer Package Code" => "UPCEanConsumerPackageCode",
          "D-U-N-S Number" => "DUNSNumber",
          "Service, Promotion, Allowance, or Charge Code" => "ServicePromotionAllowanceOrChargeCode",
          "Shipper's Export Declaration Requirements" => "ShippersExportDeclarationRequirements",
          "Resource Code (or Identifier)" => "ResourceCode",
          "Interchange ID Qualifier" => "InterchangeIdQualifier",
          "Length of Binary Data" => "LengthOfBinaryData",
        }
        cases.each do |key, val|
          want = val
          input = key
          have = key.pascal_case
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
