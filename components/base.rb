class Components::Base < Phlex::HTML
  include Components
  include Essence

  TAILWIND_MERGER = ::TailwindMerge::Merger.new.freeze unless defined?(TAILWIND_MERGER)

  attr_reader :attributes

  def initialize(**attributes)
    @attributes = attributes
    @attributes[:class] = TAILWIND_MERGER.merge([self.class::CLASSES, @attributes[:class]]) if @attributes[:class]
  end

  private

  def default_attributes
    {}
  end
end
