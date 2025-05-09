# frozen_string_literal: true

module Essence
  module CLI
    class Install < Dry::CLI::Command
      BASE_COMPONENT_NAME = "essence"
      BASE_DEFINITION_PREFIX = "class Essence::Essence"
      PHLEX_BASE_DEFINITION_PREFIX = "class Components::Essence"

      desc "Install Essence UI to your codebase"
      def call(*)
        puts "[Essence UI] Installing..."
        ::Essence::CLI::Add.new.call(*[{component: "essence"}])
        puts "[Essence UI] Done!"
      end
    end
  end
end
