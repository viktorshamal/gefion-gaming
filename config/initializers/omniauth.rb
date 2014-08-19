OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '280813985423323', 'bf0f33e74973445b419cc954f74aa655', :scope => 'rsvp_event, user_events'
end