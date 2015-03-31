class RegistrationsController < Devise::RegistrationsController
  def create
    super do
      resource.points = 100
      binding.pry
      resource.save
    end
  end
end
