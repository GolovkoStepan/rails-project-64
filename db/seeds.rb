# frozen_string_literal: true

categories = %w[Программирование Музыка Фильмы История Спорт Другое]
categories.each { |name| Category.find_or_create_by!(name:) }
