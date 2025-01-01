# frozen_string_literal: true

class Essence::Tabs < Essence::Essence
  BASE = ""

  attr_reader :attributes

  def initialize(**attributes)
    super(**attributes)
    @attributes[:class] = merge_classes([ BASE, @attributes[:class]])
  end

  def view_template(&)
    div(**attributes, &)
  end
end
