class CLI

    def start
        puts "Welcome! We are TV shows. What is your name?"
        API.get_data
        input = user_input
        greet(input)
    end
    
    def user_input
        gets.strip
    end 

    def greet(name)
        puts "Hey there #{name}! Let's get started! Will you like to see some TV shows? Enter Y to see more shows, or enter exit to exit."
        menu 
    end 

    def menu
        selection = user_input
        if selection.downcase == "y"
            print_shows
        elsif selection.downcase == "exit"
            goodbye
        else 
            invalid 
        end
    end 

    def back_to_prompt
        puts "Will you like to see another show? Enter Y to see the list again, or enter exit to exit."
        menu
    end 


    def goodbye
        puts "Thanks for participating! Come again!"
        ending 
    end 

    def invalid
        puts "invalid response. Try again."
        back_to_prompt
    end
    
    def print_shows
        Show.all.each.with_index(1) do |show, index|
            if (index>50)
                break;
            end 
            puts "#{index}. #{show.name}"
        end 
        select_show 
    end 
    
    def select_show
        puts "Please enter the name of the TV show you wish to learn more about."
        selection = user_input
        if selection == "Exit"        
            goodbye
        elsif Show.find_by_selection(selection) 
            show = Show.find_by_selection(selection)
            show_details(show)
        else 
            invalid
        end
    end 
    
    def show_details(show)
        puts ""
        puts ""
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "Name: #{show.name}"
        puts "Summary: #{show.summary.gsub(%r{<\w*>|<\/\w*>|<\w*\s\/>}, '')}"
        puts "Genre(s): "
        show.genres.each do |genre|
            puts "#{genre}"
        end 
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts ""
        puts ""
        back_to_prompt
    end

    def ending
        puts <<-'EOF'



        
                                   ___         ___         ___         ___                                        ___                       
              ___                 /\__\       /\  \       /\  \       /\  \                                      /\__\                      
      ___    /\  \               /:/ _/_      \:\  \     /::\  \     _\:\  \                           ___      /:/ _/_      ___            
     /\__\   \:\  \             /:/ /\  \      \:\  \   /:/\:\  \   /\ \:\  \                         /\__\    /:/ /\  \    /\__\           
    /:/  /    \:\  \           /:/ /::\  \ ___ /::\  \ /:/  \:\  \ _\:\ \:\  \           ___     ___ /:/__/   /:/ /::\  \  /:/  /           
   /:/__/ ___  \:\__\         /:/_/:/\:\__/\  /:/\:\__/:/__/ \:\__/\ \:\ \:\__\         /\  \   /\__/::\  \  /:/_/:/\:\__\/:/__/            
  /::\  \/\  \ |:|  |         \:\/:/ /:/  \:\/:/  \/__\:\  \ /:/  \:\ \:\/:/  /         \:\  \ /:/  \/\:\  \_\:\/:/ /:/  /::\  \            
 /:/\:\  \:\  \|:|  |          \::/ /:/  / \::/__/     \:\  /:/  / \:\ \::/  /           \:\  /:/  / ~~\:\/\__\::/ /:/  /:/\:\  \           
 \/__\:\  \:\__|:|__|           \/_/:/  /   \:\  \      \:\/:/  /   \:\/:/  /             \:\/:/  /     \::/  /\/_/:/  /\/__\:\  \          
      \:\__\::::/__/              /:/  /     \:\__\      \::/  /     \::/  /               \::/  /      /:/  /   /:/  /      \:\__\         
       \/__/~~~~                  \/__/       \/__/       \/__/       \/__/                 \/__/       \/__/    \/__/        \/__/     
       
    

        EOF
    end 

end 