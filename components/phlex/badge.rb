# frozen_string_literal: true

class Components::Badge < Components::Essence
  attr_reader :color, :kind, :size

  def initialize(color: :primary, kind: :default, size: :md, **attributes)
    @color = color
    @kind = kind
    @size = size
    super(**attributes)
  end

  def view_template(&) = div(**attributes, &)

  private

  def component_classes
    {
      _: {
        _: "inline-flex items-center justify-center w-fit border border-transparent font-medium transition duration-150 hover:opacity-90",
        color: {
          none: "",
          primary: "text-gray-950 bg-white border-gray-950/10",
          secondary: "text-gray-950 bg-gray-950/5",
          success: "text-white bg-emerald-500",
          critical: "text-white bg-rose-500",
          warning: "text-white bg-amber-500",
          info: "text-white bg-blue-500",
          dark: "text-white bg-gray-900",
          white: "text-gray-900 bg-white"
        },
        kind: {
          none: "",
          default: "rounded-sm",
          pill: "rounded-full"
        },
        size: {
          none: "",
          sm: "text-[0.65rem] px-2 py-0.5 gap-1 min-w-8",
          md: "text-xs px-2.5 py-1 gap-2 min-w-12",
          lg: "text-sm px-4 py-1 gap-2 min-w-16"
        }
      }
    }.freeze
  end
end
