class DungeonDragonsCli::Spells
    
    attr_accessor :name, :index, :description, :range, :duration, :attack_type

    @@all = []

    def initialize(hash) #initilize with the hash passed in from api
      hash.each do |k, v| #iterate through the hash of key and value pairs
        self.send(("#{k}="), v) if self.respond_to?(("#{k}=")) #sends key value pair and if it dosent reconize it will move along.
      end
      @@all << self 
    end


    def self.all
        @@all  #.all method to call everything in my Class Variable all array
    end

end