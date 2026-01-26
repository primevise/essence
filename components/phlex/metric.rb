# frozen_string_literal: true

class Components::Metric < Components::Essence
  attr_reader :kind

  def initialize(kind: :primary, **attributes)
    @kind = kind
    super(**attributes)
  end

  def view_template(&)
    div(**attributes, &)
  end

  def title(**mattributes, &)
    mattributes[:class] = merged_component_classes(namespace: :title, extra_classes: mattributes[:class])
    h5(**mattributes, &)
  end

  def helper(**mattributes, &)
    mattributes[:class] = merged_component_classes(namespace: :helper, extra_classes: mattributes[:class])
    p(**mattributes, &)
  end

  def body(**mattributes, &)
    mattributes[:class] = merged_component_classes(namespace: :body, extra_classes: mattributes[:class])
    p(**mattributes, &)
  end

  private

  def component_classes
    {
      _: {
        _: "p-4 border rounded-xs",
        kind: {
          primary: "border-gray-950/10 bg-white",
          secondary: "border-transparent bg-gray-100"
        }
      },
      title: {
        _: "text-2xl text-gray-900 font-medium"
      },
      helper: {
        _: "text-xs uppercase font-medium text-gray-500"
      },
      body: {
        _: "text-sm text-gray-700"
      }
    }.freeze
  end
end
