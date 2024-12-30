# frozen_string_literal: true

class Essence::Avatar < Essence::Essence
  BASE = "border border-transparent rounded-full bg-gray-100 aspect-square inline-flex items-center justify-center font-medium text-gray-700 overflow-hidden"

  SIZES = {
    sm: "size-6 text-[0.5rem]",
    md: "size-8 text-xs",
    lg: "size-12 text-sm"
  }

  attr_reader :attributes
  attr_reader :size

  def initialize(size: :md, **attributes)
    super(**attributes)
    @size = size
    @attributes[:class] = merge_classes([ BASE, SIZES[size], @attributes[:class]])
  end

  def view_template(&)
    div(**attributes) do
      img(src: attributes[:src], alt: attributes[:alt]) if attributes[:src]
      yield if block_given?
    end
  end

  def fallback(**attrs, &)
    div(**attrs, &)
  end
end
