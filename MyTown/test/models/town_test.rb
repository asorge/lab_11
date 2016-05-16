require 'test_helper'

  class TownTest < ActiveSupport::TestCase
    should have_many(:attractions).dependent(:destroy)
    should accept_nested_attributes_for(:attractions).allow_destroy(true)

    context "Within context" do
      setup do
        create_towns
      end
      teardown do
        destroy_towns
      end

      should "show that alphabetical scope orders towns correctly" do
        assert_equal ["Pittsburgh", "St. Louis"], Town.alphabetical.map(&:name)
      end
    end
    
    should "have a method to identify geocoordinates" do
      assert_in_delta(40.4406248, @pgh.latitude, 0.0001)
      assert_in_delta(-79.995886, @pgh.longitude, 0.0001)
    end

    should "fail to identify geocoordinates for a Klingon city" do
      klingon_town = FactoryGirl.build(:town, name: "Quin'lat", state: "Qo'noS")
      deny klingon_town.valid?, "#{klingon_town.to_yaml}"
    end

  end