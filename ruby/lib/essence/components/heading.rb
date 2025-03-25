class Essence::Heading < Essence::Essence
  ALLOWED_TAGS = [ :h1, :h2, :h3, :h4, :h5, :h6 ]
  BASE = "font-medium text-gray-900 leading-normal"
  SIZES = {
    xs: "text-base lg:text-lg",
    sm: "text-lg lg:text-xl",
    md: "text-xl lg:text-2xl",
    lg: "text-2xl lg:text-3xl",
    xl: "text-3xl lg:text-4xl",
    "2xl": "text-4xl lg:text-5xl",
    "3xl": "text-5xl lg:text-6xl"
  }

  attr_reader :as
  attr_reader :size
  attr_reader :attributes

  def initialize(as: :h2, size: :xs, **attributes)
    super(**attributes)
    @as = ALLOWED_TAGS.include?(as.to_sym) ? as.to_sym : :h1
    @size = SIZES.keys.include?(size.to_sym) ? size.to_sym : :xs
    @attributes[:class] = merge_classes([ BASE, SIZES[size], attributes[:class] ])
  end

  def view_template(&)
    tag(as, **attributes, &)
  end
end
