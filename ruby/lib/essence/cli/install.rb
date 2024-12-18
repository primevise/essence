# frozen_string_literal: true

module Essence
  module CLI
    class Install < Dry::CLI::Command
      BASE_COMPONENT_NAME = "essence"
      BASE_DEFINITION_PREFIX = "class Essence::Essence"
      PHLEX_BASE_DEFINITION_PREFIX = "class Components::Essence"

      desc "Install Essence to your project"
      def call(*)
        puts "> Installing Essence..."
        puts "> Copying base component to your project"
        Essence::CLI::Commands.copy_component(component_name: BASE_COMPONENT_NAME)
        Essence::CLI::Commands.replace_component_contents(
          component_name: BASE_COMPONENT_NAME,
          from: BASE_DEFINITION_PREFIX,
          to: PHLEX_BASE_DEFINITION_PREFIX
        )
        # Essence::CLI::Commands.rename_component_file(
        #   from: Essence::CLI::Commands::DESTINATION_DIR.join("#{BASE_COMPONENT_NAME}.rb"),
        #   to: Essence::CLI::Commands::DESTINATION_DIR.join("essence.rb")
        # )
        puts "> Essence has been successfully installed!"
      end
    end
  end
end
