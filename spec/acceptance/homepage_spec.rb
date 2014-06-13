require File.dirname(__FILE__) + '/../acceptance_helper'

require 'pry'

describe 'sites' do
  context 'the / URL' do
    before :each do
      visit '/'
    end

    it "has a html link and the html page shows a table" do
      page.should have_text "HTML"
    end
    
    it "has a rss link" do
      page.should have_text "RSS"      
    end
    
    it "has a ical link" do
      page.should have_text "ICAL"      
    end
  end
  context "the /calendar.html URL" do
    let!(:example_game) {Game.create!(title: "my game", kickoff: Time.now, location: "Berlin City")}

    before { visit "/calendar.html" }

    after{example_game.destroy}

    it "has a table" do
      page.should have_selector "table"
    end

    it "has some contents" do
      page.should have_selector "table tr"
      page.should have_text "my game"
      page.should have_text "Berlin City"
    end

  end
end