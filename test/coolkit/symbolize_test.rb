require "test_helper"

class SymbolizeTest < TestCase

  def test_object_of_objects
    input = {
      "drinks" => {
        "gibson" => { "garnish" => "onion" },
        "martini" => { "garnish" => "olive" },
      },
    }
    want = {
      drinks: {
        gibson: { garnish: "onion" },
        martini: { garnish: "olive" },
      },
    }
    assert_equal(want, Coolkit.symbolize_keys(input))
  end

  def test_array_of_objects
    input = [
      { "name" => "Name", "description" => nil, "type" => "String" },
      { "name" => "Age", "description" => "Number of years the person has been alive.", "type" => "Integer" },
    ]
    want = [
      { name: "Name", description: nil, type: "String" },
      { name: "Age", description: "Number of years the person has been alive.", type: "Integer" },
    ]
    assert_equal(want, Coolkit.symbolize_keys(input))
  end

  def test_object_with_array_of_objects
    input = {
      "data" => [
        { "name" => "Name", "description" => nil, "type" => "String" },
        { "name" => "Age", "description" => "Number of years the person has been alive.", "type" => "Integer" },
      ],
    }
    want = {
      data: [
        { name: "Name", description: nil, type: "String" },
        { name: "Age", description: "Number of years the person has been alive.", type: "Integer" },
      ],
    }
    assert_equal(want, Coolkit.symbolize_keys(input))
  end

  def test_object_of_objects_and_arrays
    input = {
      "name" => "Person",
      "attrs": [
        { "name" => "Name", "description" => nil, "type" => "String" },
        { "name" => "Age", "description" => "Number of years the person has been alive.", "type" => "Integer" },
      ],
    }

    want = {
      name: "Person",
      attrs: [
        { name: "Name", description: nil, type: "String" },
        { name: "Age", description: "Number of years the person has been alive.", type: "Integer" },
      ],
    }
    assert_equal(want, Coolkit.symbolize_keys(input))
  end

  def test_x
    input = {
      "name" => "Human",
      "description" => "This class models a person.",
      "modules" => ["MilkyWay", "Earth"],
      "parent" => "Mammal",
      "attrs" => [
        { "name" => "Name", "type" => "String" },
        { "name" => "Age", "description" => "Number of years the human has been alive.", "type" => "Integer", "read_only" => true },
      ],
    }
    want = {
      name: "Human",
      description: "This class models a person.",
      modules: ["MilkyWay", "Earth"],
      parent: "Mammal",
      attrs: [
        { name: "Name", type: "String" },
        { name: "Age", description: "Number of years the human has been alive.", type: "Integer", read_only: true },
      ],
    }
    assert_equal(want, Coolkit.symbolize_keys(input))
  end

  def test_improper_arguments
    skip()
  end

  def test_hash_with_existing_symbols
    skip()
  end

end
