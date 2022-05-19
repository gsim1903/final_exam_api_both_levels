FactoryBot.define do
  factory :comment do
    body { 'article comment' }
    article
  end
end
