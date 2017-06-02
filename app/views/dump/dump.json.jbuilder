
json.array!(@products) do |product|

  category_labels = get_category_labels
  category_scores = product.scores.last.get_category_array
  capability_labels = get_capability_labels
  capability_score = product.scores.last.get_capability_array

  json.set! :productInfo do 
    json.name product.name
    json.type product.product_type
    product.tags.each do |tag|
      json.set! tag.key, tag.value
    end
  end

  json.set! :categories do 
    category_labels.each_with_index do |category,index|
      json.set! category, category_scores[index]
    end
  end

  json.set! :capabilities do 
    capability_labels.each_with_index do |capability,index|
      json.set! capability, capability_score[index]
    end
  end

  json.cloudScore product.scores.last.total

end