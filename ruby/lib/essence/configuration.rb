module Essence
  class Configuration
    attr_accessor :licence_key
    attr_accessor :phlex_components_path
    attr_accessor :stimulus_controller_path

    def initialize
      @licence_key = nil
      @phlex_components_path = "app/components"
      @stimulus_controller_path = "app/javascript/controllers/essence"
    end
  end
end
