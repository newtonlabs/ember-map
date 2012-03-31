Rails.application.config.generators do |g|
    g.fixture_replacement :factory_girl, :dir => "spec/factories"
    g.test_framework :rspec, :fixture => true
    g.view_specs false

    g.template_engine :haml

end
