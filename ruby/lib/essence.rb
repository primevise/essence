require "tailwind_merge"

module Essence
  # Autoloading
  autoload :Component, "essence/component"

  autoload :Button, "essence/components/button"
  autoload :Link, "essence/components/link"
  autoload :Skeleton, "essence/components/skeleton"
  autoload :Row, "essence/components/row"

  autoload :CLI, "essence/cli"

  def self.components
    @components ||= {
      button: ::Essence::Button,
      link: ::Essence::Link,
      skeleton: ::Essence::Skeleton,
      row: ::Essence::Row,
    }
  end
end
