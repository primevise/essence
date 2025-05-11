# frozen_string_literal: true

require 'fileutils'

module Essence
  module CLI
    class Add < Dry::CLI::Command
      desc "Add an Essence UI component"
      argument :component, required: true, desc: "Component name"
      example Essence.component_names

      def call(*args)
        puts "[Essence UI] Fetching..."

        slug = args[0][:component].to_sym
        specification = ::Essence::Client.new.get_component(slug:)
        return puts "[Essence UI] Component not found. Stopping" if specification == ""


        files = specification.dig("files")
        return puts "[Essence UI] Something went wrong. Stopping" unless files

        files.each{ |data| insert_file(slug:, data:) }
        puts "[Essence UI] #{specification.dig("title")} has been successfully added!"
      end

      private

      def insert_file(slug:, data:)
        destination_path = build_destination_path(kind: data["kind"], slug:)
        ::FileUtils.mkdir_p(destination_path.dirname)
        ::File.write(destination_path, data.dig("content"))
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
