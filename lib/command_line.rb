class CommandLine

def call
  puts " ----------------------------------"
  puts "|                                  |"
  puts "|    Welcome to Museum Shows!!!    |"
  puts "|                                  |"
  puts " ----------------------------------"
  puts ""
  puts ""
  while input != "exit"
  puts "The following are commands that you may use:"
  puts ""
  puts "'list' -            View the list of museums I can retrieve exhibit information from."
  puts "'shows' -           See the current shows from all of the museums"
  puts "'museum (number)' - View the current shows from a specific museum from the list."
  puts "'show (number)' -   See more informatoin about a particular show."
  puts "'exit' -            Does the obvious."
  puts ""
  puts "What would you like to do?"
  input=gets.strip.downcase
  if input == "list"
    Museums.print_all
  elsif input == "shows"
    Shows.print_all
  elsif input.includes?("museum")
    holder=[]
    holder=input.split(" ")
    Museums.all[holder[1.to_i-1]].exhibits.each do |exhibit|
      puts "#{Museums.all[holder[1.to_i=1]]}:"
      puts "#{exhibit.title}"
      puts "#{exhibit.closing_date}"
    end
    elsif input.includes?("show")
      holder =[]
      holder = input.split(" ")
      puts "#{Shows.all[holder[1.to_i-1]].museum}"
      puts "#{Shows.all[holder[1.to_i-1]].name}:"
      puts "#{Shows.all[holder[1.to_i-1]].about_exhibit}"
    elsif input == exit
      puts "Thank you for using Museum Shows!"
    else
      puts "I don't understand what you entered. Please try again."
    end


 end
end


end