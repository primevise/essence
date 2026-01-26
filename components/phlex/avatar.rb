# frozen_string_literal: true

class Components::Avatar < Components::Essence
  attr_reader :initials, :size

  def initialize(initials: nil, size: :md, **attributes)
    @initials = initials
    @size = size
    super(**attributes)
  end

  def view_template(&)
    div(**attributes) do
      div { initials } if initials
      img(src: attributes[:src], alt: attributes[:alt], class: component_classes[:image][:_]) if attributes[:src]
      yield if block_given?
    end
  end

  private

  def component_classes
    {
      _: {
        _: "relative border border-transparent rounded-full bg-gray-100 aspect-square inline-flex items-center justify-center font-medium text-gray-700 overflow-hidden",
        size: {
          sm: "size-6 text-[0.5rem]",
          md: "size-8 text-xs",
          lg: "size-12 text-sm"
        }
      },
      image: {
        _: "absolute w-full h-full object-cover z-50"
      }
    }.freeze
  end
end
