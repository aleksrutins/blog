# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `rerun` gem.
# Please instead update this file by running `bin/tapioca gem rerun`.


# This class will watch a directory and alert you of
# new files, modified files, deleted files.
#
# Now uses the Listen gem, but spawns its own thread on top.
# We should probably be accessing the Listen thread directly.
#
# Author: Alex Chaffee
#
# source://rerun//lib/rerun/watcher.rb#13
module Rerun; end

# source://rerun//lib/rerun/glob.rb#6
class Rerun::Glob
  # @return [Glob] a new instance of Glob
  #
  # source://rerun//lib/rerun/glob.rb#11
  def initialize(glob_string); end

  # source://rerun//lib/rerun/glob.rb#70
  def smoosh(chars); end

  # source://rerun//lib/rerun/glob.rb#66
  def to_regexp; end

  # source://rerun//lib/rerun/glob.rb#15
  def to_regexp_string; end
end

# source://rerun//lib/rerun/glob.rb#9
Rerun::Glob::END_OF_STRING = T.let(T.unsafe(nil), String)

# todo
#
# source://rerun//lib/rerun/glob.rb#7
Rerun::Glob::NO_LEADING_DOT = T.let(T.unsafe(nil), String)

# beginning of string or a slash
#
# source://rerun//lib/rerun/glob.rb#8
Rerun::Glob::START_OF_FILENAME = T.let(T.unsafe(nil), String)

# source://rerun//lib/rerun/notification.rb#4
class Rerun::Notification
  include ::Rerun::System

  # @return [Notification] a new instance of Notification
  #
  # source://rerun//lib/rerun/notification.rb#9
  def initialize(title, body, options = T.unsafe(nil)); end

  # source://rerun//lib/rerun/notification.rb#59
  def app_name; end

  # Returns the value of attribute body.
  #
  # source://rerun//lib/rerun/notification.rb#7
  def body; end

  # source://rerun//lib/rerun/notification.rb#15
  def command; end

  # source://rerun//lib/rerun/notification.rb#45
  def command_named(name); end

  # source://rerun//lib/rerun/notification.rb#63
  def icon; end

  # source://rerun//lib/rerun/notification.rb#67
  def icon_dir; end

  # Returns the value of attribute options.
  #
  # source://rerun//lib/rerun/notification.rb#7
  def options; end

  # source://rerun//lib/rerun/notification.rb#52
  def send(background = T.unsafe(nil)); end

  # Returns the value of attribute title.
  #
  # source://rerun//lib/rerun/notification.rb#7
  def title; end

  # source://rerun//lib/rerun/notification.rb#72
  def with_clean_env; end
end

# source://rerun//lib/rerun/options.rb#11
class Rerun::Options
  extend ::Rerun::System

  class << self
    # source://rerun//lib/rerun/options.rb#34
    def parse(args: T.unsafe(nil), config_file: T.unsafe(nil)); end
  end
end

# source://rerun//lib/rerun/options.rb#19
Rerun::Options::DEFAULTS = T.let(T.unsafe(nil), Hash)

# source://rerun//lib/rerun/options.rb#17
Rerun::Options::DEFAULT_DIRS = T.let(T.unsafe(nil), Array)

# If you change the default pattern, please update the README.md file -- the list appears twice therein, which at the time of this comment are lines 17 and 119
#
# source://rerun//lib/rerun/options.rb#16
Rerun::Options::DEFAULT_PATTERN = T.let(T.unsafe(nil), String)

