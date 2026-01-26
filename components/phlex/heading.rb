# frozen_string_literal: true

class Components::Heading < Components::Essence
  ALLOWED_TAGS = [ :h1, :h2, :h3, :h4, :h5, :h6 ]

  attr_reader :as, :size

  def initialize(as: :h2, size: :xs, **attributes)
    @as = ALLOWED_TAGS.include?(as.to_sym) ? as.to_sym : :h1
    @size = size.to_s
    super(**attributes)
  end

  def view_template(&) = tag(as, **attributes, &)

  private

  def component_classes
    {
      _: {
        _: "font-medium text-gray-900 leading-normal",
        size: {
          "xs" => "text-base lg:text-lg",
          "sm" => "text-lg lg:text-xl",
          "md" => "text-xl lg:text-2xl",
          "lg" => "text-2xl lg:text-3xl",
          "xl" => "text-3xl lg:text-4xl",
          "2xl" => "text-4xl lg:text-5xl",
          "3xl" => "text-5xl lg:text-6xl"
        }
      }
    }.freeze
  end
end
