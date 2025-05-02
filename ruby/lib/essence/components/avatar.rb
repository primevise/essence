# frozen_string_literal: true

class Essence::Avatar < Essence::Essence
  BASE = "relative border border-transparent rounded-full bg-gray-100 aspect-square inline-flex items-center justify-center font-medium text-gray-700 overflow-hidden"
  IMAGE_CLASSES = "absolute w-full h-full object-cover z-50"
  SIZES = {
    sm: "size-6 text-[0.5rem]",
    md: "size-8 text-xs",
    lg: "size-12 text-sm"
  }

  attr_reader :initials
  attr_reader :size
  attr_reader :attributes

  def initialize(initials: nil, size: :md, **attributes)
    @initials  = initials
    @size = size

    super(**attributes)
    @attributes[:class] = merge_classes(BASE, SIZES[size], attributes[:class])
  end

  def view_template(&)
    div(**attributes) do
      div { initials } if initials
      img(src: attributes[:src], alt: attributes[:alt], class: IMAGE_CLASSES) if attributes[:src]
      yield if block_given?
    end
  end
end
