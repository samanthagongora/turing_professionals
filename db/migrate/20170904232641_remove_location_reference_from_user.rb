class RemoveLocationReferenceFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_reference :users, :location, index: true, foreign_key: true
  end
end
