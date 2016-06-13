module MessagesHelper
  def message_delete_link(message)
    if message.user == current_user
      link_to "Delete Message", message, method: :delete, data: { confirm: 'Are you sure?' }
    end
  end
end
