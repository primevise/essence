# frozen_string_literal: true

require "tailwind_merge"

require_relative "essence/configuration"

module Essence
  # Autoloading
  autoload :Accordion, "essence/components/accordion"
  autoload :Avatar, "essence/components/avatar"
  autoload :Badge, "essence/components/badge"
  autoload :Button, "essence/components/button"
  # autoload :Essence, "essence/components/essence" # Base component
  autoload :Link, "essence/components/link"
  autoload :Row, "essence/components/row"
  autoload :Skeleton, "essence/components/skeleton"

  autoload :CLI, "essence/cli"

  # Components
  # Class names and classes are separated to avoid loading in Phlex into the CLI tooling

  def self.component_class_names
    @component_class_names ||= {
      essence: "Essence::Essence",
      accordion: "Essence::Accordion",
      avatar: "Essence::Avatar",
      badge: "Essence::Badge",
      button: "Essence::Button",
      link: "Essence::Link",
      row: "Essence::Row",
      skeleton: "Essence::Skeleton",
    }
  end

  def self.component_classes
    @components_classes ||= {
      essence: ::Essence::Essence,
      accordion: ::Essence::Accordion,
      avatar: ::Essence::Avatar,
      badge: ::Essence::Badge,
      button: ::Essence::Button,
      link: ::Essence::Link,
      row: ::Essence::Row,
      skeleton: ::Essence::Skeleton,
    }
  end

  def self.component_names
    @component_names ||= component_class_names.keys
  end

  # Configuration
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield configuration
  end
end
