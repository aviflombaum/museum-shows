class Museum
  attr_accessor :name, :exhibits
  @@all = []

  def self.find(id)
    @@all[id.to_i-1]
  end

  def initialize(name, exhibits_array)
    @name = name

    @exhibits = exhibits_array.collect do |exhibit_attributes|
      Exhibit.new(self, exhibit_attributes)
    end

    @@all << self
  end

  def find_exhibit(id)
    self.exhibits[id.to_i-1]
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
