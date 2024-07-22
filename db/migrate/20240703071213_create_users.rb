class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, null: false, comment:"`ユーザーのメールアドレス"
      t.string :encrypted_password, null: false, comment:"パスワードは暗号化されています"
      t.string :name, null: false, comment:"ユーザーの名前"
      t.text :profile, null: false, comment:"ユーザープロファイル"
      t.text :occupation, null: false, comment:"ユーザーの職業"
      t.text :position, null: false, comment:"ユーザーの役職"

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
