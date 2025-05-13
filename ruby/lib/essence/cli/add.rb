# frozen_string_literal: true

require 'fileutils'

module Essence
  module CLI
    class Add < Dry::CLI::Command
      attr_reader :slug

      desc "Add an Essence UI component"
      argument :component, required: true, desc: "Component name"
      example Essence.component_names

      def call(*args)
        @slug = args[0][:component].to_sym

        puts "[Essence UI] Fetching..."
        specification = ::Essence::Client.new.get_component(slug:)
        return puts "[Essence UI] Component not found. Stopping" if specification == ""


        artifacts = specification.dig("artifacts")
        return puts "[Essence UI] Something went wrong. Stopping" unless artifacts

        artifacts.each { handle_artifact(artifact: _1) }
        puts "[Essence UI] #{specification.dig("title")} has been successfully added!"
      end

      private

      def handle_artifact(artifact:)
        case artifact["kind"]
        when "phlex", "stimulus"
          insert_file(artifact:)
        when "node_package"
          # TODO
        end
      end

      def insert_file(artifact:)
        destination_path = build_destination_path(kind: artifact["kind"], slug:)
        return unless destination_path

        ::FileUtils.mkdir_p(destination_path.dirname)
        ::File.write(destination_path, artifact.dig("content"))
        puts "[Essence UI] Adding #{destination_path}"
      end

      def build_destination_path(kind:, slug:)
        case kind
        when "phlex"
          ::Essence.configuration.phlex_components_dir.join("#{slug}.rb")
        when "stimulus"
          ::Essence.configuration.stimulus_controllers_dir.join("#{slug}_controller.js")
        else
          nil
        end
      end
    end
  end
end
