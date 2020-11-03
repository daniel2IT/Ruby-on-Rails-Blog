class Post < ApplicationRecord
#kiekvienas postas gali tureti daug komentaru(REIKEJO DADETI)
has_many :comments
#Sukursime validacija, ta validacija true automatiskai turi buti iskvieciama
validates :title, presence: true, length: {minimum:5}
end
