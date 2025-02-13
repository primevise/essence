# frozen_string_literal: true

require "tailwind_merge"

require_relative "essence/configuration"

module Essence
  autoload :CLI, "essence/cli"

  class << self
    def root_path
      File.dirname(__dir__)
    end

    # CONFIGURATION
    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield configuration
    end

    # COMPONENTS
    def components
      @components ||= {
        accordion: {
          name: "Accordion",
          class_name: "Essence::Accordion",
          stimulus: false
        },
        alert: {
          name: "Alert",
          class_name: "Essence::Alert",
          stimulus: false
        },
        avatar: {
          name: "Avatar",
          class_name: "Essence::Avatar",
          stimulus: false
        },
        badge: {
          name: "Badge",
          class_name: "Essence::Badge",
          stimulus: false
        },
        button: {
          name: "Button",
          class_name: "Essence::Button",
          stimulus: false
        },
        card: {
          name: "Card",
          class_name: "Essence::Card",
          stimulus: false
        },
        checkbox: {
          name: "Checkbox",
          class_name: "Essence::Checkbox",
          stimulus: false
        },
        label: {
          name: "Label",
          class_name: "Essence::Label",
          stimulus: false
        },
        input: {
          name: "Input",
          class_name: "Essence::Input",
          stimulus: false
        },
        link: {
          name: "Link",
          class_name: "Essence::Link",
          stimulus: false
        },
        row: {
          name: "Row",
          class_name: "Essence::Row",
          stimulus: false
        },
        separator: {
          name: "Separator",
          class_name: "Essence::Separator",
          stimulus: false
        },
        skeleton: {
          name: "Skeleton",
          class_name: "Essence::Skeleton",
          stimulus: false
        },
        switch: {
          name: "Switch",
          class_name: "Essence::Switch",
          stimulus: true
        },
        tabs: {
          name: "Tabs",
          class_name: "Essence::Tabs",
          stimulus: true
        }
      }
    end

    def component_keys
      @component_keys ||= components.keys
    end

    def component_names
      @component_names ||= components.transform_values { |v| v[:name] }
    end

    def component_class_names
      @component_class_names ||= components.transform_values { |v| v[:class_name] }
    end

    def component_classes
      @component_classes ||= component_class_names.transform_values { |v| Object.const_get(v) }
    end
  end
end