# source://rerun//lib/rerun/runner.rb#5
class Rerun::Runner
  include ::Rerun::System
  include ::Timeout

  # @return [Runner] a new instance of Runner
  #
  # source://rerun//lib/rerun/runner.rb#21
  def initialize(run_command, options = T.unsafe(nil)); end

  # source://rerun//lib/rerun/runner.rb#122
  def app_name; end

  # source://rerun//lib/rerun/runner.rb#216
  def change_message(changes); end

  # @return [Boolean]
  #
  # source://rerun//lib/rerun/runner.rb#106
  def clear?; end

  # source://rerun//lib/rerun/runner.rb#359
  def clear_screen; end

  # source://rerun//lib/rerun/runner.rb#235
  def die; end

  # source://rerun//lib/rerun/runner.rb#98
  def dir; end

  # @return [Boolean]
  #
  # source://rerun//lib/rerun/runner.rb#118
  def exit?; end

  # source://rerun//lib/rerun/runner.rb#133
  def force_polling; end

  # @return [Boolean]
  #
  # source://rerun//lib/rerun/runner.rb#306
  def git_head_changed?; end

  # source://rerun//lib/rerun/runner.rb#241
  def join; end

  # non-blocking stdin reader.
  # returns a 1-char string if a key was pressed; otherwise nil
  #
  # source://rerun//lib/rerun/runner.rb#334
  def key_pressed; end

  # source://rerun//lib/rerun/runner.rb#317
  def notify(title, body, background = T.unsafe(nil)); end

  # source://rerun//lib/rerun/runner.rb#102
  def pattern; end

  # @return [Boolean]
  #
  # source://rerun//lib/rerun/runner.rb#110
  def quiet?; end

  # source://rerun//lib/rerun/runner.rb#312
  def read_git_head; end

  # source://rerun//lib/rerun/runner.rb#71
  def restart(with_signal = T.unsafe(nil)); end

  # source://rerun//lib/rerun/runner.rb#126
  def restart_with_signal(restart_signal); end

  # source://rerun//lib/rerun/runner.rb#212
  def run(command); end

  # @return [Boolean]
  #
  # source://rerun//lib/rerun/runner.rb#245
  def running?; end

  # source://rerun//lib/rerun/runner.rb#323
  def say(msg); end

  # Send the signal to process @pid.
  # If sending the signal fails, the exception will be swallowed
  # (and logged if verbose is true) and this method will return false.
  #
  # source://rerun//lib/rerun/runner.rb#284
  def send_signal(signal); end

  # Send the signal to process @pid and wait for it to die.
  #
  # source://rerun//lib/rerun/runner.rb#252
  def signal_and_wait(signal); end

  # source://rerun//lib/rerun/runner.rb#137
  def start; end

  # source://rerun//lib/rerun/runner.rb#28
  def start_keypress_thread; end

  # todo: test escalation
  #
  # source://rerun//lib/rerun/runner.rb#294
  def stop; end

  # source://rerun//lib/rerun/runner.rb#66
  def stop_keypress_thread; end

  # source://rerun//lib/rerun/runner.rb#327
  def stty(args); end

  # source://rerun//lib/rerun/runner.rb#82
  def toggle_pause; end

  # source://rerun//lib/rerun/runner.rb#94
  def unpause; end

  # @return [Boolean]
  #
  # source://rerun//lib/rerun/runner.rb#114
  def verbose?; end

  # The watcher instance that wait for changes
  #
  # source://rerun//lib/rerun/runner.rb#8
  def watcher; end

  private

  # source://rerun//lib/rerun/runner.rb#365
  def one_char; end

  class << self
    # source://rerun//lib/rerun/runner.rb#10
    def keep_running(cmd, options); end
  end
end

# source://rerun//lib/rerun/system.rb#2
module Rerun::System
  # @return [Boolean]
  #
  # source://rerun//lib/rerun/system.rb#12
  def linux?; end

  # @return [Boolean]
  #
  # source://rerun//lib/rerun/system.rb#4
  def mac?; end

  # @return [Boolean]
  #
  # source://rerun//lib/rerun/system.rb#16
  def rails?; end

  # @return [Boolean]
  #
  # source://rerun//lib/rerun/system.rb#8
  def windows?; end
end

# source://rerun//lib/rerun/watcher.rb#14
class Rerun::Watcher
  # Create a file system watcher. Start it by calling #start.
  #
  # @param options [:directory] the directory to watch (default ".")
  # @param options [:pattern] the glob pattern to search under the watched directory (default "**/*")
  # @param options [:priority] the priority of the watcher thread (default 0)
  # @return [Watcher] a new instance of Watcher
  #
  # source://rerun//lib/rerun/watcher.rb#29
  def initialize(options = T.unsafe(nil), &client_callback); end

  # source://rerun//lib/rerun/watcher.rb#124
  def adapter; end

  # source://rerun//lib/rerun/watcher.rb#130
  def adapter_name; end

  # def self.default_ignore
  #  Listen::Silencer.new(Listen::Listener.new).send :_default_ignore_patterns
  # end
  #
  # source://rerun//lib/rerun/watcher.rb#21
  def directory; end

  # def self.default_ignore
  #  Listen::Silencer.new(Listen::Listener.new).send :_default_ignore_patterns
  # end
  #
  # source://rerun//lib/rerun/watcher.rb#21
  def ignore_dotfiles; end

  # source://rerun//lib/rerun/watcher.rb#86
  def ignoring; end

  # wait for the file watcher to finish
  #
  # source://rerun//lib/rerun/watcher.rb#106
  def join; end

  # def self.default_ignore
  #  Listen::Silencer.new(Listen::Listener.new).send :_default_ignore_patterns
  # end
  #
  # source://rerun//lib/rerun/watcher.rb#21
  def pattern; end

  # source://rerun//lib/rerun/watcher.rb#112
  def pause; end

  # def self.default_ignore
  #  Listen::Silencer.new(Listen::Listener.new).send :_default_ignore_patterns
  # end
  #
  # source://rerun//lib/rerun/watcher.rb#21
  def priority; end

  # @return [Boolean]
  #
  # source://rerun//lib/rerun/watcher.rb#120
  def running?; end

  # source://rerun//lib/rerun/watcher.rb#49
  def sanitize_dirs(dirs); end

  # source://rerun//lib/rerun/watcher.rb#60
  def start; end

  # kill the file watcher thread
  #
  # source://rerun//lib/rerun/watcher.rb#95
  def stop; end

  # source://rerun//lib/rerun/watcher.rb#116
  def unpause; end

  # source://rerun//lib/rerun/watcher.rb#82
  def watching; end
end

# source://rerun//lib/rerun/watcher.rb#15
class Rerun::Watcher::InvalidDirectoryError < ::RuntimeError; end