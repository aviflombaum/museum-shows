class Exhibit
  attr_accessor :title, :closing_date, :exhibit_link, :about_exhibit, :museum
  @@all = []

  def initialize(museum, attributes)
    attributes.each do |attribute_name, attribute_value|
      self.send("#{attribute_name}=", attribute_value)
    end

    @museum = museum

    @@all << self
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
