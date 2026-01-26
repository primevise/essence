# frozen_string_literal: true

class Components::Label < Components::Essence
  def initialize(**attributes)
    super(**attributes)
  end

  def view_template(&) = label(**attributes, &)
  def asterisk(**) = span(**m(**)) { "*" }
  def helper_text(**, &) = p(**m(**), &)

  private

  def component_classes
    {
      _: {
        _: "flex text-sm font-medium text-gray-700"
      },
      asterisk: {
        _: "text-rose-500 font-normal mx-0.5"
      },
      helper_text: {
        _: "text-xs font-normal text-gray-500"
      }
    }.freeze
  end
end
