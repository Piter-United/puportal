FactoryGirl.define do
  sequence(:token)       { |n| "token#{ n }" }
  sequence(:title)       { |n| "title#{ n }" }
  sequence(:email)       { |n| "email#{ n }@example.com" }
  sequence(:password)    { |n| "password#{ n }" }
  sequence(:description) { |n| "description#{ n }" }
  sequence(:hashtag)     { |n| "hashtag#{ n }" }
  sequence(:name)        { |n| "name#{ n }" }
  sequence(:tags)        { |n| ["foo#{ n }", "bar#{ n }", "baz#{ n }"] }
end