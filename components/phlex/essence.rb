class Components::Essence < Phlex::HTML
  TAILWIND_MERGER = ::TailwindMerge::Merger.new.freeze unless defined?(TAILWIND_MERGER)

  attr_reader :attributes

  def initialize(**attributes)
    @attributes = m(**attributes)
  end

  private

  def merge_classes(*classes) = TAILWIND_MERGER.merge([ *classes ].compact)
  def initialize_default_attributes = {}

  def component_attributes = {}

  def merged_component_attributes(namespace: nil, modifiers: {}, **attributes)
    return {} unless respond_to?(:component_attributes, true)

    namespace = caller_locations(1, 1)[0].label.split("#")[1]&.to_sym || :_
    namespace = :_ if namespace == :initialize

    defaults = component_attributes[namespace.to_sym] || {}
    defaults[:class] = merged_component_classes(namespace:, modifiers:, extra_classes: attributes[:class])
    return {} if defaults.empty?

    return defaults unless attributes.is_a?(Hash)
    mix(defaults, attributes)
  end

  def merged_component_classes(namespace: :_, modifiers: {}, extra_classes: nil)
    return "" unless respond_to?(:component_classes, true)

    namespaced_component_classes = component_classes[namespace.to_sym]
    return "" if namespaced_component_classes.nil?

    classes = [ namespaced_component_classes[:_] ]

    namespaced_component_classes.each do |key, value|
      next if value.is_a?(Hash) && value.key?(:_)

      modifier = instance_variable_get(:"@#{key}") if instance_variable_defined?(:"@#{key}")
      modifier ||= modifiers[key] if modifiers.is_a?(Hash)
      next unless modifier

      classes << namespaced_component_classes[key][modifier]
    end

    classes << extra_classes if extra_classes.is_a?(String)

    merge_classes(*classes)
  end

  alias_method :m, :merged_component_attributes
  alias_method :mc, :merged_component_classes
end
