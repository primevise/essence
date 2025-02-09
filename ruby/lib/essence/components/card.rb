# frozen_string_literal: true

class Essence::Badge < Essence::Essence
  BASE = "p-4 bg-gray-100 rounded-xs"
  TITLE_BASE = "text-2xl font-medium"
  SUBTITLE_BASE = "text-xs uppercase font-medium text-gray-500"

  def initialize(**attributes)
    super(**attributes)
    @attributes[:class] = merge_classes([ BASE, @attributes[:class] ])
  end

  def view_template(&)
    div(**attributes, &)
  end

  def title(**mattributes, &)
    mattributes[:class] = merge_classes([ TITLE_BASE, mattributes[:class] ])
    p(**mattributes, &)
  end

  def subtitle(**mattributes, &)
    mattributes[:class] = merge_classes([ SUBTITLE_BASE, mattributes[:class] ])
    p(**mattributes, &)
  end

  def body(**mattributes, &)
  end
end
