# frozen_string_literal: true

class Essence::Alert < Essence::Essence
  BASE = "bg-white border border-gray-200 flex flex-col p-3 sm:p-4 rounded-sm"
  TITLE_BASE = "text-gray-900 text-sm sm:text-base font-medium w-full"
  DESCRIPTION_BASE = "text-gray-700 flex text-xs sm:text-sm w-full"
  ICON_BASE = "inline-flex items-center justify-center w-fit size-7 rounded-xs"

  ICON_KINDS = {
    primary: "bg-blue-500 text-white",
    critical: "bg-rose-600 text-white",
    warning: "bg-orange-400 text-gray-900",
    success: "bg-emerald-500 text-white"
  }

  attr_reader :kind
  attr_reader :attributes

  def initialize(kind: :primary, **attributes)
    @kind = kind
    super(**attributes)
    @attributes[:class] = merge_classes([ BASE, attributes[:class] ])
  end

  def view_template(&)
    div(**attributes, &)
  end

  def title(**mattributes, &)
    mattributes[:class] = merge_classes([ TITLE_BASE, mattributes[:class] ])
    h5(**mattributes, &)
  end

  def description(**mattributes, &)
    mattributes[:class] = merge_classes([ DESCRIPTION_BASE, mattributes[:class] ])
    p(**mattributes, &)
  end

  def icon(**mattributes, &)
    mattributes[:class] = merge_classes([ ICON_BASE, ICON_KINDS[kind], mattributes[:class] ])
    div(**mattributes, &)
  end
end
