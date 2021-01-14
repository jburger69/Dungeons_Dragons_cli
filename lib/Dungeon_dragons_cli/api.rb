class DungeonDragonsCli::API
    
    def self.get_data
        url = "https://www.dnd5eapi.co/api/spells" #API data to scrape
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        spells_info = JSON.parse(response.body)["results"] #parses all info and gives back info in a hash

        spells_info.each do |spell| #take the spells_info and iterate over the hash grabing the spell name
            DungeonDragonsCli::Spells.new(spell) #call on spell object and instanceate a new spell passing in the spell hash
        end
    end

    def self.get_data_info(spell)
        url = "https://www.dnd5eapi.co/api/spells/#{spell.index}"
        response = Net::HTTP.get(URI(url))
        spell_details = JSON.parse(response)
    
        spell.description = spell_details["desc"] #make a local variable spell.description and set it to equal spells_details and pass in the ["desc hash"]
        spell.range = spell_details["range"]
        spell.duration = spell_details["duration"]
        spell.attack_type = spell_details["attack_type"]
      end

end