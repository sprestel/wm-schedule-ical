require File.expand_path '../../../models/game.rb', __FILE__

describe Game do
  
  describe "#end_date" do
    let(:timestamp) {Time.now}
    subject {Game.new(kickoff: timestamp)}
    it "returns end_date + 105 Minutes" do
      expect(subject.end_date).to eql timestamp + 105.minutes
    end
  end
  
  describe "#to_ics" do
    
  end
  
end