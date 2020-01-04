require "test_helper"
require "coolkit/core/string/normalize"

module CoreTest
  module StringTest
    class NormalizeTest < TestCase
      [
        {
          want: "Number of Accepted Transaction Sets",
          have: "Number of Accepted Transaction Sets",
        },
        {
          want: "Free Form Message",
          have: "Free Form Message",
        },
        {
          want: "Free Form Message",
          have: "Free-Form Message",
        },
        {
          want: "Pick up Date",
          have: "Pick-up Date",
        },
        {
          want: "Harbor Maintenance Fee Exemption Code",
          have: "Harbor Maintenance Fee (HMF) Exemption Code",
        },
        {
          want: "Product Service Substitution Code",
          have: "Product/Service Substitution Code",
        },
        {
          want: "Bill of Lading Waybill Number",
          have: "Bill of Lading/Waybill Number",
        },
        {
          want: "Pre Cooled Code",
          have: "Pre-Cooled (Rule 710) Code",
        },
        {
          want: "Surface Layer Position Code",
          have: "Surface/Layer/Position Code",
        },
        {
          want: "U P C EAN Consumer Package Code",
          have: "U.P.C./EAN Consumer Package Code",
        },
        {
          want: "D U N S Number",
          have: "D-U-N-S Number",
        },
        {
          want: "Service Promotion Allowance or Charge Code",
          have: "Service, Promotion, Allowance, or Charge Code",
        },
        {
          want: "Shippers Export Declaration Requirements",
          have: "Shipper's Export Declaration Requirements",
        },
        {
          want: "Resource Code",
          have: "Resource Code (or Identifier)",
        },
        {
          want: "Interchange ID Qualifier",
          have: "Interchange ID Qualifier",
        },
        {
          want: "Length of Binary Data",
          have: "Length of Binary Data",
        },
      ].each do |c|
        define_method("test_normalize_#{c[:have]}") do
          assert_equal(c[:want], Coolkit.normalize(c[:have]))
        end
      end
    end
  end
end
