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
  end