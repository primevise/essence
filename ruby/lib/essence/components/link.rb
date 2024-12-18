# frozen_string_literal: true

class Essence::Link < Essence::Essence
  CLASS = "inline-flex w-fit items-center gap-1 font-medium text-gray-900 border-b-2 hover:border-gray-900 transition-colors"
  KINDS = {
    regular: "border-transparent",
    underline: "border-gray-200"
  }

  attr_reader :attributes

  def initialize(kind: :regular, **attributes)
    @attributes = attributes
    @attributes[:class] = @attributes[:class] ? TAILWIND_MERGER.merge([ CLASS, @attributes[:class] ]) : CLASS
  end

  def view_template(&)
    a(**attributes, &)
  end
end
