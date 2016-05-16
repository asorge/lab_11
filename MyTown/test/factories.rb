FactoryGirl.define do
    factory :town do
      name "Pittsburgh"
      state "PA"
      description "A great place to live and work."
    end

    factory :attraction do
      name "Carnegie Mellon University"
      street "5000 Forbes Avenue"
      association :town
    end
  end