# frozen_string_literal: true

class Essence::Badge < Essence::Essence
  BASE = "inline-flex items-center justify-center w-fit rounded-full border border-transparent font-medium transition duration-150 hover:opacity-90"
  SIZES = {
    none: "",
    sm: "text-[0.65rem] px-2 py-0.5 gap-1 min-w-8",
    md: "text-xs px-2.5 py-1 gap-2 min-w-12",
    lg: "text-sm px-4 py-1 gap-2 min-w-16"
  }
  KINDS = {
    primary: "text-gray-900 border-gray-200",
    success: "text-white bg-emerald-500",
    critical: "text-white bg-rose-500",
    warning: "text-white bg-amber-500",
    info: "text-white bg-blue-500",
    dark: "text-white bg-gray-900",
    white: "text-gray-900 bg-white"
  }

  attr_reader :size
  attr_reader :kind
  attr_reader :attributes

  def initialize(size: :md, kind: :primary, **attributes)
    @size = size
    @kind = kind
    @attributes = attributes
    @attributes[:class] = construct_classes(@attributes[:class])
  end

  def view_template(&)
    div(**attributes, &)
  end

  private

  def construct_classes(classes)
    TAILWIND_MERGER.merge([ BASE, SIZES[size], KINDS[kind], classes ].compact)
  end
end
