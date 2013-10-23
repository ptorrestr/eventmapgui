FactoryGirl.define do
  factory :event do
    name	"Default event"
    address	"My address in nowhere"
    longitude	10.10
    latitude	20.20
    alert	1
    gmaps	true
  end

  factory :tweet do
    twitter_id 1
    twitter_text "Lorem ipsum"
    twitter_user_id 1
    twitter_screen_name "name"
    twitter_profile_image_url "http://diggwithme.files.wordpress.com/2012/09/new-default-twitter-avatar.jpg"
  end
end
