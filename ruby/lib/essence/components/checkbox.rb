# frozen_string_literal: true

class Essence::Checkbox < Essence::Essence
  BASE = "appearance-none size-3.5 cursor-pointer transition duration-100 rounded-xs border border-gray-300 focus:ring-0 checked:border-indigo-600 checked:bg-indigo-500 indeterminate:border-indigo-600 indeterminate:bg-indigo-500 focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600 disabled:border-gray-300 disabled:bg-gray-100 disabled:checked:bg-gray-100 forced-colors:appearance-auto"

  attr_reader :attributes

  def initialize(**attributes)
    super(**attributes)
    @attributes[:class] = merge_classes(BASE, attributes[:class])
  end

  def view_template
    attributes[:type] = :checkbox
    input(**attributes)
  end
end
