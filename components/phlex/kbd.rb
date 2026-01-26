# frozen_string_literal: true

class Components::Kbd < Components::Essence
  def initialize(**attributes)
    super(**attributes)
  end

  def view_template(&) = kbd(**attributes, &)

  private

  def component_classes
    {
      _: {
        _: "inline-flex w-fit font-medium py-0.5 px-1.5 rounded-xs border border-b-2 border-gray-950/5 bg-gray-50/50 text-gray-600 text-xs font-sans"
      }
    }.freeze
  end
end
