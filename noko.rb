require "nokogiri"
require "open-uri"
require 'pry'


class ScraperClass

  def self.get_data
    websites = ["https://www.giantbomb.com/league-of-legends/3030-24024/characters/",
                "https://www.giantbomb.com/league-of-legends/3030-24024/characters/?page=2",
                "https://www.giantbomb.com/league-of-legends/3030-24024/characters/?page=3",
                "https://www.giantbomb.com/league-of-legends/3030-24024/characters/?page=4",
                "https://www.giantbomb.com/league-of-legends/3030-24024/characters/?page=5"]

    websites.each do |pages|
      data = Nokogiri::HTML(open(pages))

      data.css("div#wiki-3030-24024-characters li").each do |champ|
        break if champ.css("h3.title").text == ""

        new_champ = Champion.new
        new_champ.name = champ.css("h3.title").text
        new_champ.description = champ.css("p").text.gsub("  ", "")
        new_champ.image_url = champ.css("div.img img").attribute("src").value
      end # inner loop
    end # outter loop
  end # method
end # class
