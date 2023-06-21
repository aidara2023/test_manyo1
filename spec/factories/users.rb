FactoryBot.define do
  factory :user do
    name { "user1" }
    sequence(:email) { |n| "user#{n}@user.com" } 
    password {"password"}
    password_digest { "password" }
    admin { false }
  end
  factory :admin_user do
    name { "admin_user1" }
    sequence(:email) { |n| "admin#{n}@user.com" } 
    password {"password"}
    password_digest { "password" }
    admin { true }
  end
end
