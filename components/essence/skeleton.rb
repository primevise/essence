# frozen_string_literal: true

class Essence::Skeleton < Essence::Component
  CLASSES = "animate-pulse bg-gray-200/55 rounded-xs"

  def initialize(**attributes)
    @attributes = attributes
    @attributes[:class] = @attributes[:class] ? TAILWIND_MERGER.merge([ CLASSES, @attributes[:class] ]) : CLASSES
  end

  def view_template(&)
    div(**@attributes, &)
  end
end
