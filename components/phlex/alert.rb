# frozen_string_literal: true

class Components::Alert < Components::Essence
  attr_reader :kind

  def initialize(kind: :primary, **attributes)
    @kind = kind
    super(**attributes)
  end

  def view_template(&) = div(**attributes, &)
  def title(**, &) = p(**m(**), &)
  def description(**, &) = p(**m(**), &)
  def icon(**, &) = div(**m(**), &)

  private

  def component_classes
    {
      _: {
        _: "bg-white border-l-2 flex flex-col p-3 sm:p-4 bg-gray-50/50",
        kind: {
          primary: "border-blue-500",
          critical: "border-rose-600",
          warning: "border-orange-400",
          success: "border-emerald-500"
        }
      },
      title: {
        _: "text-gray-900 text-sm sm:text-base font-medium w-full"
      },
      description: {
        _: "text-gray-700 flex text-xs sm:text-sm w-full"
      },
      icon: {
        _: "inline-flex items-center justify-center w-fit size-7 rounded-xs",
        kind: {
          primary: "bg-blue-500 text-white",
          critical: "bg-rose-600 text-white",
          warning: "bg-orange-400 text-gray-900",
          success: "bg-emerald-500 text-white"
        }
      }
    }.freeze
  end
end
