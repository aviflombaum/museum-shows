require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

def self.moma_scraper
  exhibits=[]
  exhibit_info={}
  moma= Nokogiri::HTML(open("http://moma.org/calendar/exhibitions"))
  moma.css("li.calendar-tile").each do |exhibit|
  exhibit_info={
    :title => exhibit.css("h3.calendar-tile__title").text.strip,
    :closing_date => exhibit.css("p").text.strip,
    :exhibit_link => "http://moma.org#{exhibit.css("a.calendar-tile__link").attribute("href").value}"
  }
    page=Nokogiri::HTML(open(exhibit_info[:exhibit_link]))
    exhibit_info[:about_exhibit]= page.css("div.mde-column__section p").text
    
    exhibits<<exhibit_info
  end
  exhibits
end

def self.met_scraper
  exhibits=[]
  exhibit_info={}
  met= Nokogiri::HTML(open("http://www.metmuseum.org/exhibitions/current-exhibitions"))
  met.css("div.grid-listing__item").each do |exhibit|
    exhibit_info={
      :title=> exhibit.css("h2.card__title ng-binding").text,
      :closing_date=> exhibit.css("p.card__meta strong").text,
      :exhibit_link => exhibit.css("a").attribute("href").text
    }
    binding.pry
  end
end


end





############  MOMA SCRAPE  ##############
# :title => moma.css("h3.calendar-tile__title").text.strip
# :closing_date => moma.css("p").text.strip
# :exhibit_link => moma.css("a.calendar-tile__link").attribute("href").value ## Add "http://moma.org" to link
# 
########### MOMA EXHIBIT PAGE FROM LINK #######
# page= Nokogiri::HTML(open(exhibit_info[:exhibit_link]))
# :about_exhibit => page.css("div.mde-column__section p").text
#
#
#
#
#
#
#