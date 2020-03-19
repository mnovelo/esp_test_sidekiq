class BlastMailer < ApplicationMailer

  def email_blast(blast, preview: false)
    @blast = blast
    @message = @blast.message
    emails = @blast.recipients.map(&:classify).map(&:constantize).flat_map(&:all).map(&:email)
    mail(to: emails, subject: @message.title)

    return if preview

    blast.increment(:delivery_attempts)
    blast.save
  end
end
