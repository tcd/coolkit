require "test_helper"
require "coolkit/core/string/pascal_case"

module CoreTest
  module StringTest
    class PascalCaseTest < TestCase
      {
        "Number of Accepted Transaction Sets"           => "NumberOfAcceptedTransactionSets",
        "Free Form Message"                             => "FreeFormMessage",
        "Free-Form Message"                             => "FreeFormMessage",
        "Pick-up Date"                                  => "PickUpDate",
        "Harbor Maintenance Fee (HMF) Exemption Code"   => "HarborMaintenanceFeeExemptionCode",
        "Product/Service Substitution Code"             => "ProductServiceSubstitutionCode",
        "Bill of Lading/Waybill Number"                 => "BillOfLadingWaybillNumber",
        "Pre-Cooled (Rule 710) Code"                    => "PreCooledCode",
        "Surface/Layer/Position Code"                   => "SurfaceLayerPositionCode",
        "U.P.C./EAN Consumer Package Code"              => "UPCEanConsumerPackageCode",
        "D-U-N-S Number"                                => "DUNSNumber",
        "Service, Promotion, Allowance, or Charge Code" => "ServicePromotionAllowanceOrChargeCode",
        "Shipper's Export Declaration Requirements"     => "ShippersExportDeclarationRequirements",
        "Resource Code (or Identifier)"                 => "ResourceCode",
        "Interchange ID Qualifier"                      => "InterchangeIdQualifier",
        "Length of Binary Data"                         => "LengthOfBinaryData",
      }.each do |input, want|
        define_method("test_normalize_#{input}") do
          assert_equal(want, Coolkit.pascal_case(input))
        end
      end
    end
  end
end
