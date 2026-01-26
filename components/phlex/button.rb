# frozen_string_literal: true

class Components::Button < Components::Essence
  attr_reader :color, :size, :icon

  def initialize(color: :primary, size: :md, icon: nil, **attributes)
    @color = color
    @size = size
    @icon = icon
    super(**attributes)
  end

  def view_template(&)
    tag(attributes[:href] ? :a : :button, **attributes) do
      icon { @icon } unless @icon.nil?
      yield if block_given?
    end
  end

  def icon(**mattributes, &block)
    mattributes[:class] = merge_classes([ component_classes[:icon][:_], component_classes[:icon][:size][size], mattributes[:class] ])
    renderable = block&.call
    renderable = renderable.new(**mattributes) if renderable&.respond_to?(:new)
    render renderable
  end

  private

  def component_classes
    {
      _: {
        _: "inline-flex items-center justify-center w-fit rounded-xs border border-transparent font-medium transition duration-150 cursor-pointer disabled:opacity-50 disabled:cursor-not-allowed hover:opacity-90",
        size: {
          none: "",
          xs: "text-[0.6rem] px-2 py-1.5 gap-1",
          sm: "text-xs px-3 py-2 gap-1.5",
          md: "text-sm px-4 py-2 gap-2",
          lg: "text-base px-6 py-2.5 gap-2.5",
          xl: "text-base px-8 py-3 gap-3"
        },
        color: {
          primary: "text-white bg-indigo-500 hover:bg-indigo-500",
          secondary: "text-gray-700 bg-gray-100 hover:bg-gray-200",
          critical: "text-white bg-rose-500 hover:bg-rose-400",
          warning: "text-white bg-amber-500 hover:bg-amber-400",
          success: "text-white bg-emerald-500 hover:bg-emerald-400",
          info: "text-white bg-blue-500 hover:bg-blue-400",
          dark: "text-white bg-gray-900 hover:bg-gray-800",
          white: "text-gray-900 bg-white hover:bg-gray-200",
          ghost: "text-gray-900 hover:bg-gray-200 hover:text-gray-800"
        }
      },
      icon: {
        _: "shrink-0 opacity-95",
        size: {
          none: "size-4",
          xs: "size-2",
          sm: "size-3.5",
          md: "size-4",
          lg: "size-4.5",
          xl: "size-5"
        }
      }
    }.freeze
  end
end
