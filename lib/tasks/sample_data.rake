namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    require 'populator'
    require 'faker'

    [Event, Tweet].each(&:delete_all)

    Event.populate 20 do |event|
      event.name = Faker::Name.name
      event.address = Faker::Address.city + Faker::Address.country
      event.longitude = Faker::Address.longitude
      event.latitude = Faker::Address.latitude
      event.alert = Faker::Number.digit
      event.gmaps = true
    end

    events = Event.all
    events.each do |event|
      Tweet.populate 100 do |tweet|
        tweet.twitter_id = Faker::Number.number(10)
        tweet.twitter_text = Faker::Lorem.sentence(random_words_to_add = 5)
        tweet.twitter_user_id = Faker::Number.number(10)
        tweet.twitter_screen_name = Faker::Name.first_name
        tweet.twitter_profile_image_url = "http://diggwithme.files.wordpress.com/2012/09/new-default-twitter-avatar.jpg"
        tweet.event_id = event.id
      end

      Video.populate 100 do |video|
        video.url = "//www.youtube.com/embed/c0L0WIK2Ync"
	video.event_id = event.id
      end

      Image.populate 100 do |image|
        image.url = "http://www.flickr.com/photos/54413120@N04/10416220975/"
        image.event_id = event.id
      end

    end
  end
end
