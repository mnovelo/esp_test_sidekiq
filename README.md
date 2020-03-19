# Run locally

1. `bundle install`
2. `rake db:create`
3. `rake db:migrate`
4. Make sure Redis is running locally
5. `rails s`
6. In a new terminal, `bundle exec sidekiq -q default -q mailers`
7. Open a browser window to [http://lvh.me:3000](http://lvh.me:3000)
8. Create a new school
9. Click the `Open Site` link
10. Create at least one parent and one student (Currently, there isn't a link between them)
11. Create an email template (rich text options work, but attachments currently do not)
12. Create an email blast
13. Click `Render` to view the email that was sent (it wasn't really)
