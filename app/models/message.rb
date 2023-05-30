class Message < ApplicationRecord
    validates :content, presence:true
    after_create_commit { broadcast_prepend_to 'messages' }
end
