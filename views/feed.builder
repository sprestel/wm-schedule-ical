xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "WM Spielplan"
    xml.description "der deutschen Mannschaft"
    xml.link "http://mysite.com"

    for game in @games
      xml.item do
        xml.title game.title
        xml.description game.title
        xml.kickoff game.kickoff.localtime.to_s(:rfc822)
      end
    end
  end
end