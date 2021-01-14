class DungeonDragonsCli::CLI

    def call
        system "clear" # clears the terminal when user runs executable.
        puts "welcome to the Dungeon & Dragons spell list!"
        puts ""
        puts "Loading all the spells for you.... One moment please."
        DungeonDragonsCli::API.get_data
        puts ""
        menu
    end

    def menu
        puts "Enter 'spells' to see a list or 'exit' to exit program"
        input = gets.strip.downcase

        if input == "spells"
            spells_list
         elsif input != "exit" && input != "spells"
            puts ""
            puts "Invalid answer please type 'spells' or 'exit' to leave."
            puts ""
            menu
         else input == "exit"
            exit_cli
         end
    end

    def spells_list
        #DungeonDragonsCli::API.get_data
        DungeonDragonsCli::Spells.all.each.with_index(1) do |spell, index| 
            puts "#{index}. #{spell.name}" # will output a index with a spell name.. 1.)acid-arrow
        end
        puts ""
        puts "which spell would you like more detail about?"
        puts ""
        puts ""
        puts "Type in a Number of the spell you would like or you can stop the program by typing 'exit'"
        spells_list_info
    end

    def spells_list_info
        input = gets.strip
        if input == "exit"
            exit_cli
        elsif input.to_i > 0 && input.to_i <= DungeonDragonsCli::Spells.all.length
                spell = DungeonDragonsCli::Spells.all[input.to_i - 1]
                DungeonDragonsCli::API.get_data_info(spell)
                print_spell(spell)
        else 
            puts ""
            puts "That is not a valid answer, Sorry please try again!"
            puts ""
            display_again
        end
    end

    def print_spell(spell)
        puts ""
        puts ""
        puts "Name: #{spell.name}"
        puts ""
        puts "Description: #{spell.description}"
        puts ""
        puts "Range: #{spell.range}"
        puts ""
        puts ""
        puts "Duration: #{spell.duration}"
        puts ""
        puts "Attack_type: #{spell.attack_type}"
        puts ""
        display_again
    end

    def display_again
        puts "Would you like to see the spells list again? enter 'yes' or 'exit' to exit the program."
        user_input = gets.strip.downcase

        if user_input == 'yes'
            puts "Hang in there while we get the list"
            puts ""
            puts ""
            sleep 1
            spells_list

        elsif user_input == 'exit'
            exit_cli
        else 
            puts ""
            puts "That is not a valid answer, Sorry please try again!"
            puts ""
            display_again
        end
    end


    def exit_cli
        puts ""
        puts "Thank you for stoping in! We hope your knowledge has grown!"
        puts ""
    end
end