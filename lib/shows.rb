require_relative "./museums.rb"
require_relative "./scraper.rb"

class Show
attr_accessor :title, :closing_date, :exhibit_link, :about_exhibit, :museum

@@all=[]

def initialize(museum)
  @museum=museum
  @@all<<self
end

def self.all
  @@all
end

def self.print_all
   all.each_with_index do |show, index|
    puts "#{index+1}.     #{show.title name}"
end
end

end