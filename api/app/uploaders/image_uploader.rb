class ImageUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # 受取可能な拡張子を指定
  def extension_allowlist
    %w(jpg jpeg png)
  end
end