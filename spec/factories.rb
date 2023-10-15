FactoryBot.define do
  factory :channel do
    name { 'General' }
  end

  factory :message do
    content { 'MyText' }
    sender_nickname { 'JohnDoe' }
    association :channel
  end
end
