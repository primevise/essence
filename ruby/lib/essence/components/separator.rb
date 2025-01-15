# frozen_string_literal: true

class Essence::Separator < Essence::Essence
  BASE = "border-gray-200/50"

  KINDS = {
    horizontal: "border-t",
    vertical: "border-l h-full"
  }

  attr_reader :kind
  attr_reader :attributes

  def initialize(kind: :horizontal, **attributes)
    @kind = kind
    super(**attributes)
    @attributes[:class] = merge_classes([ BASE, KINDS[kind], @attributes[:class] ])
  end

  def view_template
    element_tag(**attributes)
  end

  private

  def element_tag(...)
    kind.to_sym == :horizontal ? hr(...) : div(...)
  end
end
