# config/initializers/cors.rb
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:3002'  # O frontend React estará rodando na porta 3001

    resource '*',
      headers: :any,
      methods: [:get, :post, :patch, :delete, :options]
  end
end
