class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :codenames_settings do |t|
      t.integer :board_width, null: false
      t.integer :board_height, null: false
      t.json :word_list, array: true, null: false
      t.string :first_move, null: false
      t.string :next_move, null: false
      t.integer :revealed, array: true, default: '[]'
    end

    create_table :games do |t|
      t.string :type
      t.bigint :settings_id
      t.timestamps
    end
  end
end
