class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :content, null: false, comment: "コメントの内容"
      t.references :prototype, null: false, foreign_key: true, comment: "コメントはプロトタイプに属している"
      t.references :user, null: false, foreign_key: true, comment: "コメントはユーザーに属している"

      t.timestamps
    end
  end
end
