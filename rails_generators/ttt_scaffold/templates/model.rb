class <%= class_name %> < ActiveRecord::Base
  attr_accessible <%= attributes.map { |a| ":#{a.name}" }.join(", ") %>

  has_paper_trail
end
