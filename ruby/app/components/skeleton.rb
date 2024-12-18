# frozen_string_literal: true

class Components::Skeleton < Components::Essence
  CLASSES = "animate-pulse bg-gray-200/75 rounded-xs"

  def initialize(**attributes)
    @attributes = attributes
    @attributes[:class] = @attributes[:class] ? TAILWIND_MERGER.merge([ CLASSES, @attributes[:class] ]) : CLASSES
  end

  def view_template(&)
    div(**@attributes, &)
  end
end
