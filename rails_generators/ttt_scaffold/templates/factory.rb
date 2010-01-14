Factory.sequence :<%= singular_name %>_name do |n|
  "<%= singular_name %>#{n}"
end

Factory.define :<%= singular_name %> do |f|
  f.name                  { Factory.next :<%= singular_name %>_name }
  f.description           { |<%= singular_name %>| "#{<%= singular_name %>.name} description" }
end

