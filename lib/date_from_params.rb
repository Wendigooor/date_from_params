require "date_from_params/version"

module DateFromParams
  def date_from_select_date(key, params)
    date_params = params[key]

    begin
      Date.civil(*[:year, :month, :day].map { |k| date_params[k].to_i unless (date_params[k] == nil || date_params[k] == "") })
    rescue
      nil
    end
  end

  def datetime_from_select_datetime(key, params)
    datetime_params = params[key]

    begin
      DateTime.civil(*[:year, :month, :day, :hour, :minute].map { |k| datetime_params[k].to_i unless (datetime_params[k] == nil || datetime_params[k] == "") })
    rescue
      nil
    end
  end

  def date_from_date_select(key, params)
    date_params = params.select { |k,v| k.include?(key.to_s) }

    begin
      Date.civil(*date_params.values.map { |v| v.to_i unless (v == nil || v == "") })
    rescue
      nil
    end
  end

  def datetime_from_datetime_select(key, params)
    datetime_params = params.select { |k,v| k.include?(key.to_s) }

    begin
      DateTime.civil(*datetime_params.values.map { |v| v.to_i unless (v == nil || v == "") })
    rescue
      nil
    end
  end

  extend self
end
