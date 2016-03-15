require_relative "./scraper.rb"
require_relative "./shows.rb"

class Museum
attr_accessor :name, :exhibits
@@all=[]

def initialize(name,scraper)
  @name=name
  @exhibits=[]
  scraper.each do |show| 
 @exhibits<<show
    show.each do |key, value| 
      new_show= Show.new(self)
    new_show.send(("#{key}="), value)
  end
end
@@all<<self
end


def self.all
  @@all
end

def self.print_all
  all.each_with_index do |museum, index|
    puts "#{index+1}.     #{museum.name}"
  end
end


end