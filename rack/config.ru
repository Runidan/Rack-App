require_relative 'middleware/runtime'
require_relative 'app'

use Runtime
use AppLogger
run App.new