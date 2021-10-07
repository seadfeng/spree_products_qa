module Spree
  module ProductsControllerDecorator
    def self.prepended(base)
      base.helper Spree::ProductsQaHelper
    end

    ::Spree::ProductsController.prepend self if ::Spree::Core::Engine.frontend_available?  
  end
end
