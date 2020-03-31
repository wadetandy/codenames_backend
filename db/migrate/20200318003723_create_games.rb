class CreateGames < ActiveRecord::Migration[6.0]
  def change
    reversible do |m|
      m.up { execute 'CREATE EXTENSION pgcrypto' }
      m.down { execute 'DROP EXTENSION pgcrypto' }
    end

    create_table :teams do |t|
      t.string :name, null: false
      t.integer :users_count
    end

    create_table :users, id: :uuid do |t|
      t.string :name, null: false
    end

    create_table :team_memberships, id: false do |t|
      t.uuid :user_id, null: false
      t.bigint :team_id, null: false
    end

    create_table :codenames_games_users, id: false do |t|
      t.uuid :codenames_game_id, null: false
      t.uuid :user_id, null: false
    end

    create_table :codenames_games, id: :uuid do |t|
      t.integer :board_width, null: false
      t.integer :board_height, null: false
      t.jsonb :word_list, null: false
      t.string :first_move, null: false
      t.string :next_move, null: false
      t.bigint :red_team_id, null: false
      t.bigint :blue_team_id, null: false
      t.bigint :admin_id, null: false
      t.timestamps
    end
  end
end
