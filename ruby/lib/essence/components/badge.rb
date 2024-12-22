# frozen_string_literal: true

class Essence::Avatar < Essence::Essence
  BASE = "border border-transparent rounded-full bg-gray-100 aspect-square inline-flex items-center justify-center font-medium text-gray-700"

  SIZES = {
    sm: "size-6 text-xs",
    md: "size-8 text-sm",
    lg: "size-12 text-base"
  }

  attr_reader :attributes
  attr_reader :size

  def initialize(size: :md, **attributes)
    @size = size
    @attributes = attributes
    @attributes[:class] = construct_classes(@attributes[:class])
  end

  def view_template(&)
    div(**attributes, &)
  end

  def fallback(**attrs, &)
    span(**attrs, &)
  end

  def construct_classes(classes)
    TAILWIND_MERGER.merge([ BASE, SIZES[size], classes ].compact)
  end
end
