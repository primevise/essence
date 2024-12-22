# frozen_string_literal: true

require "tailwind_merge"

module Essence
  # Autoloading
  autoload :Component, "essence/components/component"

  autoload :Button, "essence/components/button"
  autoload :Link, "essence/components/link"
  autoload :Skeleton, "essence/components/skeleton"
  autoload :Row, "essence/components/row"

  autoload :CLI, "essence/cli"

  # Components
  # Class names and classes are separated to avoid loading in Phlex into the CLI tooling

  def self.component_class_names
    @component_class_names ||= {
      essence: "Essence::Essence",
      avataro: "Essence::Avatar",
      badge: "Essence::Badge",
      button: "Essence::Button",
      link: "Essence::Link",
      skeleton: "Essence::Skeleton",
      row: "Essence::Row",
    }
  end

  def self.component_classes
    @components_classes ||= {
      essence: ::Essence::Essence,
      avatar: ::Essence::Avatar,
      badge: ::Essence::Badge,
      button: ::Essence::Button,
      link: ::Essence::Link,
      skeleton: ::Essence::Skeleton,
      row: ::Essence::Row,
    }
  end

  def self.component_names
    @component_names ||= component_class_names.keys
  end
end
