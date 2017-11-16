pkg_name=victorbot
pkg_origin=emachnic
pkg_version=0.0.3
pkg_scaffolding=core/scaffolding-ruby

pkg_exports=(
  [port]=app.port
)

pkg_exposes=(port)

declare -A scaffolding_env

scaffolding_ruby_pkg=core/ruby/2.4.2
scaffolding_env[SLACK_API_TOKEN]="{{cfg.slack_api_token}}"
scaffolding_env[VICTOROPS_API_ID]="{{cfg.victorops_api_id}}"
scaffolding_env[VICTOROPS_API_KEY]="{{cfg.victorops_api_key}}"
scaffolding_env[VICTOROPS_API_URL]="{{cfg.victorops_api_url}}"
scaffolding_env[VICTOROPS_USER]="{{cfg.victorops_user}}"
scaffolding_env[VICTOROPS_TEAM]="{{cfg.victorops_team}}"
