class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait


  def clickbait 
    if !title.include?("Won't Believe") || !title.include?("Secret") || !title.include?("Top") || !title.include?("Guess")
      errors.add(:non_clickbait, "non clickbait-y title")
    end
  end
end
