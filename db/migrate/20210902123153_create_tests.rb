class CreateTests < ActiveRecord::Migration[6.1]
  def up
    create_table :tests do |t|
      t.string :name

      t.timestamps
    end

    Test
  end

  def down
    drop_table :tests
  end
end
