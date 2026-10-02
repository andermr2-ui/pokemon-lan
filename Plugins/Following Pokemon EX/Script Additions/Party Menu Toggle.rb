#===============================================================================
# [Following Pokemon EX] Party Menu Toggle
# Adds a "Pasear"/"Alojar" option to the party screen for the party's first
# (currently-following-eligible) Pokemon, and auto-starts following the very
# first time the player ever gets a Pokemon (so new games don't need a
# hand-placed map event). If following was never started yet when this menu
# option or the auto-hook fires, it builds a throwaway invisible event purely
# in memory (not stored on any map file) to satisfy start_following's
# requirement of an event with a real id.
#===============================================================================
module FollowingPkmn
  HELPER_EVENT_ID = 999

  def self.ensure_helper_event
    return nil if !$game_map
    return HELPER_EVENT_ID if $game_map.events[HELPER_EVENT_ID]
    event_data = RPG::Event.new($game_player.x, $game_player.y)
    event_data.id = HELPER_EVENT_ID
    event_data.name = "FollowingPkmnHelper"
    game_event = Game_Event.new($game_map.map_id, event_data, $game_map)
    $game_map.events[HELPER_EVENT_ID] = game_event
    return HELPER_EVENT_ID
  rescue StandardError => e
    $stderr.puts "[FollowingPkmn] ensure_helper_event fallo: #{e.class}: #{e.message}" rescue nil
    return nil
  end

  def self.start_following_anywhere
    return false if FollowingPkmn.get_event
    id = FollowingPkmn.ensure_helper_event
    return false if !id
    FollowingPkmn.start_following(id)
  rescue StandardError => e
    $stderr.puts "[FollowingPkmn] start_following_anywhere fallo: #{e.class}: #{e.message}" rescue nil
    return false
  end
end

MenuHandlers.add(:party_menu, :following_pkmn_walk, {
  "name"      => proc { FollowingPkmn.active? ? _INTL("Stay") : _INTL("Walk") },
  "order"     => 15,
  "condition" => proc { |screen, party, party_idx|
    next false if !defined?(FollowingPkmn) || !FollowingPkmn.can_check?
    next party[party_idx] == FollowingPkmn.get_pokemon
  },
  "effect"    => proc { |screen, party, party_idx|
    if FollowingPkmn.get_event
      FollowingPkmn.toggle
    else
      FollowingPkmn.start_following_anywhere
    end
    screen.scene.pbSetHelpText((party.length > 1) ? _INTL("Elige un Pokémon.") : _INTL("Elige un Pokémon o cancela."))
  }
})

#-------------------------------------------------------------------------------
# Auto-start following the first time the player ever gets a Pokemon, so a
# brand new save doesn't need any manually-placed map event.
#-------------------------------------------------------------------------------
alias __followingpkmn__menutoggle_pbAddPokemon pbAddPokemon unless defined?(__followingpkmn__menutoggle_pbAddPokemon)
def pbAddPokemon(*args)
  ret = __followingpkmn__menutoggle_pbAddPokemon(*args)
  if $player && $player.party && $player.party.length == 1 &&
     defined?(FollowingPkmn) && FollowingPkmn.can_check? && !FollowingPkmn.get_event
    FollowingPkmn.start_following_anywhere
  end
  return ret
end
