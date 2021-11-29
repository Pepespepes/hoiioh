class ChatroomsController < ApplicationController

  def index
    @current_user_invitations = Invitation.where("inviter_id = ? OR user_id = ?", current_user.id, current_user.id)
    @invitations = @current_user_invitations.reject { |invitation| invitation.inviter_id == invitation.user_id }
    @invitations.reject! { |invitation| invitation.status == 'declined' }
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @invitation = current_user.invitations.where(chatroom: params[:id])[0] unless current_user.invitations.nil?
    if @invitation.nil? || @invitation.status != 'confirmed'
      redirect_to details_path, alert: 'Sorry, you do not have access to the chatroom.'
    else
      @message = Message.new
    end
  end

  def create
    @chatroom = Chatroom.new
    @chatroom.active= true
    @invitation1 = Invitation.new(status: 'confirmed')
    @invitation1.user = current_user
    @invitation1.inviter = current_user
    @invitation1.chatroom = @chatroom
    redirect_to details_path unless @invitation1.save

    @invitee = User.find(params[:user_id]) #this assumes you're on a users page
    @invitation2 = Invitation.new(status: 'unconfirmed')
    @invitation2.user = @invitee
    @invitation2.inviter = current_user
    @invitation2.chatroom = @chatroom

    if @invitation1.save && @invitation2.save && @chatroom.save
      redirect_to chatroom_path(@chatroom), notice: "You are now able to use the chatroom."
    else
      redirect_to profile_path, alert: "Oh no, an error has occured, you need to try again!"
    end
  end

  def end_chatroom
    @chatroom = Chatroom.find(params[:id])
    @chatroom.update(active: false)
    @chatroom_invitations = Invitation.where(chatroom_id: params[:id].to_i)
    @users_unconfirmed = @chatroom_invitations.where(status: 'unconfirmed')
    @users_declined = @chatroom_invitations.where(status: 'declined')

    if @chatroom_invitations.all? { |invitation| invitation.status == 'confirmed' }
      redirect_to chatroom_path, notice: 'Chat has started'
    else
      @current_users_unconfirmed.update(status: 'declined')
      redirect_to profile_path, notice: 'The other user declined your invitation'
    end
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:active)
  end
end
