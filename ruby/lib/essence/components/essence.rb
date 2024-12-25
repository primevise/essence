class Essence::Essence < Phlex::HTML
  extend Phlex::Kit

  TAILWIND_MERGER = ::TailwindMerge::Merger.new.freeze unless defined?(TAILWIND_MERGER)

  attr_reader :attributes

  def initialize(**attributes)
    @attributes = default_attributes.merge(attributes)
    @attributes[:class] = merge_classes([self.class::BASE, @attributes[:class])
  end

  private

  def merge_classes(*classes)
    TAILWIND_MERGER.merge(classes.compact)
  end

  def default_attributes
    {}
  end
end
