require "test_helper"
require "coolkit/core_ext/string/normalize"

module CoreExtTest
  module StringTest
    class NormalizeTest < TestCase

      def test_1
        want = "Number of Accepted Transaction Sets"
        have = "Number of Accepted Transaction Sets".normalize!
        assert_equal(want, have)
      end

      def test_2
        want = "Free Form Message"
        have = "Free Form Message".normalize!
        assert_equal(want, have)
      end

      def test_3
        want = "Free Form Message"
        have = "Free-Form Message".normalize!
        assert_equal(want, have)
      end

      def test_4
        want = "Pick up Date"
        have = "Pick-up Date".normalize!
        assert_equal(want, have)
      end

      def test_5
        want = "Harbor Maintenance Fee Exemption Code"
        have = "Harbor Maintenance Fee (HMF) Exemption Code".normalize!
        assert_equal(want, have)
      end

      def test_6
        want = "Product Service Substitution Code"
        have = "Product/Service Substitution Code".normalize!
        assert_equal(want, have)
      end

      def test_7
        want = "Bill of Lading Waybill Number"
        have = "Bill of Lading/Waybill Number".normalize!
        assert_equal(want, have)
      end

      def test_8
        want = "Pre Cooled Code"
        have = "Pre-Cooled (Rule 710) Code".normalize!
        assert_equal(want, have)
      end

      def test_9
        want = "Surface Layer Position Code"
        have = "Surface/Layer/Position Code".normalize!
        assert_equal(want, have)
      end

      def test_10
        want = "U P C EAN Consumer Package Code"
        have = "U.P.C./EAN Consumer Package Code".normalize!
        assert_equal(want, have)
      end

      def test_11
        want = "D U N S Number"
        have = "D-U-N-S Number".normalize!
        assert_equal(want, have)
      end

      def test_12
        want = "Service Promotion Allowance or Charge Code"
        have = "Service, Promotion, Allowance, or Charge Code".normalize!
        assert_equal(want, have)
      end

      def test_13
        want = "Shippers Export Declaration Requirements"
        have = "Shipper's Export Declaration Requirements".normalize!
        assert_equal(want, have)
      end

      def test_14
        want = "Resource Code"
        have = "Resource Code (or Identifier)".normalize!
        assert_equal(want, have)
      end

      def test_15
        want = "Interchange ID Qualifier"
        have = "Interchange ID Qualifier".normalize!
        assert_equal(want, have)
      end

      def test_16
        want = "Length of Binary Data"
        have = "Length of Binary Data".normalize!
        assert_equal(want, have)
      end

    end
  end
end
