# frozen_string_literal: true

# A switch component that can be toggled on and off.
#
# ==== Examples
#
#    render Switch.new
#
# ==== Documentation
#
# https://essence.primevise.com/components/switch
#
class Essence::Switch < Essence::Essence
  BASE = "relative inline-flex h-6 w-12 shrink-0 cursor-pointer rounded-full border-2 border-transparent bg-gray-200 transition-colors duration-200 ease-in-out focus:ring-2 focus:ring-indigo-200 focus:ring-offset-2 focus:outline-hidden"
  LEVER_BASE = "pointer-events-none inline-block size-5 translate-x-0 transform rounded-full bg-white ring-0 transition duration-200 ease-in-out"

  ACTIVE_CLASSES = "bg-indigo-600"
  INACTIVE_CLASSES = "bg-gray-200"

  ACTIVE_LEVER_CLASSES = "translate-x-6"
  INACTIVE_LEVER_CLASSES = "translate-x-0"

  def initialize(**attributes)
    super(**attributes)
    @attributes[:class] = merge_classes([ BASE, @attributes[:class] ])
  end

  def view_template(&)
    button(**attributes) do
      span(class: "sr-only") { "Use setting" }
      span(
        aria_hidden: "true",
        class: LEVER_BASE,
        data: {
          essence__switch_target: "lever"
        },
      )
      yield if block_given?
    end
  end

  def hidden_input(**mattributes)
    mattributes[:type] = "hidden"
    mattributes[:name] = mattributes[:name] || "enabled"
    mattributes[:value] = mattributes[:value] || false
    mattributes[:data] = { essence__switch_target: "input" }

    input(**mattributes)
  end

  private

  def default_attributes
    {
      type: "button",
      role: "switch",
      aria_checked: false,
      data: {
        controller: "essence--switch",
        action: "click->essence--switch#toggle",
        essence__switch_active_class: ACTIVE_CLASSES,
        essence__switch_inactive_class: INACTIVE_CLASSES,
        essence__switch_active_lever_class: ACTIVE_LEVER_CLASSES,
        essence__switch_inactive_lever_class: INACTIVE_LEVER_CLASSES
      }
    }
  end

end
