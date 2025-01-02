module Essence
  class Configuration
    attr_accessor :phlex_components_path
    attr_accessor :stimulus_controller_path

    def initialize
      @phlex_components_path = "app/components"
      @stimulus_controller_path = "app/javascript/controllers/essence"
    end
  end
end
