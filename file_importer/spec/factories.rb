FactoryGirl.define do 
  factory :datafile do
    filename 'test1'
  end

  factory :record do
    campaign_name 'my campaign'
    impressions "5 stars"
    clicks 300
    cost 100_00
    timestamp Time.now
    datafile { FactoryGirl.build(:datafile) }
  end
end
