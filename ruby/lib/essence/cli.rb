# frozen_string_literal: true

require "dry/cli"

module Essence
  module CLI
    module Commands
      extend Dry::CLI::Registry

      # Constants
      COMPONENTS_DIR = Pathname.new(File.expand_path("components", __dir__))
      DESTINATION_DIR = Pathname.new(File.expand_path(Dir.pwd)).join("app/components")

      class Version < Dry::CLI::Command
        desc "Print Essence version"

        def call(*)
          puts Essence::VERSION
        end
      end

      class Install < Dry::CLI::Command
        desc "Install Essence to your project"

        def call(*)
          puts "> Installing Essence..."
          puts "> Copying base component to your project"
          Essence::CLI::Commands.copy_component(component_name: "component")
          puts "> Essence has been successfully installed!"
        end
      end

      class Add < Dry::CLI::Command
        desc "Add an Essence component to your project"

        argument :component_name, required: true, desc: "Component name"

        example Essence.component_names

        def call(*args)
          component_name = args[0][:component_name]
          return puts "> Component #{component_name} unavailable" unless Essence.component_names.include?(component_name.to_sym)

          Essence::CLI::Commands.copy_component(component_name:)
          Essence::CLI::Commands.replace_component_definition(component_name:)
          puts "> Successfully added #{component_name} component to #{destination_path}"
        end
      end

      class Remove < Dry::CLI::Command
        desc "Remove an Essence component from your project"

        argument :name, required: true, desc: "Component name"

        example Essence.component_names

        def call(*args)
          puts "Removing Essence component"
          puts *args
        end
      end

      register "add", Add, aliases: ["a", "generate", "g"]
      register "version", Version, aliases: ["v", "-v", "--version"]
      register "install", Install, aliases: ["i"]
      # register "remove", Remove, aliases: ["r", "destroy", "d"]


      private

      # UTILITIES
      def self.copy_component(component_name:)
        source_path = COMPONENTS_DIR.join("#{component_name}.rb")
        destination_path = DESTINATION_DIR.join("#{component_name}.rb")

        FileUtils.mkdir_p(DESTINATION_DIR)
        FileUtils.copy(source_path, destination_path)
      end

      def self.replace_component_definition(component_name:)
        component_file = DESTINATION_DIR.join("#{component_name}.rb")
        return unless File.exist?(component_file)

        current_content = File.read(component_file)
        component_class_name = Essence.component_class_names[component_name.to_sym]
        replaced_content = current_content.gsub(/class Essence::/, "class Components::")

        File.open(component_file, "w") { |file| file.write(replaced_content) }
      end
    end

    def self.call(*args)
      puts "> Essence:"
      Dry::CLI.new(Commands).call
    end

  end
end
