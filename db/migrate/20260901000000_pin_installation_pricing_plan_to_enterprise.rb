class PinInstallationPricingPlanToEnterprise < ActiveRecord::Migration[7.1]
  def up
    # This fork no longer syncs the pricing plan from Chatwoot Hub; it runs as
    # self-hosted enterprise permanently. Pin the plan so the daily
    # ReconcilePlanConfigService stops resetting branding and premium features.
    InstallationConfig.find_or_initialize_by(name: 'INSTALLATION_PRICING_PLAN').update!(value: 'enterprise')
    InstallationConfig.find_or_initialize_by(name: 'INSTALLATION_PRICING_PLAN_QUANTITY').update!(value: 1_000_000)
    GlobalConfig.clear_cache
  end
end
