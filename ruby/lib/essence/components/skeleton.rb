# frozen_string_literal: true

class Essence::Skeleton < Essence::Essence
  BASE = "animate-pulse bg-gray-200/55 rounded-xs"

  def initialize(**attributes)
    super(**attributes)
    @attributes[:class] = merge_classes([ BASE, @attributes[:class]])
  end

  def view_template(&)
    div(**@attributes, &)
  end
end
