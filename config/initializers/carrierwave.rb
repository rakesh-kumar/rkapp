CarrierWave.configure do |config|
  # config.fog_credentials = {
  #   :provider               => 'AWS',
  #   :aws_access_key_id      => '',
  #   :aws_secret_access_key  => '',
  #   :region                 => 'us-west-2' 
  # }
  # config.fog_directory  = "image-rmaurya"
  if Rails.env.production?
    config.storage = :fog
    config.fog_credentials = {
      :provider               => 'AWS',
      :region                 => "eu-west-1",
      :aws_access_key_id      => ENV["AWS_ACCESS_ID"],
      :aws_secret_access_key  => ENV["AWS_ACCESS_SECRET"]
    }
    config.fog_directory  = ENV["AWS_BUCKET"]
    config.fog_public     = true
    config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
  else
    config.storage = :file
  end

  config.enable_processing = !Rails.env.test?
  
end

# image-rmaurya.s3-website-us-west-2.amazonaws.com