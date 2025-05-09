# frozen_string_literal: true

require "dry/cli"

# CLI Commands
require_relative "cli/add"
require_relative "cli/install"
require_relative "cli/version"

module Essence
  module CLI
    def self.call(*args)
      Dry::CLI.new(Commands).call
    end

    module Commands
      extend Dry::CLI::Registry

      register "add", Add, aliases: ["a", "generate", "g"]
      register "install", Install, aliases: ["i"]
      register "version", Version, aliases: ["v", "-v", "--version"]
    end
  end
end
