class AddAvatarColumnsToProducts < ActiveRecord::Migration[7.0]
  def change
    def up
      add_attachment :products, :avatar
    end
  
    def down
      remove_attachment :products, :avatar
    end
  end
end
