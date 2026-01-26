# frozen_string_literal: true

class Components::Link < Components::Essence
  attr_reader :kind, :arrow

  def initialize(decoration: :fade, arrow: :none, **attributes)
    @decoration = decoration
    @arrow = arrow
    super(**attributes)
  end

  def view_template(&) = a(**attributes, &)

  private

  def component_classes
    {
      _: {
        _: "inline-flex items-center gap-1 font-medium text-gray-950 after:font-medium transition-colors",
        arrow: {
          none: "",
          right_after: "after:content-['→'] after:text-gray-950/90 after:text-xs after:font-medium",
          left_after: "after:content-['←'] after:text-gray-950/90 after:text-xs after:font-medium",
          up_after: "after:content-['↑'] after:text-gray-950/90 after:text-xs after:font-medium",
          down_after: "after:content-['↓'] after:text-gray-950/90 after:text-xs after:font-medium",
          up_right_after: "after:content-['↗'] after:text-gray-950/90 after:text-xs after:font-medium",
          up_left_after: "after:content-['↖'] after:text-gray-950/90 after:text-xs after:font-medium",
          down_right_after: "after:content-['↘'] after:text-gray-950/90 after:text-xs after:font-medium",
          down_left_after: "after:content-['↙'] after:text-gray-950/90 after:text-xs after:font-medium",
          right_before: "before:content-['→'] before:text-gray-950/90 before:text-xs before:font-medium",
          left_before: "before:content-['←'] before:text-gray-950/90 before:text-xs before:font-medium",
          up_before: "before:content-['↑'] before:text-gray-950/90 before:text-xs before:font-medium",
          down_before: "before:content-['↓'] before:text-gray-950/90 before:text-xs before:font-medium",
          up_right_before: "before:content-['↗'] before:text-gray-950/90 before:text-xs before:font-medium",
          up_left_before: "before:content-['↖'] before:text-gray-950/90 before:text-xs before:font-medium",
          down_right_before: "before:content-['↘'] before:text-gray-950/90 before:text-xs before:font-medium",
          down_left_before: "before:content-['↙'] before:text-gray-950/90 before:text-xs before:font-medium"
        },
        decoration: {
          none: "",
          default: "border-b-[1.5px] border-transparent hover:border-gray-950",
          underline: "border-b-[1.5px] border-gray-950",
          fade: "hover:opacity-70 transition-opacity"
        }
      }
    }.freeze
  end
end
