# frozen_string_literal: true

class Essence::Accordion < Essence::Essence
  BASE = "group py-4"
  TRIGGER_BASE = "cursor-pointer list-none flex items-center justify-between text-base font-medium"
  CONTENT_BASE = "py-2 transform transition-all duration-500 not-open:-mt-4 opacity-0 group-open:opacity-100 group-open:mt-0 text-sm"
  CHEVRON_BASE = "transform transition-all duration-300 rotate-90 group-open:-rotate-90 text-lg text-gray-700"

  attr_reader :attributes

  def initialize(**attributes)
    super(**attributes)
    @attributes[:class] = merge_classes([ BASE, @attributes[:class]])
  end

  def view_template(&)
    details(class: "w-full group py-4", &) if block_given?
  end

  def trigger(**tattributes, &)
    summary(class: merge_classes(TRIGGER_BASE, tattributes[:class])) do
      p(class: "inline", &)
      span(class: CHEVRON_BASE) { "›" }
    end
  end

  def content(**cattributes, &)
    p(class: merge_classes(CONTENT_BASE, cattributes[:class]), &)
  end

  private

  def merge_classes(*classes)
    TAILWIND_MERGER.merge([ *classes ].compact)
  end
end
