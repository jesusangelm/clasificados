class AddSectionToClassifieds < ActiveRecord::Migration
  def change
    add_column :classifieds, :section, :string
  end
end
