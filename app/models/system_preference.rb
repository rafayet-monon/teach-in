class SystemPreference < ApplicationRecord
  after_commit :remove_cache

  def self.[](key)
    return nil if key.nil?

    preference = Rails.cache.fetch("preference_key_#{key.to_s.downcase.parameterize(separator: '_')}", expires_in: 30.days) do
      find_by(key: key)&.value
    end

    return preference if preference.present?

    preference = create(key: key, value: ENV[key.to_s].presence) if ENV[key.to_s].present?

    return preference&.value
  end

  def self.[]=(key, value)
    pref = find_or_initialize_by(key: key)
    pref.value = value
    pref.save

    self[key]
  end

  def self.clear!
    delete_all
  end

  def self.fetch(key, fallback = nil, force_assign = true)
    return (self[key] ||= fallback.respond_to?(:call) ? fallback.call : fallback) if fallback && force_assign

    self[key] || fallback
  end

  def remove_cache
    Rails.cache.delete("preference_key_#{self.key.downcase.parameterize(separator: '_')}") if self.key.present?
  end
end
