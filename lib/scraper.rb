

class Scraper

def self.moma_scraper
  exhibits=[]
  
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

def self.whitney_scraper
  exhibits=[]
  whitney= Nokogiri::HTML(open("http://whitney.org/Exhibitions"))
  whitney.css("div.image").each do |exhibit|
  exhibit_info={
    :exhibit_link => "http://whitney.org#{exhibit.css("a").attribute("href").value}"
  }
  exhibit_page= Nokogiri::HTML (open(exhibit_info[:exhibit_link]))
  exhibit_info[:title]= exhibit_page.css("div.title h1").text
  exhibit_info[:closing_date]= exhibit_page.css("div.title h2").first.text.strip
  exhibit_info[:about_exhibit]= exhibit_page.css("div.text-module-text p").text
  exhibits<<exhibit_info
  end
  exhibits
end


def self.guggenheim_scraper
exhibits=[]
guggenheim= Nokogiri::HTML(open("http://www.guggenheim.org/new-york/exhibitions/on-view/")) 
guggenheim.css("div.row-with-pic").each do |exhibit|
  exhibit_info={
    :title => exhibit.css("div.row-text h4 a").text.strip,
    :closing_date => exhibit.css("div.exh-dateline").text,
    :about_exhibit => exhibit.css("div.row-text p").text
  }
  exhibits<<exhibit_info
  end
exhibits
end

def self.met_scraper
  exhibits=[]
  exhibit_info={}
  met= Nokogiri::HTML(open("http://www.metmuseum.org/visit/met-fifth-avenue"))
  met.css("div.grid-listing__item").each do |exhibit|
    exhibit_info={
      :title=> exhibit.css("h2.card__title").text,
      :closing_date=> exhibit.css("p.card__meta strong").text,
      :exhibit_link => "http://www.metmuseum.org#{exhibit.css("a.card--exhibit").attribute("href").value}"
    }
    exhibit_page= Nokogiri::HTML(open(exhibit_info[:exhibit_link]))
    exhibit_info[:about_exhibit]= exhibit_page.css("div.rich-text p").text
    exhibits<<exhibit_info

  end
  exhibits
end

def self.nat_scraper
  exhibits=[]
  exhibit_info={}
  nat= Nokogiri::HTML(open("http://www.amnh.org/exhibitions/current-exhibitions"))
  nat.css("section.current-exhibitions article.mod").each do |exhibit|
    exhibit_info={
      :title=> exhibit.css("h1 a").text,
      :closing_date=> exhibit.css("p.date").text,
      :exhibit_link=> "http://www.amnh.org#{exhibit.css("h1 a").attribute("href").value}"
    }
    exhibit_page= Nokogiri::HTML(open(exhibit_info[:exhibit_link]))
    exhibit_info[:about_exhibit]= exhibit_page.css("div.attribute-body p").text
    exhibits<<exhibit_info
    end
    exhibits
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