# frozen_string_literal: true

class Essence::Metric < Essence::Essence
  BASE = "p-4 border rounded-xs"
  HELPER_BASE = "text-xs uppercase font-medium text-gray-500"
  TITLE_BASE = "text-2xl text-gray-900 font-medium"
  BODY_BASE = "text-sm text-gray-700"

  KINDS = {
    primary: "",
    secondary: "border-transparent bg-gray-100"
  }

  attr_reader :kind

  def initialize(kind: :primary, **attributes)
    @kind = kind
    super(**attributes)
    @attributes[:class] = merge_classes([ BASE, KINDS[kind], @attributes[:class] ])
  end

  def view_template(&)
    div(**attributes, &)
  end

  def title(**mattributes, &)
    mattributes[:class] = merge_classes([ TITLE_BASE, mattributes[:class] ])
    h5(**mattributes, &)
  end

  def helper(**mattributes, &)
    mattributes[:class] = merge_classes([ HELPER_BASE, mattributes[:class] ])
    p(**mattributes, &)
  end

  def body(**mattributes, &)
    mattributes[:class] = merge_classes([ BODY_BASE, mattributes[:class] ])
    p(**mattributes, &)
  end
end
