# 1. Add Data Action

action :add do
    case new_resource.collection_type 
    when 'dishes'
        mongodb_dishes 'Add Record' do
            # Add Parameters Heres
            action :insert
        end
    when 'leaders'
        # Your Code
    when 'promotions'
        # Your Code
    end
end