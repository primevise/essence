# frozen_string_literal: true

module Essence
  module CLI
    class Version < Dry::CLI::Command
      desc "Print version of Essence UI CLI"

      def call(*)
        puts Essence::VERSION
      end
    end
  end
end
