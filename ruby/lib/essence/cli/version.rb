# frozen_string_literal: true

module Essence
  module CLI
    class Version < Dry::CLI::Command
      desc "Print Essence version"

      def call(*)
        puts Essence::VERSION
      end
    end
  end
end
