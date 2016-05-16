require 'test_helper'

  class TownTest < ActiveSupport::TestCase
    should have_many(:attractions).dependent(:destroy)

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