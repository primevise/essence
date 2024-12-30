# frozen_string_literal: true

class Essence::Row < Essence::Essence
  BASE = "flex gap-4"
  KINDS = {
    default: "flex-col md:flex-row md:items-center md:justify-between",
    center: "flex-col md:flex-row md:items-center md:justify-center",
    start: "flex-col md:flex-row md:items-center md:justify-start",
    end: "flex-col md:flex-row md:items-center md:justify-end",
  }

  attr_reader :kind
  attr_reader :attributes

  def initialize(kind: :default, **attributes)
    @kind = kind
    super(**attributes)
    @attributes[:class] = merge_classes([ BASE, KINDS[kind], @attributes[:class]])
  end

  def view_template(&)
    div(**attributes, &)
  end

  def item(**attrs, &)
    div(class: TAILWIND_MERGER.merge([ "flex items-center gap-2 flex-wrap", attrs[:class] ]), **attrs, &)
  end
end
