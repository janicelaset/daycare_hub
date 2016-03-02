# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( /map/gmap.js )
Rails.application.config.assets.precompile += %w( js/modernizr-2.6.2-respond-1.1.0.min.js )

Rails.application.config.assets.precompile += %w( js/jquery.easing.1.3.js )
Rails.application.config.assets.precompile += %w( js/jquery.isotope.min.js )
Rails.application.config.assets.precompile += %w( js/jquery.nicescroll.min.js )
Rails.application.config.assets.precompile += %w( js/fancybox/jquery.fancybox.pack.js )
Rails.application.config.assets.precompile += %w( js/skrollr.min.js )
Rails.application.config.assets.precompile += %w( js/jquery.scrollTo-1.4.3.1-min.js )
Rails.application.config.assets.precompile += %w( js/jquery.localscroll-1.2.7-min.js )
Rails.application.config.assets.precompile += %w( js/stellar.js )
Rails.application.config.assets.precompile += %w( js/jquery.appear.js )
Rails.application.config.assets.precompile += %w( js/validate.js )
Rails.application.config.assets.precompile += %w( js/main.js )
