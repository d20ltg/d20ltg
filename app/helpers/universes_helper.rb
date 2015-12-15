module UniversesHelper

  def get_hide_button(universe)
    @button = universe.hidden? ? button_to("Unhide", unhide_universe_path(universe), :method => :put) 
              : button_to("Hide", hide_universe_path(universe), :method => :put, :confirm => "Are you sure you want to hide this universe?")
  end
end
