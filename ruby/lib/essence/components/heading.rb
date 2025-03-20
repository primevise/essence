class Essence::Heading < Essence::Essence
  ALLOWED_TAGS = [ :h1, :h2, :h3, :h4, :h5, :h6 ]
  ALLOWED_KINDS = [ :default, :display ]

  BASE = "font-medium text-gray-900"
  HEADING_CLASS = {
    h1: "text-4xl lg:text-5xl",
    h2: "text-3xl lg:text-4xl",
    h3: "text-2xl lg:text-3xl",
    h4: "text-xl lg:text-2xl",
    h5: "text-lg lg:text-xl",
    h6: "text-base lg:text-lg"
  }

  attr_reader :as
  attr_reader :kind
  attr_reader :attributes

  def initialize(as: :h1, kind: :default, **attributes)
    super(**attributes)
    @as = ALLOWED_TAGS.include?(as.to_sym) ? as.to_sym : :h1
    @attributes[:class] = merge_classes([ BASE, HEADING_CLASS[as], attributes[:class] ])
  end

  def view_template(&)
    tag(as, **attributes, &)
  end
end
