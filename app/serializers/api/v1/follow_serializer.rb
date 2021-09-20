module Api
    module V1
      class FollowSerializer < ActiveModel::Serializer
        attributes :id, :created, :destroyed
        
        def created
            @instance_options[:created]
        end

        def destroyed
            @instance_options[:destroyed]
        end
        
  
        
      end
    end
  end