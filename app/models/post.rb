class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait

  @clickbait_arr = ["Won't Believe", "Secret", "Top", "Guess"]

  def clickbait

    if title
      @clickbait_arr.any?{|word| title.include?(word)}
    end
  end
end
