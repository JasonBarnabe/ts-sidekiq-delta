class SphinxController
  def initialize
    config.searchd.mysql41 = 9307
  end

  def setup
    FileUtils.mkdir_p config.indices_location
    config.render_to_file && index

    config.searchd.mysql41 = 9307
    config.settings['quiet_deltas']      = true
    config.settings['attribute_updates'] = true
  end

  def start
    config.controller.start
  end

  def stop
    config.controller.stop
  end

  def index(*indices)
    config.controller.index *indices
  end

  private

  def config
    ThinkingSphinx::Configuration.instance
  end
end
