class AddingStartAndFinishTimesToGames < ActiveRecord::Migration
  def change
  	change_table :games do |t|
  	t.datetime :start_time
  	t.datetime :end_time
  	end
  end
end
