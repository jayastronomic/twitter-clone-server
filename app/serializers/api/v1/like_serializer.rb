module Api
    module V1
      class LikeSerializer < ActiveModel::Serializer
        attributes :id, :user_id, :created
        belongs_to :tweet

      

        def created
          @instance_options[:created]
        end
  
        
      end
    end
  end
  