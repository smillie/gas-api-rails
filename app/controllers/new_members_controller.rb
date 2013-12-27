class NewMembersController < ApplicationController  
  def show
    @member = NewMember.find(params[:id])
    render json: @member
  end
  
  def index
    @members = NewMember.all
    render json: @members
  end
  
  def create
    @member_params = params[:new_member]
    @new_member = NewMember.new(firstname: @member_params[:firstname],
                                lastname: @member_params[:lastname],
                                email: @member_params[:email],
                                studentnumber: @member_params[:studentnumber])
    
    if @new_member.save
      render json: @new_member
    else
      render :json => { 
              :error  => "Unable to save new member",
              :reasons => @new_member.errors.full_messages
      }, :status => :bad_request
    end 
  end
  
  def destroy
    if NewMember.find(params[:id])
      NewMember.destroy(params[:id])
      render :json => { 
              :message  => "Member deleted",
      }
    else
      render :json => { 
              :error  => "Unable to delete member",
              :reasons => "Cannot find member"
      }, :status => :not_found
    end
  end
end
