class CLI

    def start
        puts "Welcome! We are TV shows. What is your name?"
        API.get_data
        input = user_input
        greet(input)
    end
    
    def user_input
        gets.strip.capitalize!
    end 

    def greet(name)
        puts "Hey there #{name}! Let's get started! Will you like to see some TV shows?. Enter Y to see more shows, or enter exit to exit."
        menu 
    end 

    def menu
        selection = user_input
        if selection == "Y"
            print_shows
            menu
        elsif selection == "Exit"
            goodbye
        else 
            invalid 
        end
    end 


    def goodbye
        puts "Thanks for participating!"
    end 

    def invalid
        puts "invalid response. Try again."
        menu
    end
    
    def print_shows
        Show.all.each.with_index(1) do |show, index|
            puts "#{index}. #{show.name}"
        end 
        select_show 
    end 

    def select_show
        puts "Please enter the name of the TV show you wish to learn more about."
        selection = user_input
        show = Show.find_by_selection(selection)
        # puts "input u to see a list or exit to leave."
        show_details(show) 
        
    end

    def show_details(show)
        puts "Name: #{show.name}"
        puts "Summary: #{show.summary}"
        puts "genre(s): #{show.genres}"
        menu
    end
    
end 
