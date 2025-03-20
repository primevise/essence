# frozen_string_literal: true

class Essence::Text < Essence::Essence
  BASE = "text-base text-gray-500 dark:text-gray-400"
  SIZES = {
    sm: "text-sm",
    md: "text-base",
    lg: "text-lg"
  }

  attr_reader :size

  def initialize(size: :md, **attributes)
    super(**attributes)
    @attributes[:class] = merge_classes([ BASE, SIZES[size], attributes[:class] ])
  end

  def view_template(&)
    p(**attributes, &)
  end
end
