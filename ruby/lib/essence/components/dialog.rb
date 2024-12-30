# frozen_string_literal: true

class Essence::Dialog < Essence::Essence
  BASE = ""

  attr_reader :attributes

  def initialize(**attributes)
    super(**attributes)
    @attributes[:class] = merge_classes([ BASE, @attributes[:class]])
  end

  def view_template(&)
    dialog(**attributes) do
      yield if block_given?
    end
  end

  def footer(&)
  end
end
