# frozen_string_literal: true

module Essence
  module CLI
    class Add < Dry::CLI::Command
      desc "Add an Essence component to your project"
      argument :component_name, required: true, desc: "Component name"
      example Essence.component_names

      def call(*args)
        component_name = args[0][:component_name]

        return puts "> #{component_name}: component unsupported" unless Essence.component_names.include?(component_name.to_sym)

        Essence::CLI::Commands.copy_component(component_name:)
        Essence::CLI::Commands.replace_component_contents(component_name:)
        Essence::CLI::Commands.replace_component_contents(
          component_name:,
          from: Essence::CLI::Commands::COMPONENT_DEFINITION_SUFFIX,
          to: Essence::CLI::Commands::PHLEX_COMPONENT_DEFINITION_SUFFIX
        )

        puts "> Successfully added #{component_name} component to #{Essence::CLI::Commands::DESTINATION_DIR.join("#{component_name}.rb")}"
      end
    end
  end
end
