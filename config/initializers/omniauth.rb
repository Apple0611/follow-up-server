Rails.application.config.middleware.use OmniAuth::Builder do
  provider :identity,
    fields: [:email],
    on_registration: IdentitiesController.action(:new),
    on_failed_registration: IdentitiesController.action(:new)
end
