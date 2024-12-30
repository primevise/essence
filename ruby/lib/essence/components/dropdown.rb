# frozen_string_literal: true

class Essence::Dropdown < Essence::Essence
  BASE = ""

  attr_reader :attributes

  def initialize(**attributes)
    super(**attributes)
    @attributes[:class] = merge_classes([ BASE, @attributes[:class]])
  end

  def view_template(&)
    div(**attributes) do
      yield if block_given?
    end
  end
end
