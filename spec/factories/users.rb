FactoryBot.define do
  factory :user do
    email { 'thomasisgreat@gmail.com' }
    password { 'betterpassword' }
    password_confirmation { 'betterpassword' }
  end
end
