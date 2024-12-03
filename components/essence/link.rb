class Components::Essence::Link < Phlex::HTML
  CLASSES = "inline-flex items-center gap-2 bg-pink-500"

  attr_reader :attributes

  def initialize(**attributes)
    @attributes = attributes

    @class = ::TailwindMerge::Merger.new.merge([CLASSES, attributes.delete(:class)])
  end

  def view_template(&)
    a(class: @class, **attributes, &)
  end
end
