# frozen_string_literal: true

class Essence::Label < Essence::Essence
  BASE = "flex text-sm font-medium text-gray-700"
  HELPER_BASE = "text-xs font-normal text-gray-500"
  ASTERISK_BASE = "text-rose-500 font-normal mx-0.5"

  attr_reader :attributes

  def initialize(**attributes)
    super(**attributes)
    @attributes[:class] = merge_classes([ BASE, attributes[:class], !!attributes[:for] ? "cursor-pointer" : "" ])
  end

  def view_template(&)
    label(**@attributes, &)
  end

  def asterisk(**mattributes)
    mattributes[:class] = merge_classes([ ASTERISK_BASE, mattributes[:class] ])
    span(**mattributes) { "*" }
  end

  def helper_text(**mattributes, &)
    mattributes[:class] = merge_classes([ HELPER_BASE, mattributes[:class] ])
    p(**mattributes, &)
  end
end
