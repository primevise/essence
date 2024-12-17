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

        argument :component_name, required: true, desc: "Component name"

        example [
          "badge",
          "skeleton"
        ]

        def call(*args)
          component_name = args[0][:component_name]

          puts Essence.components.keys

          source_dir = Pathname.new(File.expand_path("components", __dir__))
          source_path = source_dir.join("#{component_name}.rb")

          destination_dir = Pathname.new(File.expand_path(Dir.pwd)).join("app/components")
          destination_path = destination_dir.join("#{component_name}.rb")

          FileUtils.mkdir_p(destination_dir)
          FileUtils.copy(source_path, destination_path)

          puts "Essence:"
          puts "> Successfully added #{component_name} component to #{destination_path}"
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
      register "version", Version, aliases: ["v", "-v", "--version"]
      # register "remove", Remove, aliases: ["r", "destroy", "d"]
      # register "install", Install, aliases: ["i"]
    end

    def self.call(*args)
      Dry::CLI.new(Commands).call
    end

    private

    COMPONENTS_PATH = Pathname.new(File.expand_path("components", __dir__))

    def copy_component(name)
      puts "Copying component #{name}"
      FileUtils.cp(COMPONENTS_PATH.join("#{name}.rb"), "lib/essence/components/test/#{name}.rb")
    end
  end
end
