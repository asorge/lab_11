  require 'test_helper'

  class AttractionTest < ActiveSupport::TestCase
    should belong_to(:town)

    context "Within context" do
      setup do
        create_towns
        create_attractions
      end
      teardown do
        destroy_towns
        destroy_attractions
      end

      should "show that alphabetical scope orders attractions correctly" do
        assert_equal ["Carnegie Mellon University", "PNC Park"], Attraction.alphabetical.map(&:name)
      end
    end
  end