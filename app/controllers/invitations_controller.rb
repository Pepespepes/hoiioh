class InvitationsController < ApplicationController

  def accept
    @invitation = Invitation.find(params[:id])
    @invitation.update(status: 'confirmed')
    @chatroom = Chatroom.find(@invitation.chatroom_id)
    redirect_to chatroom_path(@chatroom), notice: 'Invitation accepted, start chatting!'
  end

  def decline
    @invitation = Invitation.find(params[:id])
    @invitation.update(status: 'declined')
    @invitation.chatroom.update(active: false)
    redirect_to profile_path, notice: 'You have declined the invitation to start chatting.'
  end
end
