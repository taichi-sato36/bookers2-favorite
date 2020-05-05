class Book < ApplicationRecord
	belongs_to :user


	validates :title, presence: true
	validates :body, presence: true, length: { maximum: 200 }

	has_many :book_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

end

# hoge = User.find(1)
# book = Book.find(1)

#book.favorited_by?(hoge)

#book.favorites.where(user_id: 3).exists?


#favorites

#id | user_id | book_id 
#1 | 1 | 1 |
#2 | 2 | 1 |
#3 | 1 | 2 |

#Favorite.where(user_id: 1)

#Favorite.find(1)
#Favorite.find_by(user_id: 1)