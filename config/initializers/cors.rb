Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://escapelink-fe.vercel.app/' # Adjust this as per your front-end server's address and port

    resource '*',
             headers: :any,
             methods: %i[get post put patch delete options head],
             credentials: true
  end
end
