require "test_helper"
require "coolkit/wip/duplicate_strings"

# https://stackoverflow.com/a/31354262/7687024
CAPS = ("AAA".."ZZZ").to_a.first(10_000)
def test_array(nelements, ndups)
  arr = CAPS[0, nelements - ndups]
  arr = arr.concat(arr[0, ndups]).shuffle
  return arr
end

class DuplicateStringsTest < TestCase

  def setup
    @cases = [
      {
        input: [
          "the",
          "quick",
          "brown",
          "fox",
          "jumps",
          "over",
          "the",
          "lazy",
          "dog",
        ],
        output: ["the"],
      },
      {
        input: [
          "LineItemStatusCode",
          "Quantity",
          "UnitOrBasisForMeasurementCode",
          "DateTimeQualifier",
          "Date",
          "RequestReferenceNumber",
          "ProductServiceIdQualifier",
          "ProductServiceId",
          "ProductServiceIdQualifier",
          "ProductServiceId",
          "ProductServiceIdQualifier",
          "ProductServiceId",
          "ProductServiceIdQualifier",
          "ProductServiceId",
          "ProductServiceIdQualifier",
          "ProductServiceId",
          "ProductServiceIdQualifier",
          "ProductServiceId",
          "ProductServiceIdQualifier",
          "ProductServiceId",
          "ProductServiceIdQualifier",
          "ProductServiceId",
          "ProductServiceIdQualifier",
          "ProductServiceId",
          "ProductServiceIdQualifier",
          "ProductServiceId",
          "AgencyQualifierCode",
          "SourceSubqualifier",
          "IndustryCode",
        ],
        output: [
          "ProductServiceId",
          "ProductServiceIdQualifier",
        ],
      },
    ]
  end

  def test_v1
    input = @cases[1][:input]
    output = @cases[1][:output]
    assert_equal(output, Coolkit::Duplicates.v1(input).sort)
  end

  def test_v2
    input = @cases[1][:input]
    output = @cases[1][:output]
    assert_equal(output, Coolkit::Duplicates.v2(input).sort)
  end

  def test_hash
    input = @cases[1][:input]
    output = @cases[1][:output]
    assert_equal(output, Coolkit::Duplicates.hash(input).sort)
  end

  def test_set
    # skip()
    input = @cases[1][:input]
    output = @cases[1][:output]
    assert_equal(output, Coolkit::Duplicates.set(input).sort)
  end

  def test_difference_between_unique
    skip()
    input = @cases[1][:input]
    output = @cases[1][:output]
    assert_equal(output, Coolkit::Duplicates.difference_between_unique(input).sort)
  end

end

# want = [
#   "LineItemStatusCode",
#   "Quantity",
#   "UnitOrBasisForMeasurementCode",
#   "DateTimeQualifier",
#   "Date",
#   "RequestReferenceNumber",
#   "ProductServiceIdQualifier1",
#   "ProductServiceId1",
#   "ProductServiceIdQualifier2",
#   "ProductServiceId2",
#   "ProductServiceIdQualifier3",
#   "ProductServiceId3",
#   "ProductServiceIdQualifier4",
#   "ProductServiceId4",
#   "ProductServiceIdQualifier5",
#   "ProductServiceId5",
#   "ProductServiceIdQualifier6",
#   "ProductServiceId6",
#   "ProductServiceIdQualifier7",
#   "ProductServiceId7",
#   "ProductServiceIdQualifier8",
#   "ProductServiceId8",
#   "ProductServiceIdQualifier9",
#   "ProductServiceId9",
#   "ProductServiceIdQualifier10",
#   "ProductServiceId10",
#   "AgencyQualifierCode",
#   "SourceSubqualifier",
#   "IndustryCode",
# ]
