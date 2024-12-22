# frozen_string_literal: true

class Essence::Skeleton < Essence::Essence
  BASE = "animate-pulse bg-gray-200/55 rounded-xs"

  def initialize(**attributes)
    @attributes = attributes
    @attributes[:class] = @attributes[:class] ? TAILWIND_MERGER.merge([ BASE, @attributes[:class] ]) : BASE
  end

  def view_template(&)
    div(**@attributes, &)
  end
end
