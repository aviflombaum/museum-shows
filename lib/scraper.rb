

class Scraper

    def self.moma_scraper
      moma= Nokogiri::HTML(open("http://moma.org/calendar/exhibitions"))
      moma.css("li.calendar-tile").collect do |exhibit|
        exhibit_info={
          :title => exhibit.css("h3.calendar-tile__title").text.strip,
          :closing_date => exhibit.css("p").text.strip,
          :exhibit_link => "http://moma.org#{exhibit.css("a.calendar-tile__link").attribute("href").value}"
        }
        page=Nokogiri::HTML(open(exhibit_info[:exhibit_link]))
        exhibit_info[:about_exhibit]= page.css("div.mde-column__section p").text
        
        exhibit_info  
      end
    end

    def self.whitney_scraper
      whitney= Nokogiri::HTML(open("http://whitney.org/Exhibitions"))
      whitney.css("div.image").collect do |exhibit|
          exhibit_info={
            :exhibit_link => "http://whitney.org#{exhibit.css("a").attribute("href").value}"
             }
          exhibit_page= Nokogiri::HTML (open(exhibit_info[:exhibit_link]))
          exhibit_info[:title]= exhibit_page.css("div.title h1").text
          exhibit_info[:closing_date]= exhibit_page.css("div.title h2").first.text.strip
          exhibit_info[:about_exhibit]= exhibit_page.css("div.text-module-text p").text
        exhibit_info
      end
    end


    def self.guggenheim_scraper
      guggenheim= Nokogiri::HTML(open("http://www.guggenheim.org/new-york/exhibitions/on-view/")) 
      guggenheim.css("div.row-with-pic").collect do |exhibit|
        exhibit_info={
          :title => exhibit.css("div.row-text h4 a").text.strip,
          :closing_date => exhibit.css("div.exh-dateline").text,
          :about_exhibit => exhibit.css("div.row-text p").text
        }
        exhibit_info
      end
    end

    def self.met_scraper
      exhibit_info={}
      met= Nokogiri::HTML(open("http://www.metmuseum.org/visit/met-fifth-avenue"))
      met.css("div.grid-listing__item").collect do |exhibit|
        exhibit_info={
          :title=> exhibit.css("h2.card__title").text,
          :closing_date=> exhibit.css("p.card__meta strong").text,
          :exhibit_link => "http://www.metmuseum.org#{exhibit.css("a.card--exhibit").attribute("href").value}"
        }
        exhibit_page= Nokogiri::HTML(open(exhibit_info[:exhibit_link]))
        exhibit_info[:about_exhibit]= exhibit_page.css("div.rich-text p").text
        exhibit_info
      end
    end

    def self.nat_scraper
      exhibit_info={}
      nat= Nokogiri::HTML(open("http://www.amnh.org/exhibitions/current-exhibitions"))
      nat.css("section.current-exhibitions article.mod").collect do |exhibit|
        exhibit_info={
          :title=> exhibit.css("h1 a").text,
          :closing_date=> exhibit.css("p.date").text,
          :exhibit_link=> "http://www.amnh.org#{exhibit.css("h1 a").attribute("href").value}"
        }
        exhibit_page= Nokogiri::HTML(open(exhibit_info[:exhibit_link]))
        exhibit_info[:about_exhibit]= exhibit_page.css("div.attribute-body p").text
        exhibit_info
      end
    end

end
