class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    #Mes sukurem nauja table susijusi su :posts
    #Ir joje bus 2 laukai, 1 tai string su vardu title ir tures tipa string itt.
    create_table :posts do |t|
      t.string :title
      t.text :body

      #Standartinis parametras nustatantis laika
      t.timestamps
    end
  end
end
