require_relative "./Dungeon_dragons_cli/version"
require_relative "./Dungeon_dragons_cli/api"
require_relative "./Dungeon_dragons_cli/cli"
require_relative "./Dungeon_dragons_cli/spells"

require 'pry'
require 'open-uri'
require 'net/http'
require 'json'

module DungeonDragonsCli
  class Error < StandardError; end
  # Your code goes here...
end
