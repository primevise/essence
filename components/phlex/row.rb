# frozen_string_literal: true

class Components::Row < Components::Essence
  attr_reader :kind

  def initialize(kind: :default, **attributes)
    @kind = kind
    super(**attributes)
  end

  def view_template(&) = div(**attributes, &)
  def item(**, &) = div(**m(**), &)

  private

  def component_classes
    {
      _: {
        _: "flex gap-4",
        kind: {
          default: "flex-col md:flex-row md:items-center md:justify-between",
          center: "flex-col md:flex-row md:items-center md:justify-center",
          start: "flex-col md:flex-row md:items-center md:justify-start",
          end: "flex-col md:flex-row md:items-center md:justify-end"
        }
      },
      item: {
        _: "flex items-center gap-2 flex-wrap"
      }
    }.freeze
  end
end
