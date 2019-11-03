module Response

  def json_response(data, status = :ok)
    data = { message: 'No data found' } unless data.present?

    if status == :ok
      status = :no_content unless data.present?
      render json: data, status: status
    else
      render json: { errors: data }, status: status
    end
  end

end