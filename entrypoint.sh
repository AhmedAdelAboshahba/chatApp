rake db:migrate RAILS_ENV=development 2>/dev/null || rake db:create db:migrate RAILS_ENV=development
rake es:build_index