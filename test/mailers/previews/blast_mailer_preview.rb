# Preview all emails at http://localhost:3000/rails/mailers/blast_mailer
class BlastMailerPreview < ActionMailer::Preview

  def email_blast
    blast = Blast.find(params[:blast]) || Blast.first
    BlastMailer.email_blast(blast, preview: true)
  end

end
