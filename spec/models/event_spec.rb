require 'spec_helper'

describe Event do
  before { @event = Event.new(name: "New event", address: "My address, Ireland",
    longitude: 10.10, latitude: 20.20, alert: 0, gmaps: true) }

  subject{ @event }
  it { should respond_to(:name) }
  it { should respond_to(:address) }
  it { should respond_to(:longitude) }
  it { should respond_to(:latitude) }
  it { should respond_to(:alert) }
  it { should respond_to(:gmaps) }
  it { should respond_to(:tweets) }

  it { should be_valid }

  describe "when name is not present" do
    before { @event.name = " " }
    it { should_not be_valid }
  end

  describe "when address is not present" do
    before { @event.address = " " }
    it { should_not be_valid }
  end

  describe "when longitude is not present" do
    before { @event.longitude = " " }
    it { should_not be_valid }
  end

  describe "when latitude is not present" do
    before { @event.latitude = " " }
    it { should_not be_valid }
  end

  describe "when alert is not present" do
    before { @event.alert = " " }
    it { should_not be_valid }
  end

  describe "when gmaps is not present" do
    before { @event.gmaps = " " }
    it { should_not be_valid }
  end

  describe "when name is already taken" do
    before do
      event_with_same_name = @event.dup
      event_with_same_name.save
    end
    it { should_not be_valid }
  end

  describe "tweets associations" do
    before { @event.save }
    let!(:older_tweet) do
      FactoryGirl.create(:tweet, event: @event, created_at: 1.day.ago)
    end
    let!(:newer_tweet) do
      FactoryGirl.create(:tweet, event: @event, created_at: 1.hour.ago)
    end
    
    it "should have the right tweets in the right order" do
      expect(@event.tweets.to_a).to eq [newer_tweet, older_tweet]
    end

    it "should destroy associated tweets" do
      tweets = @event.tweets.to_a
      @event.destroy
      expect(tweets).not_to be_empty
      tweets.each do |tweet|
        expect(Tweet.where(id: tweet.id)).to be_empty
      end
    end
  end
end
