# frozen_string_literal: true

# A skeleton component is used to show a loading state.
#
# ==== Examples
#
#    render Skeleton.new(class: "w-32 h-6")
#
# ==== Documentation
#
# https://essence.primevise.com/components/skeleton
#
class Essence::Skeleton < Essence::Essence
  BASE = "animate-pulse bg-gray-200/55 rounded-xs"

  def initialize(**attributes)
    super(**attributes)
    @attributes[:class] = merge_classes([ BASE, @attributes[:class]])
  end

  def view_template(&)
    div(**@attributes, &)
  end
end
