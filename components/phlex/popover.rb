# frozen_string_literal: true

class Components::Popover < Components::Essence
  INTERACTIONS = {
    click: "click->essence--popover#toggle",
    hover: "mouseenter->essence--popover#open mouseleave->essence--popover#close focus->essence--popover#open blur->essence--popover#close"
  }.freeze

  attr_reader :open, :interaction, :size, :placement, :offset, :shift, :delay

  def initialize(open: false, placement: "top", interaction: :hover, size: :md, offset: nil, shift: nil, delay: nil, **attributes)
    @open = open
    @interaction = interaction
    @size = size
    @placement = placement
    @offset = offset
    @shift = shift
    @delay = delay
    super(**attributes)
  end

  def view_template(&) = div(**attributes, &)
  def trigger(**, &) = div(**m(**), &)
  def content(**, &) = div(**m(**), &)

  private

  def component_attributes
    {
      _: {
        data: {
          controller: "essence--popover",
          "essence--popover-open-value": open.to_s,
          "essence--popover-placement-value": placement.to_s,
          "essence--popover-offset-value": offset&.to_s,
          "essence--popover-shift-value": shift&.to_s,
          "essence--popover-delay-value": delay&.to_s,
          "popover-state": open ? "open" : "closed"
        }
      },
      trigger: {
        data: {
          "essence--popover-target": "trigger",
          action: current_interaction
        }
      },
      content: {
        data: {
          "essence--popover-target": "content",
          action: current_interaction
        }
      }
    }.freeze
  end

  def component_classes
    {
      _: {
        _: "group"
      },
      trigger: {
        _: "inline-flex"
      },
      content: {
        _: "absolute top-0 left-0 group-data-[popover-state='closed']:hidden group-data-[popover-state='open']:inline-flex rounded-sm border border-gray-950/5 shadow-xs p-2.5 bg-white",

        size: {
          none: "",
          sm: "w-48",
          md: "w-64",
          lg: "w-96"
        }
      }
    }.freeze
  end

  def current_interaction = @current_interaction ||= INTERACTIONS[interaction]
end
