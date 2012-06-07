module ApplicationHelper
    # Returns the full title on a per-page basis.
    def full_title(page_title)
      base_title = "EduScore"
      if page_title.empty?
        base_title
      else
        "#{base_title} | #{page_title}"
      end
    end
    
    #star button functions
    def star_rating_from_rating( rating , split )
        (rating * split.to_f).round / split.to_f
    end 
    
    def star_button( course_id , rating , button_num , split , disabled )
        rating = 0 if rating.nil?
        p star_rating_from_rating(rating , split)
        checked = ( button_num == star_rating_from_rating( rating , split ) * split )
        options = { :class => "star {split:#{split}}" }
        options[:disabled] = 'disabled' if disabled
        name = ( split == 1  ) ? "star3[#{course_id}]" : "adv1[#{course_id}]"
        radio_button_tag( name , nil , checked , options )
    end
    
    #get the user for each review
    def get_user(users, user_id)
       user_who_wrote_review = Hash.new
       users.each do |user|
          if user.id == user_id
              user_who_wrote_review = user
              break
          end
       end
       return user_who_wrote_review
    end
end
