class AddIntroductionToPost < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :introduction, :string
  end
end
