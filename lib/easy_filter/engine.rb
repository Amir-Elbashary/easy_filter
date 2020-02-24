module EasyFilter
  class Engine < ::Rails::Engine
    engine_name "easy_filter"
    isolate_namespace EasyFilter

    config.to_prepare do
      Dir.glob(Rails.root + "app/overrides/**/*_override*.rb").each do |c|
        require_dependency(c)
      end
    end
  end
end
