FactoryGirl.define do
  factory :datafile do
    sequence(:filename) { |n| "File#{('A'..'Z').to_a[n]}" }
  end

  factory :record do
    campaign_name 'my campaign'
    impressions '5 stars'
    clicks 300
    cost 100_00
    timestamp Time.now
    datafile
  end
end
