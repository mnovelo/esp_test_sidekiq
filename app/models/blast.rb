class Blast < ApplicationRecord
  belongs_to :message

  after_create :schedule_blast

  private

    def schedule_blast
      BlastMailer.email_blast(self).deliver_later(wait_until: send_at)
    end
end
