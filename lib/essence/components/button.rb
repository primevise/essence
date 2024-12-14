# frozen_string_literal: true

class Essence::Button < Essence::Component
  BASE = "inline-flex items-center rounded-xs border border-transparent font-medium transition duration-150 cursor-pointer disabled:opacity-50 disabled:cursor-not-allowed hover:opacity-90"

  SIZES = {
    none: "",
    xs: "text-[0.6rem] px-2 py-1.5 gap-1",
    sm: "text-xs px-3 py-2 gap-1.5",
    md: "text-sm px-4 py-2 gap-2",
    lg: "text-base px-6 py-2.5 gap-2.5",
    xl: "text-base px-8 py-3 gap-3"
  }

  KINDS = {
    primary: "text-white bg-indigo-500 hover:bg-indigo-500",
    secondary: "text-gray-700 bg-gray-100 hover:bg-gray-200",
    critical: "text-white bg-rose-500 hover:bg-rose-400",
    warning: "text-white bg-amber-500 hover:bg-amber-400",
    success: "text-white bg-emerald-500 hover:bg-emerald-400",
    info: "text-white bg-blue-500 hover:bg-blue-400",
    dark: "text-white bg-gray-900 hover:bg-gray-800",
    white: "text-gray-900 bg-white hover:bg-gray-200",
    ghost: "text-gray-900 bg-white hover:bg-gray-200 hover:text-gray-800"
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
    element_tag(**attributes, &)
  end

  private

  def element_tag(...)
    attributes[:href] ? a(...) : button(...)
  end

  def construct_classes(classes)
    TAILWIND_MERGER.merge([ BASE, SIZES[size], KINDS[kind], classes ].compact)
  end
end
