module VMS
  # Toggle to display or hide player messages. (Set to false to disable)
  SHOW_PLAYER_MESSAGES = true

  # ===========
  # Errors
  # ===========
  # Message displayed when the server is inactive.
  def self.server_inactive_message
    _INTL("The server appears to be inactive...")
  end
  # Message displayed when the player is not connected to the server.
  def self.not_connected_message
    _INTL("You are not currently connected to the server.")
  end
  # Message displayed when the server is using a different game.
  def self.different_game_message
    _INTL("The server you're trying to connect to appears to be running a different game...")
  end
  # Message displayed when the server is using a different version.
  def self.different_version_message
    _INTL("The server you're trying to connect to appears to be running a different version...")
  end
  # Message displayed for a connection issue.
  def self.connection_issue_message
    _INTL("There seems to be a connection issue...\\wtnp[20]")
  end
  # Basic error message.
  def self.basic_error_message
    _INTL("An error has occurred.")
  end
  # ===========
  # General
  # ===========
  # Message displayed when disconnected from the server. (Set to "" to disable)
  def self.disconnected_message
    _INTL("You have been disconnected.")
  end
  # Message displayed upon server disconnection.
  def self.server_disconnect_message
    _INTL("The server has disconnected you...")
  end
  # Message displayed when attempting to connect to a full cluster.
  def self.cluster_full_message
    _INTL("The cluster you're trying to connect to appears to be full...")
  end
  # Message displayed when asking for confirmation to disconnect from the server.
  def self.disconnect_confirmation_message
    _INTL("Are you sure you want to disconnect?")
  end
  # ===========
  # Interaction
  # ===========
  # Message displayed when another player wants to interact. {1} is the name of the player initiating the interaction.
  def self.interact_message
    _INTL("{1} wants to interact with you!\\wtnp[20]")
  end
  # Message displayed when waiting for the player to say something during interaction. {1} is the name of the player waiting.
  def self.interaction_waiting_for_you_message
    _INTL("{1} is patiently waiting for you to say something...")
  end
  # Message displayed during interaction, prompting for a choice.
  def self.interaction_choice
    _INTL("What action do you want to take?")
  end
  # Message displayed when waiting for the player to say something during interaction. {1} is the name of the player waiting.
  def self.interaction_wait_message
    _INTL("Waiting for {1} to say something...")
  end
  # Message displayed when waiting for the player to respond during interaction. {1} is the name of the player waiting.
  def self.interaction_wait_response_message
    _INTL("Waiting for {1}'s response...")
  end
  # Message displayed when waiting for the player to start talking during interaction. {1} is the name of the player waiting.
  def self.interaction_wait_switch_message
    _INTL("Waiting for {1} to start talking...")
  end
  # Message displayed when the other player wants to trade during interaction. {1} is the name of the other player.
  def self.interaction_trade_message
    _INTL("{1} would like to trade with you. \\wt[10]Do you accept?")
  end
  # Message displayed when the other player wants to battle during interaction. {1} is the name of the other player, {2} is the battle type.
  def self.interaction_battle_message
    _INTL("{1} would like to have a {2} with you. \\wt[10]Do you accept?", "{1}", "{2}")
  end
  # Message displayed when selecting a battle type.
  def self.select_battle_type_message
    _INTL("Select a battle type:")
  end
  # Battle type names.
  def self.battle_type_single
    _INTL("Single Battle")
  end
  def self.battle_type_double
    _INTL("Double Battle")
  end
  # Message displayed when selecting a party size.
  def self.select_party_size_message
    _INTL("Select the number of Pokémon to use:")
  end
  # Party size options.
  def self.party_size_3
    _INTL("3 Pokémon")
  end
  def self.party_size_4
    _INTL("4 Pokémon")
  end
  def self.party_size_6
    _INTL("6 Pokémon")
  end
  # Message displayed when a player doesn't have enough Pokémon for the selected size.
  def self.not_enough_pokemon_message
    _INTL("One of the players doesn't have enough Pokémon for this battle size.")
  end
  # ===========
  # Interaction (Errors)
  # ===========
  # Message displayed when the interaction is canceled. {1} is the name of the player canceling the interaction.
  def self.interaction_cancel_message
    _INTL("{1} is no longer interested in interacting with you. What a shame...")
  end
  # Message shown when attempting to interact with someone already interacting with another player. {1} represents the name of the player you are trying to interact with.
  def self.already_interacting_message
    _INTL("{1} is already interacting with someone else.")
  end
  # Message displayed when the other player is busy. {1} is the name of the other player.
  def self.interaction_busy_message
    _INTL("{1} is busy right now.")
  end
  # Message displayed when a player is engaged in a battle. {1} is the name of the other player.
  def self.in_a_battle_message
    _INTL("{1} is currently in a battle.")
  end
  # Message displayed when a player is engaged in a trade. {1} is the name of the other player.
  def self.in_a_trade_message
    _INTL("{1} is currently in a trade.")
  end
  # Message displayed when a player disconnects during an interaction. {1} is the name of the player who disconnected.
  def self.player_disconnect_message
    _INTL("{1} has disconnected...")
  end
  # Message displayed when a player does not respond. {1} is the name of the player who did not respond.
  def self.player_no_response_message
    _INTL("{1} did not respond.")
  end
  # Message displayed when you or the other player are not able to battle.
  def self.interaction_no_battle_message
    _INTL("You or the other player cannot battle.")
  end
  # ===========
  # Trading
  # ===========
  # Message displayed when the player has no tradable Pokémon.
  def self.no_tradable_message
    _INTL("You don't have any tradable Pokémon.")
  end
  # Message displayed when the trade is canceled by the other player. {1} is the name of the player canceling the trade.
  def self.trade_cancel_message
    _INTL("{1} decided not to trade. What a shame...")
  end
  # Message displayed when the other player has no tradable Pokémon. {1} is the name of the other player.
  def self.other_no_tradable_message
    _INTL("{1} doesn't have any tradable Pokémon.")
  end
  # Message displayed when waiting for the other player to confirm a trade. {1} is the name of the player waiting.
  def self.trade_wait_confirm_message
    _INTL("Waiting for {1} to select a Pokémon...")
  end
  # Message displayed when confirming a trade. {1} is the name of the Pokémon you are offering, and {2} is the name of the Pokémon the other player is offering.
  def self.trade_confirmation_message
    _INTL("Are you sure you want to trade {1} for {2}?")
  end
  # Message displayed when waiting for the other player to accept a trade. {1} is the name of the player waiting.
  def self.trade_wait_accept_message
    _INTL("Waiting for {1} to accept.")
  end
  # ===========
  # Swap
  # ===========
  # Message displayed when initiating a swap during interaction. {1} is the name of the player being swapped to.
  def self.swap_initiation_message
    _INTL("You want to interact with {1}!\\wtnp[20]")
  end
  # Message displayed when the other player wants you to talk to them during interaction. {1} is the name of the other player.
  def self.interaction_swap_message
    _INTL("{1} would like to have a conversation with you.\\wtnp[20]")
  end
  # ===========
  # Menu
  # ===========
  # Message displayed for menu choices.
  def self.menu_choices_message
    _INTL("What action do you want to take?")
  end
  # Message displayed when entering a cluster ID in the menu.
  def self.menu_enter_cluster_id_message
    _INTL("Enter the cluster ID:")
  end
  # Message displayed for an invalid cluster ID in the menu.
  def self.menu_invalid_cluster_message
    _INTL("Invalid cluster ID.")
  end
  # Message displayed when a cluster is not found, and a new one is created instead.
  def self.menu_cluster_not_found_message
    _INTL("Cluster not found; a new one will be created.")
  end
  # Message displayed when no clusters are available.
  def self.no_clusters_available_message
    _INTL("There are no clusters currently available. Create a new one?")
  end
  # Message displayed when selecting a cluster to join.
  def self.select_cluster_message
    _INTL("Select a cluster to join:")
  end
  # ===========
  # Multi Battle
  # ===========
  # Title shown above the lobby browser list.
  def self.mb_menu_title
    _INTL("Multibattle Rooms")
  end
  # Label for the "create new lobby" option.
  def self.mb_create_lobby_option
    _INTL("Create New Room")
  end
  # Shown when no lobbies exist; asks if the player wants to create one.
  def self.mb_no_lobbies_message
    _INTL("No multibattle rooms were found. Create a new one?")
  end
  # Prompt asking the player to choose a team.
  def self.mb_select_team_message
    _INTL("Choose your team:")
  end
  # Team and slot label options.
  def self.mb_team_0_slot_0
    _INTL("Team 0 (Slot A)")
  end
  def self.mb_team_0_slot_1
    _INTL("Team 0 (Slot B)")
  end
  def self.mb_team_1_slot_0
    _INTL("Team 1 (Slot A)")
  end
  def self.mb_team_1_slot_1
    _INTL("Team 1 (Slot B)")
  end
  # Shown when the chosen lobby is already full.
  def self.mb_lobby_full_message
    _INTL("That room is already full.")
  end
  # Shown when the lobby wait times out.
  def self.mb_lobby_timeout_message
    _INTL("The room timed out.")
  end
  # Shown while waiting for all players to ready up.
  def self.mb_ready_wait_message
    _INTL("Waiting for all players to be ready...")
  end
  # Shown while waiting for all players to select their Pokémon.
  def self.mb_selection_wait_message
    _INTL("Waiting for all players to select Pokémon...")
  end
  # Shown when auto-reassigned to a different slot. {1} is the new slot label.
  def self.mb_slot_conflict_message
    _INTL("Slot taken — moved to {1}.")
  end
  # Shown when a player disconnects mid-battle. {1} is their name.
  def self.mb_disconnect_battle_message
    _INTL("{1} has disconnected. The battle has ended.")
  end
  # Shown to indicate that you must already be connected to use Multi Battle.
  def self.mb_not_connected_message
    _INTL("You must be connected to a server to use Multibattle.")
  end
  # Prompt asking the player to confirm they are ready.
  def self.mb_ready_confirm_message
    _INTL("Ready to battle?")
  end
  # Shown when a player has no eligible Pokémon for the multibattle.
  def self.mb_no_eligible_pokemon
    _INTL("You don't have enough eligible Pokémon to participate.")
  end
end
