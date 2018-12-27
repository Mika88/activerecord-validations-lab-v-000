class Post < ActiveRecord::Base
  @clickbait_arr = ["Won't Believe", "Secret", "Top", "Guess"]
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait

  def clickbait
    if title
      @clickbait_arr.any?{|word| title.include?(word)}
    end
  end
end
