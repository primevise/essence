class Essence::Essence < Phlex::HTML
  TAILWIND_MERGER = ::TailwindMerge::Merger.new.freeze unless defined?(TAILWIND_MERGER)

  attr_reader :attributes

  def initialize(**attributes)
    @attributes = default_attributes.deep_merge(attributes)
    @attributes[:class] = initialize_merged_classes
  end

  private

  def default_attributes = {}
  def merge_classes(*classes) = TAILWIND_MERGER.merge([ *classes ].compact)
  def initialize_merged_classes = ""
end
