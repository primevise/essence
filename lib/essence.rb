require "tailwind_merge"

module Essence
  # Autoloading compontents
  # autoload :Link, "components/essence/link.rb"
  require_relative "../components/essence/link"

  def self.display
    :voila
  end
end
