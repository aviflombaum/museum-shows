class Exhibit
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

    def self.exhibits_by_museum(selected_museum)
      exhibit_list=[]
      self.all.each do |exhibit| 
        if exhibit.museum.name == selected_museum.name
          exhibit_list<<exhibit
        end
      end
      
    end

end