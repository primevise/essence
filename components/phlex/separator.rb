# frozen_string_literal: true

class Components::Separator < Components::Essence
  attr_reader :kind

  def initialize(kind: :horizontal, **attributes)
    @kind = kind
    super(**attributes)
  end

  def view_template
    tag(((kind.to_sym == :horizontal) ? :hr : :div), **attributes)
  end

  private

  def component_classes
    {
      _: {
        _: "border-gray-950/5",
        kind: {
          horizontal: "border-t",
          vertical: "border-l h-full"
        }
      }
    }.freeze
  end
end
