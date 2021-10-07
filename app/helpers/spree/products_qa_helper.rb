module Spree::ProductsQaHelper
    def faq_structured_data(product)
        content_tag :script, type: 'application/ld+json' do
            raw(
            Rails.cache.fetch(common_product_cache_keys + ["spree/faq-structured-data/#{product.cache_key_with_version}"]) do
                {
                '@context': 'https://schema.org/',
                '@type': 'FAQPage',
                'mainEntity': faqs_hash(product.product_questions.answered.visible), 
                }
            end.to_json
            )
        end
    end 

    private

    def faqs_hash(faqs)
        faqs.map do |faq| 
            faq_hash(faq)
        end
    end
    
    def faq_hash(faq)
        {
            "@type": "Question", 
            "name": faq.content , 
            "acceptedAnswer": {
                "@type": "Answer",
                "text": sanitize(simple_format(faq.product_answer.content), tags: %w(p b i br))
            }
        }
    end  
end