property :label, String, default: ''
property :dish_name, String, default: ''

action :insert do
    puts "hahahahahaha #{new_resource.label}"
    script 'Insert Document' do
        interpreter "bash"
        code <<-EOH
            mongo 127.0.0.1/conFusion --eval "var document = { 'label': \'#{new_resource.label}\', 'name': \'#{new_resource.dish_name}\'} ; db.dishes.insert(document);"
          EOH
    end
end