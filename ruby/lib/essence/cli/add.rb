# frozen_string_literal: true

require 'fileutils'

module Essence
  module CLI
    class Add < Dry::CLI::Command
      desc "Add an Essence UI component"
      argument :component, required: true, desc: "Component name"
      example Essence.component_names

      def call(*args)
        slug = args[0][:component].to_sym
        puts "[Essence UI] Fetching #{slug} component"

        specification = ::Essence::Client.new.get_component(slug:)
        return puts "[Essence UI] Component not found. Stopping" if specification == ""
        insert_file(slug:, specification:)

        dependencies = specification.dig("dependencies")

        if dependencies
          dependencies.each{|specification| insert_file(slug:, specification: )}
        end
      end

      private

      def insert_file(slug:, specification:)
        destination_path = build_destination_path(kind: specification["kind"], slug:)
        ::FileUtils.mkdir_p(destination_path.dirname)
        ::File.write(destination_path, specification.dig("definition"))
        puts "[Essence UI] File added at #{destination_path}"

      end

      def build_destination_path(kind:, slug:)
        case kind
        when "phlex"
          ::Essence.configuration.phlex_components_dir.join("#{slug}.rb")
        when "stimulus"
          ::Essence.configuration.stimulus_controllers_dir.join("#{slug}_controller.rb")
        else
          nil
        end
      end
    end
  end
end
