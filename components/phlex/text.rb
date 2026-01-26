# frozen_string_literal: true

class Components::Text < Components::Essence
  attr_reader :color, :size

  def initialize(color: :default, size: :md, **attributes)
    @color = color
    @size = size
    super(**attributes)
  end

  def view_template(&) = p(**attributes, &)

  private

  def component_classes
    {
      _: {
        _: "",
        color: {
          none: "",
          default: "text-gray-950/60",
          muted: "text-gray-950/45",
          highlighted: "text-gray-950"
        },
        size: {
          none: "",
          sm: "text-sm",
          md: "text-base",
          lg: "text-lg"
        }
      }
    }.freeze
  end
end
