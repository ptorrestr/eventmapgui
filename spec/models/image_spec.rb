require 'spec_helper'

describe Image do
  let(:event) { FactoryGirl.create(:event) }
  before do
    @image = event.videos.build(url: "http://www.flickr.com/photos/54413120@N04/10416220975/")
  end

  subject{ @image }
  it { should respond_to(:url) }
  it { should respond_to(:event) }
  its(:event) { should eq event }

  it { should be_valid }

  describe "when url is not present" do
    before { @image.url = nil }
    it { should_not be_valid }
  end

  describe "when event_id is not present" do
    before { @image.event_id = nil }
    it { should_not be_valid }
  end
end
