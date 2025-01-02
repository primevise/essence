# frozen_string_literal: true

module Essence
  module CLI
    class Add < Dry::CLI::Command
      desc "Add an Essence component to your project"
      argument :component_name, required: true, desc: "Component name"
      example Essence.component_names

      def call(*args)
        component_name = args[0][:component_name]
        key = component_name.to_sym
        has_stimulus_controller = Essence.components[key][:stimulus] || false

        return puts "> #{component_name}: component unsupported" unless Essence.component_keys.include?(key)
        puts "> [Essence] #{Essence.components[key][:name]}"

        if has_stimulus_controller
          Essence::CLI::Commands.copy_controller(component_name:)
          puts "> [Stimulus] #{Essence::CLI::Commands::STIMULUS_CONTROLLERS_DESTINATION_DIR.join("#{component_name}_controller.js")}"
        end

        Essence::CLI::Commands.copy_component(component_name:)
        Essence::CLI::Commands.replace_component_contents(component_name:)
        Essence::CLI::Commands.replace_component_contents(
          component_name:,
          from: Essence::CLI::Commands::COMPONENT_DEFINITION_SUFFIX,
          to: Essence::CLI::Commands::PHLEX_COMPONENT_DEFINITION_SUFFIX
        )

        puts "> [Phlex] #{Essence::CLI::Commands::DESTINATION_DIR.join("#{component_name}.rb")}"
      end
    end
  end
end
