# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :story do
    url "MyText"
    title "MyString"
    author "MyString"
    user nil
    description ""
    published_on "2014-09-10"
  end
end
