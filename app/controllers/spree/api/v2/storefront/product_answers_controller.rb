module Spree
  module Api
    module V2
      module Storefront
        class ProductAnswersController < ::Spree::Api::V2::BaseController

          def show
            render_serialized_payload { serialize_resource(resource) }
          end

          private

          def scope
            Spree::Answer
          end

          def resource
            scope.find(params[:id])
          end

          def resource_serializer
            Spree::V2::Storefront::AnswerSerializer
          end

        end
      end
    end
  end
end