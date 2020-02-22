class AddressesController < ApplicationController
 before_action :set_address,only: [:show, :edit, :update]

 def show
 end

 def edit
 end

 def update
  if @address.update(address_params)
   redirect_to address_path(current_user.id)
  else 
   redirect_to edit_address_path(current_user.id)
  end
 end

private

 def set_address
  @address = Address.find_by(user_id: current_user.id)
 end

 def address_params
  params.require(:address).permit(:post_code, :prefectures, :town, :address_num, :apartment_info, :phone_num).merge(user_id: current_user.id)
 end

end