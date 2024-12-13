require "tailwind_merge"

module Essence
  # Autoloading compontents
  require_relative "../components/essence/component"
  require_relative "../components/essence/link"

  def self.display
    :voila
  end
end
