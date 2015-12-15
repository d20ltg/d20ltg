module ExpansionsHelper

  def get_hide_expac_button(expansion)
    @button = expansion.hidden? ? button_to("Unhide", unhide_expansion_path(expansion), :method => :put) 
              : button_to("Hide", hide_expansion_path(expansion), :method => :put, :confirm => "Are you sure you want to hide this expansion?")
  end
end
