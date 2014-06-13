require File.expand_path '../spec_helper.rb', __FILE__

describe "My Sinatra Application" do
  it "should allow accessing the home page" do
    get '/'
    expect(last_response).to be_ok
  end
  context "no games available" do
    before {
      Game.stub(:count) {0}
    }
    it "should render the homepage" do
      get '/'
      expect(last_response).to be_ok
    end
  end
end