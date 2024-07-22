class CreatePrototypes < ActiveRecord::Migration[7.0]
  def change
    create_table :prototypes do |t|
      t.string :title, null: false, comment:"プロトタイプのタイトル"
      t.text :catch_copy, null: false, comment:"プロトタイプのキャッチコピー#"
      t.text :concept, null: false, comment:"プロトタイプのコンセプト"
      t.references :user, null:false, foreign_key:true, comment:"プロトタイプのuser_id"
      t.timestamps
    end
  end
end
