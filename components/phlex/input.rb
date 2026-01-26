# frozen_string_literal: true

class Components::Input < Components::Essence
  def initialize(**attributes)
    super(**attributes)
  end

  def view_template(&) = input(**attributes)

  private

  def component_classes
    {
      _: {
        _: "flex px-4 h-10 md:h-12 rounded-sm border border-gray-200/80 ring-gray-950/5 focus:outline-none focus:ring-offset-1 focus-visible:ring-1"
      }
    }.freeze
  end
end
