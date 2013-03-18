FactoryGirl.define do
  factory :user do
    username 'Duck Norris'
    password 'randomPassword123'
    filename 'duck_norris.pdf'

    trait :valid_channel do
      channel 'mychannel'
    end

    trait :invalid_channel do
      channel 'notmychannel'
    end
  end
end