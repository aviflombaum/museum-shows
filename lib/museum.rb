require_relative "./scraper.rb"


class Museum
  attr_accessor :name, :exhibits
  @@all=[]

  def initialize(name,exhibits_array)
    @name=name
    @exhibits=[]  
    exhibits_array.collect do |exhibit| 
      holder=[]
      e = Exhibit.new(self) 
      holder=e
      @exhibits<< holder
      exhibit.each do |key, value|
        e.send("#{key}=", value)
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