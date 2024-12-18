# frozen_string_literal: true

module Essence
  module CLI
    class Install < Dry::CLI::Command
      desc "Install Essence to your project"

      def call(*)
        puts "> Installing Essence..."
        puts "> Copying base component to your project"
        Essence::CLI::Commands.copy_component(component_name: "component")
        puts "> Essence has been successfully installed!"
      end
    end
  end
end
