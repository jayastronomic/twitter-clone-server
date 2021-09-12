module Api
  module V1
    class UserSerializer < ActiveModel::Serializer
      include Rails.application.routes.url_helpers
      attributes :id, :username, :name, :bio, :location, :website, :logged_in

      def logged_in
        @instance_options[:logged_in]
      end
    end
  end
end

