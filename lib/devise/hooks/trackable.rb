# After each sign in, update sign in time, sign in count and sign in IP.
# This is only triggered when the user is explicitly set (with set_user)
# and on authentication. Retrieving the user from session (:fetch) does
# not trigger it.
Warden::Manager.after_set_user :except => :fetch do |record, warden, options|
  if record.respond_to?(:update_tracked_fields!) && warden.authenticated?(options[:scope])
    record.update_tracked_fields!(warden.request)
  end
end
Warden::Manager.before_logout do |record, warden, scope|
  if record.respond_to?(:update_tracked_sign_out_time_field!) && warden.authenticated?(scope)
    record.update_tracked_sign_out_time_field!(warden.request)
  end
end
