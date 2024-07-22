# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strict
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/rackup/all/rackup.rbi
#
# rackup-2.1.0

module Rackup
end
module Rackup::Handler
  def self.[](name); end
  def self.default; end
  def self.get(name); end
  def self.pick(server_names); end
  def self.register(name, klass); end
  def self.require_handler(prefix, const_name); end
end
class Rackup::Server
  def app; end
  def build_app(app); end
  def build_app_and_options_from_config; end
  def build_app_from_string; end
  def check_pid!; end
  def daemonize_app; end
  def default_options; end
  def exit_with_pid(pid); end
  def handle_profiling(heapfile, profile_mode, filename); end
  def initialize(options = nil); end
  def make_profile_name(filename); end
  def middleware; end
  def opt_parser; end
  def options; end
  def options=(arg0); end
  def parse_options(args); end
  def self.default_middleware_by_environment; end
  def self.logging_middleware; end
  def self.middleware; end
  def self.start(options = nil); end
  def server; end
  def start(&block); end
  def wrapped_app; end
  def write_pid; end
end
class Rackup::Server::Options
  def handler_opts(options); end
  def parse!(args); end
end
class Rackup::Stream
  def <<(buffer); end
  def close(error = nil); end
  def close_read; end
  def close_write; end
  def closed?; end
  def empty?; end
  def flush; end
  def initialize(input = nil, output = nil); end
  def input; end
  def output; end
  def read_next; end
  def write(buffer); end
  def write_nonblock(buffer); end
  include Rackup::Stream::Reader
end
module Rackup::Stream::Reader
  def each; end
  def gets; end
  def read(length = nil, buffer = nil); end
  def read_nonblock(length, buffer = nil); end
  def read_partial(length = nil); end
end
class Rackup::Handler::WEBrick < WEBrick::HTTPServlet::AbstractServlet
  def initialize(server, app); end
  def self.run(app, **options); end
  def self.shutdown; end
  def self.valid_options; end
  def service(req, res); end
end
class Rackup::Handler::WEBrick::Input
  def close; end
  def initialize(request); end
  def read_next; end
  include Rackup::Stream::Reader
end
class Rackup::Handler::CGI
  def self.run(app, **options); end
  def self.send_body(body); end
  def self.send_headers(status, headers); end
  def self.serve(app); end
  include Rack
end