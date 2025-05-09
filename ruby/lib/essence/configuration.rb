module Essence
  class Configuration
    attr_accessor :licence_key
    attr_accessor :phlex_components_path
    attr_accessor :stimulus_controller_path

    attr_reader :phlex_components_dir
    attr_reader :stimulus_controller_dir

    def initialize
      @licence_key = nil
      @phlex_components_path = "app/components"
      @stimulus_controllers_path = "app/javascript/controllers/essence"

      @phlex_components_dir = Pathname.new(File.expand_path(Dir.pwd)).join(@phlex_components_path)
      @stimulus_controllers_dir = Pathname.new(File.expand_path(Dir.pwd)).join(@stimulus_controllers_path)
    end
  end
end
