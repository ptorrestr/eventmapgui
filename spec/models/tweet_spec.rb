require 'spec_helper'

describe Tweet do
  let(:event) { FactoryGirl.create(:event) }
  before do
    @tweet = event.tweets.build(twitter_id: 1, twitter_text: "Lorem ipsum", twitter_user_id: 1,
               twitter_screen_name: "myuser", 
               twitter_profile_image_url: "http://diggwithme.files.wordpress.com/2012/09/new-default-twitter-avatar.jpg")
  end

  subject{ @tweet }
  it { should respond_to(:twitter_id) }
  it { should respond_to(:twitter_text) }
  it { should respond_to(:twitter_user_id) }
  it { should respond_to(:twitter_screen_name) }
  it { should respond_to(:twitter_profile_image_url) }
  it { should respond_to(:event) }
  its(:event) { should eq event }

  it { should be_valid }

  describe "when twitter_id is not present" do
    before { @tweet.twitter_id = nil }
    it { should_not be_valid }
  end

  describe "when twitter_text is not present" do
    before { @tweet.twitter_text = nil }
    it { should_not be_valid }
  end

  describe "when twitter_user_id is not present" do
    before { @tweet.twitter_user_id = nil }
    it { should_not be_valid }
  end

  describe "when twitter_screen_name is not present" do
    before { @tweet.twitter_screen_name = nil }
    it { should_not be_valid }
  end

  describe "when twitter_profile_image_url is not present" do
    before { @tweet.twitter_profile_image_url = nil }
    it { should_not be_valid }
  end

  describe "when event_id is not present" do
    before { @tweet.event_id = nil }
    it { should_not be_valid }
  end
end
