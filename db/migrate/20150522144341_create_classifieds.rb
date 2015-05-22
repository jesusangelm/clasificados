class CreateClassifieds < ActiveRecord::Migration
  def change
    create_table :classifieds do |t|
      t.text :content

      t.timestamps null: false
    end
  end
end
