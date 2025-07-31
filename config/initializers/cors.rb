Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins ['https://escapelink.vercel.app', 'localhost:3001']
    # origins ['localhost:3001']

    resource '*',
             headers: :any,
             methods: %i[get post put patch delete options head],
             credentials: true
  end
end
