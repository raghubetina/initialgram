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

