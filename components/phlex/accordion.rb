# frozen_string_literal: true

class Components::Accordion < Components::Essence
  def initialize(**attributes)
    super(**attributes)
  end

  def view_template(&) = details(**attributes, &)
  def chevron(**) = span(**m(**)) { "›" }
  def content(**, &) = p(**m(**), &)

  def trigger(**, &)
    summary(**m(**)) do
      p(class: "inline", &)
      chevron
    end
  end

  private

  def component_classes
    {
      _: {
        _: "w-full group py-4"
      },
      trigger: {
        _: "cursor-pointer list-none flex items-center justify-between text-base font-medium"
      },
      content: {
        _: "py-2 transform transition-all duration-500 not-open:-mt-4 opacity-0 group-open:opacity-100 group-open:mt-0 text-sm"
      },
      chevron: {
        _: "transform transition-all duration-300 rotate-90 group-open:-rotate-90 text-lg text-gray-700"
      }
    }.freeze
  end
end
