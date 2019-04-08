require('minitest/autorun')
require('minitest/rg')
require_relative('../sports_team')

class TestSportsTeam < MiniTest::Test
  def test_get_team_name
    team = SportsTeam.new("West Ham", ["Mark Noble", "Felipe Anderson", "Manuel Lanzini"], "Manuel Pellegrini")
    assert_equal("West Ham", team.team_name)
  end

  def test_get_roster
    team = SportsTeam.new("West Ham", ["Mark Noble", "Felipe Anderson", "Manuel Lanzini"], "Manuel Pellegrini")
    assert_equal(["Mark Noble", "Felipe Anderson", "Manuel Lanzini"], team.roster)
  end

  def test_get_coach
    team = SportsTeam.new("West Ham", ["Mark Noble", "Felipe Anderson", "Manuel Lanzini"], "Manuel Pellegrini")
    assert_equal("Manuel Pellegrini", team.coach)
  end

  def test_set_coach
    team = SportsTeam.new("West Ham", ["Mark Noble", "Felipe Anderson", "Manuel Lanzini"], "Manuel Pellegrini")
    team.coach = "Sam Allardyce"
    assert_equal("Sam Allardyce", team.coach)
  end

  def test_add_player
    team = SportsTeam.new("West Ham", ["Mark Noble", "Felipe Anderson", "Manuel Lanzini"], "Manuel Pellegrini")
    team.add_player("Boris")
    assert_equal(4, team.roster.count)
  end

  def test_find_player__player_exists
    team = SportsTeam.new("West Ham", ["Mark Noble", "Felipe Anderson", "Manuel Lanzini"], "Manuel Pellegrini")
    result = team.find_player("Mark Noble")
    assert_equal(true, result)
  end

  def test_find_player__player_does_not_exist
    team = SportsTeam.new("West Ham", ["Mark Noble", "Felipe Anderson", "Manuel Lanzini"], "Manuel Pellegrini")
    result = team.find_player("Ranaldo")
    assert_equal(false, result)
  end

  def test_check_points
    team = SportsTeam.new("West Ham", ["Mark Noble", "Felipe Anderson", "Manuel Lanzini"], "Manuel Pellegrini")
    assert_equal(0, team.points)
  end

  def test_update_points__win
    team = SportsTeam.new("West Ham", ["Mark Noble", "Felipe Anderson", "Manuel Lanzini"], "Manuel Pellegrini")
    team.update_points("win")
    assert_equal(3, team.points)
  end

  def test_update_points__loss_or_draw
    team = SportsTeam.new("West Ham", ["Mark Noble", "Felipe Anderson", "Manuel Lanzini"], "Manuel Pellegrini")
    team.update_points("loss")
    assert_equal(0, team.points)
  end

end
