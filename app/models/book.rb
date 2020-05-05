class Book < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy

	validates :title, :body, presence: true
	validates :body, length: {maximum:200}

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	def favorites_count
		self.favorites.count.to_s
	end

end
