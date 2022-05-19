FactoryBot.define do
  factory :comment do
    body { 'article comment' }
    article
    user
  end
end
