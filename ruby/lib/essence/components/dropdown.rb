# frozen_string_literal: true

class Essence::Dropdown < Essence::Essence
  BASE = ""

  attr_reader :attributes

  def initialize(**attributes)
    @attributes = attributes
    @attributes[:class] = construct_classes(@attributes[:class])
  end

  def view_template(&)
    div(**attributes) do
      yield if block_given?
    end
  end

  private

  def construct_classes(classes)
    TAILWIND_MERGER.merge([ BASE, SIZES[size], KINDS[kind], classes ].compact)
  end
end
