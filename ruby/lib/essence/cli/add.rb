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

        spec = ::Essence::Client.new.get_component(slug:)
        return puts "[Essence UI] Component not found. Stopping" if spec == ""

        destination = ::Essence.configuration.phlex_components_dir.join("#{slug}.rb")
        puts "[Essence UI] Pasting component to #{destination}"

        ::FileUtils.mkdir_p(destination.dirname)
        ::File.write(destination, spec.dig("definition"))
      end
    end
  end
end
