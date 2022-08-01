# frozen_string_literal: true

class ImageUploader < Shrine
  Attacher.validate do
    validate_max_size 10 * 1024 * 1024, message: I18n.t('errors.doctor.avatar')
  end

  Attacher.derivatives do |original|
    magick = ImageProcessing::MiniMagick.source(original)

    { medium: magick.resize_to_fit!(200, 200),
      small: magick.resize_to_fit!(60, 60) }
  end

  Attacher.default_url do
    ActionController::Base.helpers.image_url('default_doctor.png')
  end
end
