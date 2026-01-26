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


        add_gem("tailwind_merge") unless has_gem?("tailwind_merge")

        # begin
        #   system(*command)
        #   if $?.success?
        #     puts "✅ Successfully added gem 'tailwind_merge' to your Gemfile"
        #   else
        #     puts "❌ Failed to add gem 'tailwind_merge' to your Gemfile (exit code: #{$?.exitstatus})"
        #   end
        # rescue => e
        #   puts "❌ Error: #{e.message}"
        # end

        puts "[Essence UI] Done!"
      end

      private

      def has_gem?(title)
        Bundler.load.specs.find { |s| s.name == title }
      end

      def add_gem(title)
        puts "[Essence UI] Adding #{title} gem"
        command = ["bundle", "add", title]

        begin
          system(*command)
          if $?.success?
            puts "[Essence UI] Successfully added gem 'tailwind_merge' to your Gemfile"
          else
            puts "[Essence UI] Failed to add gem 'tailwind_merge' to your Gemfile (exit code: #{$?.exitstatus})"
          end
        rescue => e
          puts "[Essence UI] Error: #{e.message}"
        end
      end
    end
  end
end
