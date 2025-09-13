Rails.application.configure do
  config.content_security_policy do |policy|
    policy.default_src :self
    policy.base_uri    :self

    policy.script_src  :self, :https,
      "https://www.googletagmanager.com",
      "https://www.google-analytics.com"

    policy.connect_src :self, :https,
      "https://www.google-analytics.com",
      "https://region1.google-analytics.com"  # GA4 sometimes uses regional

    policy.img_src     :self, :https,
      "https://www.google-analytics.com",
      "data:"

    policy.style_src   :self, :https, "https://cdnjs.cloudflare.com"
    policy.font_src    :self, :https, "https://cdnjs.cloudflare.com", "data:"
    policy.object_src  :none

    # If you want to keep report-only first:
    # (flip to false after it’s clean)
  end

  config.content_security_policy_nonce_generator = ->(_request) { SecureRandom.base64(16) }
  config.content_security_policy_report_only = true
end
