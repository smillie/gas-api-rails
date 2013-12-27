class NewMemberSerializer < ActiveModel::Serializer
  attributes :id, :firstname, :lastname, :email, :studentnumber
end
