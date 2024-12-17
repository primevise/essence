# frozen_string_literal: true

require "dry/cli"

module Essence
  module CLI
    module Commands
      extend Dry::CLI::Registry

      class Version < Dry::CLI::Command
        desc "Print Essence version"

        def call(*)
          puts Essence::VERSION
        end
      end

      class Install < Dry::CLI::Command
        desc "Install Essence to your project"

        def call(*)
          puts "--- Installing Essence ---"
        end
      end

      class Add < Dry::CLI::Command
        desc "Add an Essence component to your project"

        argument :name, required: true, desc: "Component name"

        example [
          "badge",
          "skeleton"
        ]

        def call(*args)
          puts "Adding Essence component"
          puts *args
        end
      end
      class Remove < Dry::CLI::Command
        desc "Remove an Essence component from your project"

        argument :name, required: true, desc: "Component name"

        example [
          "badge",
          "skeleton"
        ]

        def call(*args)
          puts "Removing Essence component"
          puts *args
        end
      end

      register "add", Add, aliases: ["a", "generate", "g"]
      register "remove", Remove, aliases: ["r", "destroy", "d"]
      register "install", Install, aliases: ["i"]
      register "version", Version, aliases: ["v", "-v", "--version"]
    end

    def self.call(*args)
      Dry::CLI.new(Commands).call
    end
  end
end
