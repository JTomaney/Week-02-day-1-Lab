class SportsTeam
  def initialize(team_name, roster, coach)
    @team_name = team_name
    @roster = roster
    @coach = coach
    @points = 0
  end

  attr_accessor :team_name, :roster, :coach, :points

  # def get_team_name
  #   return @team_name
  # end
  #
  # def get_roster
  #   return @roster
  # end
  #
  # def get_coach
  #   return @coach
  # end
  #
  # def set_coach(new_coach)
  #   @coach = new_coach
  # end

  def add_player(new_player)
    @roster.push(new_player)
  end

  def find_player(player_search)
    for player in @roster
      return true if player == player_search
    end
    return false
  end

  def update_points(result)
      @points += 3 if result == "win"
  end

  







end
