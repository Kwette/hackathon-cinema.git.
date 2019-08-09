class Recipe
  attr_accessor :name, :description, :prep_time

  def initialize(name, description, prep_time = "undefined")
    @name = name
    @description = description
    @prep_time = prep_time.nil? ? "undefined" : prep_time
  end
end
