class ProfessionalSerializer < ActiveModel::Serializer
  attributes :id, :email, :password, :name, :birth_date, :linkedin, :phone, :professional_title, :experience, :education, :resume, :token
end
