# frozen_string_literal: true

class Essence::Input < Essence::Essence
  BASE = "flex px-4 h-10 md:h-12 rounded-sm border border-gray-200/80 focus:outline-none focus:ring-offset-2 focus-visible:ring-2"

  def initialize(**attributes)
    super(**attributes)
    @attributes[:class] = merge_classes([ BASE, @attributes[:class] ])
  end

  def view_template(&)
    input(**attributes)
  end
end
