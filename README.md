# README

## Run locally

1. `bundle install`
2. `rake db:create`
3. `rake db:migrate`
4. Make sure Redis and Postgres are running locally
5. `rails s`
6. In a new terminal, `bundle exec sidekiq -q default -q mailers`
7. Open a browser window to [http://lvh.me:3000](http://lvh.me:3000)
8. Create a new school
9. Click the `Open Site` link
10. Create at least one parent and one student (Currently, there isn't a link between them)
11. Create an email template (rich text options work, but attachments currently do not)
12. Create an email blast
13. Click `Render` to view the email that was sent (it wasn't really)

## Notes

### Apartment Gem Replacement

The maintainers of Apartment seem to have [abandoned the project](https://github.com/influitive/apartment/issues/636). To be able to use Rails 6, [ros-apartment](https://github.com/rails-on-services/apartment) seems to work as a good replacement. My reasoning for insisting on Rails 6 instead of 5.2 is so that I could make use of ActionText that simplifies support for a rich-text editor using Trix. Having such an editor, gives users greater control in styling the emails they send out including the ability to add attachments and for us to create a `@mentions` feature.

### Custom locator for GlobalID::Locator

Since Apartment doesn't support Rails 6, neither does apartment-activejob, so I had to find a way to "easily" and consistently include a reference to the tenant so that I could access the correct schema. Knowing that this would be an issue outside of ActiveJob too, I opted to add a custom locator to GlobalID::Locator and to override the `to_gid` methods in the ApplicationRecord so that the generated global id for a record contains the tenant identifier, i.e. the URI for the global id would be `gid://esp-test-sidekiq/Message/1?tenant=knock-knock` with the tenant as a query param. Now when records are serialized and deserialized for ActiveJob, the custom locator will use that param to switch tenants. This solution assumes that records remain in their respective tenants and that the majority of work is done within a single tenant. Working on data from multiple tenants simultaneously might create confusion regarding which tenant is currently active.
