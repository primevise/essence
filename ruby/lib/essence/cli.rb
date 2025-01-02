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

      # Constants
      COMPONENTS_DIR = Pathname.new(File.expand_path("components", __dir__))
      DESTINATION_DIR = Pathname.new(File.expand_path(Dir.pwd)).join(::Essence.configuration.phlex_components_path)

      COMPONENT_DEFINITION_PREFIX = "class Essence::"
      COMPONENT_DEFINITION_SUFFIX = "< Essence::Essence"
      PHLEX_COMPONENT_DEFINITION_PREFIX = "class Components::"
      PHLEX_COMPONENT_DEFINITION_SUFFIX = "< Components::Essence"

      # Registering commands
      register "add", Add, aliases: ["a", "generate", "g"]
      register "install", Install, aliases: ["i"]
      register "version", Version, aliases: ["v", "-v", "--version"]

      private

      # UTILITIES
      def self.copy_component(component_name:)
        source_path = COMPONENTS_DIR.join("#{component_name}.rb")
        destination_path = DESTINATION_DIR.join("#{component_name}.rb")

        FileUtils.mkdir_p(DESTINATION_DIR)
        FileUtils.copy(source_path, destination_path)
      end

      def self.replace_component_contents(
        component_name:,
        from: COMPONENT_DEFINITION_PREFIX,
        to: PHLEX_COMPONENT_DEFINITION_PREFIX
      )
        component_file = DESTINATION_DIR.join("#{component_name}.rb")
        return unless File.exist?(component_file)

        replaced_content = File.read(component_file).gsub(from, to)
        File.write(component_file, replaced_content)
      end

      def self.rename_component_file(from:, to:)
        return if from.nil? || to.nil?
        return unless File.exist?(from)

        FileUtils.mv(from, to)
      end
    end
  end
end
