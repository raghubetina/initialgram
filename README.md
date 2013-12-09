# Initialgram

In this app, we'll put together all the things we've learned to create a service where users can upload pictures, follow other users to see their pictures, comment on pictures, and favorite pictures.

Topics covered include:

 - File uploads with CarrierWave
 - Authentication and authorization with Devise
 - Customizing Bootstrap with Less
 - Advanced model associations
 - Customizing variable route segment parameters

## Devise Helpers

### Named routes

 - `new_user_registration_path`
 - `edit_user_registration_path`
 - `new_user_session_path`
 - `destroy_user_session_path` (HTTP Verb 'DELETE')

### Bread and butter helper methods

 - `user_signed_in?`
 - `current_user`

### Predefined filter method

 - `authenticate_user!` to require that someone (anyone) be signed in
 - Most of the time, you still have to define your own.

### If necessary, direct cookie access

 - `user_session`

## Authorization

 - Make it so that users cannot modify or destroy other users
 - Make it so that users cannot modify or destroy other users' pictures
 - Make it so that users cannot create, modify or destroy other users' follows

## Miscellaneous

 - A user's home feed should be the pictures#index action. Their show page should be their own pictures only.
 - A user should be able to follow/unfollow another user by clicking a link on the other user's show page.
 - A user should not be able to follow another user twice.
 - What are some ways we could mix in a user's own pictures into the home feed?







