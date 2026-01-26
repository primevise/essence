# frozen_string_literal: true

# A skeleton component is used to show a loading state.
#
# ==== Examples
#
#    render Skeleton.new(class: "w-32 h-6")
#
# ==== Documentation
#
# https://essenceui.com/components/skeleton
#
class Components::Skeleton < Components::Essence
  def initialize(**attributes)
    super(**attributes)
  end

  def view_template(&) = div(**attributes, &)

  private

  def component_classes
    {
      _: {
        _: "animate-pulse bg-gray-200/55 rounded-xs"
      }
    }.freeze
  end
end
