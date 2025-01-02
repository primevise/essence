# frozen_string_literal: true

class Essence::Tabs < Essence::Essence
  BASE = "rounded-lg overflow-hidden"
  TAB_BASE = "inline-flex items-center justify-center w-fit rounded-xs border border-transparent font-medium transition duration-150 cursor-pointer disabled:opacity-50 disabled:cursor-not-allowed hover:opacity-90 text-xs px-3 py-2 gap-1.5 text-gray-900 bg-transparent hover:bg-gray-200 hover:text-gray-800"
  TAB_LIST_BASE = "flex items-center gap-2 py-2 border-b"
  PANEL_BASE = "aria-hidden:hidden p-4"

  attr_reader :attributes

  def initialize(**attributes)
    super(**attributes)
    @attributes[:class] = merge_classes([ BASE, @attributes[:class] ])
  end

  def view_template(&)
    div(**attributes, &)
  end

  def menu(**mattributes, &)
    mattributes[:class] = merge_classes([ TAB_LIST_BASE, mattributes[:class] ])

    div(**mattributes, &)
  end

  def tab(key: :general, **mattributes, &)
    mattributes[:id] = "tab-#{key}"
    mattributes[:class] = merge_classes([ TAB_BASE, mattributes[:class] ])
    mattributes[:data] = {
      essence__tabs_target: "tab",
      essence__tabs_panel_id_param: "panel-#{key}",
      action: "essence--tabs#setActiveTab keydown.left->essence--tabs#previous keydown.right->essence--tabs#next"
    }

    button(**mattributes, &)
  end

  def panel(key: :general, **mattributes, &)
    mattributes[:id] = "panel-#{key}"
    mattributes[:class] = merge_classes([ PANEL_BASE, mattributes[:class] ])
    mattributes[:data] = {
      essence__tabs_target: "panel"
    }

    div(**mattributes, &)
  end

  private

  def default_attributes
    {
      data: {
        controller: "essence--tabs",
        essence__tabs_active_value: "panel-general"
      }
    }
  end
end
