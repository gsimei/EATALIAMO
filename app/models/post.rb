class Post < ApplicationRecord
  belongs_to :user
  scope :highlighted, -> { where(highlight: true) }

  def estimated_reading_time
    # Count the number of words in the post body
    word_count = body.split.size

    # Calculate the reading time in minutes
    # using an average reading speed of 200 words per minute
    (word_count / 200.0).ceil
  end
end
