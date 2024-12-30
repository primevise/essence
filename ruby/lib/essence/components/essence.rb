class Essence::Essence < Phlex::HTML
  extend Phlex::Kit

  TAILWIND_MERGER = ::TailwindMerge::Merger.new.freeze unless defined?(TAILWIND_MERGER)

  attr_reader :attributes

  def initialize(**attributes)
    @attributes = default_attributes.deep_merge(attributes)
  end

  private

  def default_attributes = {}
  def merge_classes(*classes) = TAILWIND_MERGER.merge([ *classes ].compact)
end
