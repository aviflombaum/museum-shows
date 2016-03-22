
class CommandLine

    def welcome
      puts ""
      puts "Retrieving museum info for you..."
      puts ""
      moma=Museum.new("Museum of Modern Art (MOMA)", Scraper.moma_scraper)
      whitney=Museum.new("Whitney Museum of American Art", Scraper.whitney_scraper)
      guggenheim=Museum.new("Guggenheim- New York", Scraper.guggenheim_scraper)
      nat=Museum.new("American Museum of Natural History", Scraper.nat_scraper)
      @input=nil
      puts " ----------------------------------"
      puts "|                                  |"
      puts "|    Welcome to Museum Shows!!!    |"
      puts "|                                  |"
      puts " ----------------------------------"
      puts ""
      puts ""
      call
    end

    def call
      while @input != "exit"
        puts ""
        puts "Here is a list of museums that we have show information for."
        puts ""
        Museum.print_all
        puts ""
        puts "'list' -            View the list of museums I can retrieve exhibit information from."
        puts "'exit' -            Does the obvious."
        puts ""
        puts "Enter the number of the museum whose shows you would like to see"
        @input=gets.strip
        if @input.downcase == "list"
          call
        elsif @input.downcase == "exit"
          exit
        elsif @input.to_i.between?(1, Museum.all.count)
          select_exhibit_by_museum
        else
          "I don't understand what you entered, try again"
          call
        end
        if @input=="exit"
          break
        end
      end
    end


    def select_exhibit_by_museum 
        selected_museum = Museum.all[@input.to_i-1] 
        puts ""
        puts "#{selected_museum.name}:"
        selected_museum.exhibits.each_with_index do |exhibit, index|
          puts ""
          if index.between?(0,8)
             spacer= " "
          else
            spacer=""
          end
          puts "#{spacer}#{index+1}.   #{exhibit.title}   #{exhibit.closing_date}"
        end
        puts ""
        puts "Enter the number of the show you would like to get more info about."
        puts "Type 'back' to return to the main menu, or 'exit' to quit."
        @input3= gets.strip
        if @input3.downcase == "back"
          call
        elsif @input3.downcase == "exit"
          @input="exit"
          exit

        elsif @input3.to_i<1 || @input3.to_i> selected_museum.exhibits.count
          puts "I don't understand what you entered. Please try again."
          select_exhibit_by_museum
        else
          exhibit_info= selected_museum.exhibits[@input3.to_i-1]
          puts "#{exhibit_info.title}: at #{selected_museum.name}"
          puts ""
          puts "#{exhibit_info.about_exhibit}"
        end
        if @input=="exit"
          call
        else
          puts ""
          puts "Would you like to see the list of shows from #{selected_museum.name} again? (y/n)"
          @input5=gets.strip.downcase
        end
        if @input5== "y"
          select_exhibit_by_museum
        elsif @input5=="exit"
          @input="exit"
          exit
        else 
          call
        end
    end

    def exit
      puts "Thank you for using Museum Shows!"
      puts "Goodbye."
    end

end