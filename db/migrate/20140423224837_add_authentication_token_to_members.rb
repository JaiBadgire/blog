class AddAuthenticationTokenToMembers < ActiveRecord::Migration
  #class AddConfirmableToUsers < ActiveRecord::Migration   
    # Note: You can't use change, as User.update_all will fail in the down migration   
    def up     
      add_column :members, :confirmation_token, :string     
      add_column :members, :confirmed_at, :datetime     
      add_column :members, :confirmation_sent_at, :datetime     
      add_column :members, :unconfirmed_email, :string # add it Only if are using reconfirmable 

      add_index :members, :confirmation_token, :unique => true
    end

    def down
      remove_column :members, :confirmation_token, :confirmed_at, :confirmation_sent_at
      # remove_column :users, :unconfirmed_email # Only if using reconfirmable
    end
end
