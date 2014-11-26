class AddedSkillLevelToGames < ActiveRecord::Migration
  def change
  	add_column :games, :skill_level, :string
  end
end
