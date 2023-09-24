# frozen_string_literal: true

module Authentication
  extend ActiveSupport::Concern

  SECRET = Rails.application.credentials.jwt.secret
  ALGORITHM = Rails.application.credentials.jwt.algorithm

  def generate_jwt_token(payload)
    JWT.encode(payload, SECRET, ALGORITHM)
  end

  def decode_jwt_token
    token_auth = request.headers['Authorization']

    return {} unless token_auth

    begin
      JWT.decode(token_auth, SECRET, true, algorithm: ALGORITHM)[0]
    rescue JWT::DecodeError
      {}
    end
  end

  def authorized_resource(params)
    return if params.empty?

    @result ||= Object.const_get(params[:class_name.to_s].capitalize).find(params[:id.to_s])

    @result
  end

  def authorize
    auth = authorized_resource(decode_jwt_token)

    head :unauthorized unless auth
  end
end
