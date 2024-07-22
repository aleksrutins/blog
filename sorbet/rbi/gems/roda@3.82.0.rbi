# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `roda` gem.
# Please instead update this file by running `bin/tapioca gem roda`.


# The main class for Roda.  Roda is built completely out of plugins, with the
# default plugin being Roda::RodaPlugins::Base, so this class is mostly empty
# except for some constants.
#
# source://roda//lib/roda/cache.rb#5
class Roda
  include ::Roda::RodaPlugins::Base::InstanceMethods
  extend ::Roda::RodaPlugins::Base::ClassMethods
end

# A thread safe cache class, offering only #[] and #[]= methods,
# each protected by a mutex.
#
# source://roda//lib/roda/cache.rb#8
class Roda::RodaCache
  # Create a new thread safe cache.
  #
  # @return [RodaCache] a new instance of RodaCache
  #
  # source://roda//lib/roda/cache.rb#10
  def initialize; end

  # Make getting value from underlying hash thread safe.
  #
  # source://roda//lib/roda/cache.rb#16
  def [](key); end

  # Make setting value in underlying hash thread safe.
  #
  # source://roda//lib/roda/cache.rb#21
  def []=(key, value); end

  # Return the frozen internal hash.  The internal hash can then
  # be accessed directly since it is frozen and there are no
  # thread safety issues.
  #
  # source://roda//lib/roda/cache.rb#28
  def freeze; end

  private

  # Create a copy of the cache with a separate mutex.
  #
  # source://roda//lib/roda/cache.rb#35
  def initialize_copy(other); end
end

# Error class raised by Roda
#
# source://roda//lib/roda.rb#15
class Roda::RodaError < ::StandardError; end

# The major version of Roda, updated only for major changes that are
# likely to require modification to Roda apps.
#
# source://roda//lib/roda/version.rb#4
Roda::RodaMajorVersion = T.let(T.unsafe(nil), Integer)

# The minor version of Roda, updated for new feature releases of Roda.
#
# source://roda//lib/roda/version.rb#7
Roda::RodaMinorVersion = T.let(T.unsafe(nil), Integer)

# The patch version of Roda, updated only for bug fixes from the last
# feature release.
#
# source://roda//lib/roda/version.rb#11
Roda::RodaPatchVersion = T.let(T.unsafe(nil), Integer)

# Module in which all Roda plugins should be stored. Also contains logic for
# registering and loading plugins.
#
# source://roda//lib/roda/request.rb#26
module Roda::RodaPlugins
  class << self
    # Deprecate the constant with the given name in the given module,
    # if the ruby version supports it.
    #
    # source://roda//lib/roda/plugins.rb#45
    def deprecate_constant(mod, name); end

    # If the registered plugin already exists, use it.  Otherwise,
    # require it and return it.  This raises a LoadError if such a
    # plugin doesn't exist, or a RodaError if it exists but it does
    # not register itself correctly.
    #
    # source://roda//lib/roda/plugins.rb#26
    def load_plugin(name); end

    # Register the given plugin with Roda, so that it can be loaded using #plugin
    # with a symbol.  Should be used by plugin files. Example:
    #
    #   Roda::RodaPlugins.register_plugin(:plugin_name, PluginModule)
    #
    # source://roda//lib/roda/plugins.rb#39
    def register_plugin(name, mod); end

    def warn(*msgs, uplevel: T.unsafe(nil), category: T.unsafe(nil)); end
  end
end

# The base plugin for Roda, implementing all default functionality.
# Methods are put into a plugin so future plugins can easily override
# them and call super to get the default behavior.
#
# source://roda//lib/roda/request.rb#27
module Roda::RodaPlugins::Base; end

# Class methods for the Roda class.
#
# source://roda//lib/roda.rb#31
module Roda::RodaPlugins::Base::ClassMethods
  # The rack application that this class uses.
  #
  # source://roda//lib/roda.rb#33
  def app; end

  # Call the internal rack application with the given environment.
  # This allows the class itself to be used as a rack application.
  # However, for performance, it's better to use #app to get direct
  # access to the underlying rack app.
  #
  # source://roda//lib/roda.rb#52
  def call(env); end

  # Clear the middleware stack
  #
  # source://roda//lib/roda.rb#57
  def clear_middleware!; end

  # Define an instance method using the block with the provided name and
  # expected arity.  If the name is given as a Symbol, it is used directly.
  # If the name is given as a String, a unique name will be generated using
  # that string.  The expected arity should be either 0 (no arguments),
  # 1 (single argument), or :any (any number of arguments).
  #
  # If the :check_arity app option is not set to false, Roda will check that
  # the arity of the block matches the expected arity, and compensate for
  # cases where it does not.  If it is set to :warn, Roda will warn in the
  # cases where the arity does not match what is expected.
  #
  # If the expected arity is :any, Roda must perform a dynamic arity check
  # when the method is called, which can hurt performance even in the case
  # where the arity matches.  The :check_dynamic_arity app option can be
  # set to false to turn off the dynamic arity checks.  The
  # :check_dynamic_arity app option can be to :warn to warn if Roda needs
  # to adjust arity dynamically.
  #
  # Roda only checks arity for regular blocks, not lambda blocks, as the
  # fixes Roda uses for regular blocks would not work for lambda blocks.
  #
  # Roda does not support blocks with required keyword arguments if the
  # expected arity is 0 or 1.
  #
  # source://roda//lib/roda.rb#85
  def define_roda_method(meth, expected_arity, &block); end

  # Expand the given path, using the root argument as the base directory.
  #
  # source://roda//lib/roda.rb#183
  def expand_path(path, root = T.unsafe(nil)); end

  # Freeze the internal state of the class, to avoid thread safety issues at runtime.
  # It's optional to call this method, as nothing should be modifying the
  # internal state at runtime anyway, but this makes sure an exception will
  # be raised if you try to modify the internal state after calling this.
  #
  # Note that freezing the class prevents you from subclassing it, mostly because
  # it would cause some plugins to break.
  #
  # source://roda//lib/roda.rb#194
  def freeze; end

  # Rebuild the _roda_before and _roda_after methods whenever a plugin might
  # have added a _roda_before_* or _roda_after_* method.
  #
  # source://roda//lib/roda.rb#234
  def include(*a); end

  # Whether middleware from the current class should be inherited by subclasses.
  # True by default, should be set to false when using a design where the parent
  # class accepts requests and uses run to dispatch the request to a subclass.
  #
  # source://roda//lib/roda.rb#40
  def inherit_middleware; end

  # Whether middleware from the current class should be inherited by subclasses.
  # True by default, should be set to false when using a design where the parent
  # class accepts requests and uses run to dispatch the request to a subclass.
  #
  # source://roda//lib/roda.rb#40
  def inherit_middleware=(_arg0); end

  # When inheriting Roda, copy the shared data into the subclass,
  # and setup the request and response subclasses.
  #
  # @raise [RodaError]
  #
  # source://roda//lib/roda.rb#243
  def inherited(subclass); end

  # The settings/options hash for the current class.
  #
  # source://roda//lib/roda.rb#43
  def opts; end

  # Load a new plugin into the current class.  A plugin can be a module
  # which is used directly, or a symbol representing a registered plugin
  # which will be required and then used. Returns nil.
  #
  # Note that you should not load plugins into a Roda class after the
  # class has been subclassed, as doing so can break the subclasses.
  #
  #   Roda.plugin PluginModule
  #   Roda.plugin :csrf
  #
  # @raise [RodaError]
  #
  # source://roda//lib/roda.rb#283
  def plugin(plugin, *args, **_arg2, &block); end

  # Setup routing tree for the current Roda application, and build the
  # underlying rack application using the stored middleware. Requires
  # a block, which is yielded the request.  By convention, the block
  # argument should be named +r+.  Example:
  #
  #   Roda.route do |r|
  #     r.root do
  #       "Root"
  #     end
  #   end
  #
  # This should only be called once per class, and if called multiple
  # times will overwrite the previous routing.
  #
  # source://roda//lib/roda.rb#320
  def route(&block); end

  # The route block that this class uses.
  #
  # source://roda//lib/roda.rb#46
  def route_block; end

  # Add a middleware to use for the rack application.  Must be
  # called before calling #route to have an effect. Example:
  #
  #   Roda.use Rack::ShowExceptions
  #
  # source://roda//lib/roda.rb#337
  def use(*args, **_arg1, &block); end

  private

  # Return the number of required argument, optional arguments,
  # whether the callable accepts any additional arguments,
  # and whether the callable accepts keyword arguments (true, false
  # or :required).
  #
  # source://roda//lib/roda.rb#351
  def _define_roda_method_arg_numbers(callable); end

  # The base rack app to use, before middleware is added.
  #
  # source://roda//lib/roda.rb#382
  def base_rack_app_callable(new_api = T.unsafe(nil)); end

  # Build the rack app to use
  #
  # source://roda//lib/roda.rb#392
  def build_rack_app; end

  # Modify the route block to use for any route block provided as input,
  # which can include route blocks that are delegated to by the main route block.
  # Can be modified by plugins.
  #
  # source://roda//lib/roda.rb#407
  def convert_route_block(block); end

  # Build a _roda_after method that calls each _roda_after_* method
  # in order, if any _roda_after_* methods are defined. Also, use
  # the internal after hook plugin if the _roda_after method is defined.
  #
  # source://roda//lib/roda.rb#431
  def def_roda_after; end

  # Build a _roda_before method that calls each _roda_before_* method
  # in order, if any _roda_before_* methods are defined. Also, rebuild
  # the route block if a _roda_before method is defined.
  #
  # source://roda//lib/roda.rb#414
  def def_roda_before; end

  # The route block to use when building the rack app (or other initial
  # entry point to the route block).
  # By default, modifies the rack app route block to support before hooks
  # if any before hooks are defined.
  # Can be modified by plugins.
  #
  # source://roda//lib/roda.rb#450
  def rack_app_route_block(block); end

  # source://roda//lib/roda.rb#475
  def roda_method_name(suffix); end

  # Whether the new dispatch API should be used.
  #
  # @return [Boolean]
  #
  # source://roda//lib/roda.rb#455
  def use_new_dispatch_api?; end
end

# Instance methods for the Roda class.
#
# In addition to the listed methods, the following two methods are available:
#
# request :: The instance of the request class related to this request.
#            This is the same object yielded by Roda.route.
# response :: The instance of the response class related to this request.
#
# source://roda//lib/roda.rb#487
module Roda::RodaPlugins::Base::InstanceMethods
  # Create a request and response of the appropriate class
  #
  # source://roda//lib/roda.rb#489
  def initialize(env); end

  # Handle dispatching to the main route, catching :halt and handling
  # the result of the block.
  #
  # source://roda//lib/roda.rb#497
  def _roda_handle_main_route; end

  # Treat the given block as a routing block, catching :halt if
  # thrown by the block.
  #
  # source://roda//lib/roda.rb#507
  def _roda_handle_route; end

  # Default implementation of the main route, usually overridden
  # by Roda.route.
  #
  # source://roda//lib/roda.rb#516
  def _roda_main_route(_); end

  # Run the main route block with the request.  Designed for
  # extension by plugins
  #
  # source://roda//lib/roda.rb#521
  def _roda_run_main_route(r); end

  # Deprecated method for the previous main route dispatch API.
  #
  # source://roda//lib/roda.rb#526
  def call(&block); end

  # The environment hash for the current request. Example:
  #
  #   env['REQUEST_METHOD'] # => 'GET'
  #
  # source://roda//lib/roda.rb#543
  def env; end

  # The class-level options hash.  This should probably not be
  # modified at the instance level. Example:
  #
  #   Roda.plugin :render
  #   Roda.route do |r|
  #     opts[:render_opts].inspect
  #   end
  #
  # source://roda//lib/roda.rb#554
  def opts; end

  def request; end
  def response; end

  # The session hash for the current request. Raises RodaError
  # if no session exists. Example:
  #
  #   session # => {}
  #
  # source://roda//lib/roda.rb#570
  def session; end

  private

  # Deprecated method for the previous main route dispatch API.
  # Deprecated private alias for internal use
  #
  # source://roda//lib/roda.rb#526
  def _call(&block); end
end

# Class methods for RodaRequest
#
# source://roda//lib/roda/request.rb#29
module Roda::RodaPlugins::Base::RequestClassMethods
  # Return the cached pattern for the given object.  If the object is
  # not already cached, yield to get the basic pattern, and convert the
  # basic pattern to a pattern that does not match partial segments.
  #
  # source://roda//lib/roda/request.rb#39
  def cached_matcher(obj); end

  # Since RodaRequest is anonymously subclassed when Roda is subclassed,
  # and then assigned to a constant of the Roda subclass, make inspect
  # reflect the likely name for the class.
  #
  # source://roda//lib/roda/request.rb#52
  def inspect; end

  # The cache to use for match patterns for this request class.
  #
  # source://roda//lib/roda/request.rb#34
  def match_pattern_cache; end

  # The cache to use for match patterns for this request class.
  #
  # source://roda//lib/roda/request.rb#34
  def match_pattern_cache=(_arg0); end

  # Reference to the Roda class related to this request class.
  #
  # source://roda//lib/roda/request.rb#31
  def roda_class; end

  # Reference to the Roda class related to this request class.
  #
  # source://roda//lib/roda/request.rb#31
  def roda_class=(_arg0); end

  private

  # The pattern to use for consuming, based on the given argument.  The returned
  # pattern requires the path starts with a string and does not match partial
  # segments.
  #
  # source://roda//lib/roda/request.rb#61
  def consume_pattern(pattern); end
end

# Instance methods for RodaRequest, mostly related to handling routing
# for the request.
#
# source://roda//lib/roda/request.rb#68
module Roda::RodaPlugins::Base::RequestMethods
  # Store the roda instance and environment.
  #
  # source://roda//lib/roda/request.rb#84
  def initialize(scope, env); end

  # Handle match block return values.  By default, if a string is given
  # and the response is empty, use the string as the response body.
  #
  # source://roda//lib/roda/request.rb#93
  def block_result(result); end

  # The current captures for the request.  This gets modified as routing
  # occurs.
  #
  # source://roda//lib/roda/request.rb#77
  def captures; end

  # Match GET requests.  If no arguments are provided, matches all GET
  # requests, otherwise, matches only GET requests where the arguments
  # given fully consume the path.
  #
  # source://roda//lib/roda/request.rb#103
  def get(*args, &block); end

  # Immediately stop execution of the route block and return the given
  # rack response array of status, headers, and body.  If no argument
  # is given, uses the current response.
  #
  #   r.halt [200, {'Content-Type'=>'text/html'}, ['Hello World!']]
  #
  #   response.status = 200
  #   response['Content-Type'] = 'text/html'
  #   response.write 'Hello World!'
  #   r.halt
  #
  # source://roda//lib/roda/request.rb#117
  def halt(res = T.unsafe(nil)); end

  # What HTTP version the request was submitted with.
  #
  # source://roda//lib/roda/request.rb#131
  def http_version; end

  # Show information about current request, including request class,
  # request method and full path.
  #
  #   r.inspect
  #   # => '#<Roda::RodaRequest GET /foo/bar>'
  #
  # source://roda//lib/roda/request.rb#126
  def inspect; end

  # Does a terminal match on the current path, matching only if the arguments
  # have fully matched the path.  If it matches, the match block is
  # executed, and when the match block returns, the rack response is
  # returned.
  #
  #   r.remaining_path
  #   # => "/foo/bar"
  #
  #   r.is 'foo' do
  #     # does not match, as path isn't fully matched (/bar remaining)
  #   end
  #
  #   r.is 'foo/bar' do
  #     # matches as path is empty after matching
  #   end
  #
  # If no arguments are given, matches if the path is already fully matched.
  #
  #   r.on 'foo/bar' do
  #     r.is do
  #       # matches as path is already empty
  #     end
  #   end
  #
  # Note that this matches only if the path after matching the arguments
  # is empty, not if it still contains a trailing slash:
  #
  #   r.remaining_path
  #   # =>  "/foo/bar/"
  #
  #   r.is 'foo/bar' do
  #     # does not match, as path isn't fully matched (/ remaining)
  #   end
  #
  #   r.is 'foo/bar/' do
  #     # matches as path is empty after matching
  #   end
  #
  #   r.on 'foo/bar' do
  #     r.is "" do
  #       # matches as path is empty after matching
  #     end
  #   end
  #
  # source://roda//lib/roda/request.rb#192
  def is(*args, &block); end

  # Optimized method for whether this request is a +GET+ request.
  # Similar to the default Rack::Request get? method, but can be
  # overridden without changing rack's behavior.
  #
  # @return [Boolean]
  #
  # source://roda//lib/roda/request.rb#206
  def is_get?; end

  # The already matched part of the path, including the original SCRIPT_NAME.
  #
  # source://roda//lib/roda/request.rb#246
  def matched_path; end

  # Does a match on the path, matching only if the arguments
  # have matched the path.  Because this doesn't fully match the
  # path, this is usually used to setup branches of the routing tree,
  # not for final handling of the request.
  #
  #   r.remaining_path
  #   # => "/foo/bar"
  #
  #   r.on 'foo' do
  #     # matches, path is /bar after matching
  #   end
  #
  #   r.on 'bar' do
  #     # does not match
  #   end
  #
  # Like other routing methods, If it matches, the match block is
  # executed, and when the match block returns, the rack response is
  # returned.  However, in general you will call another routing method
  # inside the match block that fully matches the path and does the
  # final handling for the request:
  #
  #   r.on 'foo' do
  #     r.is 'bar' do
  #       # handle /foo/bar request
  #     end
  #   end
  #
  # source://roda//lib/roda/request.rb#237
  def on(*args, &block); end

  # This an an optimized version of Rack::Request#path.
  #
  #   r.env['SCRIPT_NAME'] = '/foo'
  #   r.env['PATH_INFO'] = '/bar'
  #   r.path
  #   # => '/foo/bar'
  #
  # source://roda//lib/roda/request.rb#257
  def path; end

  # Match POST requests.  If no arguments are provided, matches all POST
  # requests, otherwise, matches only POST requests where the arguments
  # given fully consume the path.
  #
  # source://roda//lib/roda/request.rb#272
  def post(*args, &block); end

  # The current path to match requests against.
  # An alias of remaining_path. If a plugin changes remaining_path then
  # it should override this method to return the untouched original.
  def real_remaining_path; end

  # Immediately redirect to the path using the status code.  This ends
  # the processing of the request:
  #
  #   r.redirect '/page1', 301 if r['param'] == 'value1'
  #   r.redirect '/page2' # uses 302 status code
  #   response.status = 404 # not reached
  #
  # If you do not provide a path, by default it will redirect to the same
  # path if the request is not a +GET+ request.  This is designed to make
  # it easy to use where a +POST+ request to a URL changes state, +GET+
  # returns the current state, and you want to show the current state
  # after changing:
  #
  #   r.is "foo" do
  #     r.get do
  #       # show state
  #     end
  #
  #     r.post do
  #       # change state
  #       r.redirect
  #     end
  #   end
  #
  # source://roda//lib/roda/request.rb#299
  def redirect(path = T.unsafe(nil), status = T.unsafe(nil)); end

  # The current path to match requests against.
  #
  # source://roda//lib/roda/request.rb#263
  def remaining_path; end

  # The response related to the current request.  See ResponseMethods for
  # instance methods for the response, but in general the most common usage
  # is to override the response status and headers:
  #
  #   response.status = 200
  #   response['Header-Name'] = 'Header value'
  #
  # source://roda//lib/roda/request.rb#310
  def response; end

  # Return the Roda class related to this request.
  #
  # source://roda//lib/roda/request.rb#315
  def roda_class; end

  # Match method that only matches +GET+ requests where the current
  # path is +/+.  If it matches, the match block is executed, and when
  # the match block returns, the rack response is returned.
  #
  #   [r.request_method, r.remaining_path]
  #   # => ['GET', '/']
  #
  #   r.root do
  #     # matches
  #   end
  #
  # This is usuable inside other match blocks:
  #
  #   [r.request_method, r.remaining_path]
  #   # => ['GET', '/foo/']
  #
  #   r.on 'foo' do
  #     r.root do
  #       # matches
  #     end
  #   end
  #
  # Note that this does not match non-+GET+ requests:
  #
  #   [r.request_method, r.remaining_path]
  #   # => ['POST', '/']
  #
  #   r.root do
  #     # does not match
  #   end
  #
  # Use <tt>r.post ""</tt> for +POST+ requests where the current path
  # is +/+.
  #
  # Nor does it match empty paths:
  #
  #   [r.request_method, r.remaining_path]
  #   # => ['GET', '/foo']
  #
  #   r.on 'foo' do
  #     r.root do
  #       # does not match
  #     end
  #   end
  #
  # Use <tt>r.get true</tt> to handle +GET+ requests where the current
  # path is empty.
  #
  # source://roda//lib/roda/request.rb#366
  def root(&block); end

  # Call the given rack app with the environment and return the response
  # from the rack app as the response for this request.  This ends
  # the processing of the request:
  #
  #   r.run(proc{[403, {}, []]}) unless r['letmein'] == '1'
  #   r.run(proc{[404, {}, []]})
  #   response.status = 404 # not reached
  #
  # This updates SCRIPT_NAME/PATH_INFO based on the current remaining_path
  # before dispatching to another rack app, so the app still works as
  # a URL mapper.
  #
  # source://roda//lib/roda/request.rb#383
  def run(app); end

  # The Roda instance related to this request object.  Useful if routing
  # methods need access to the scope of the Roda route block.
  #
  # source://roda//lib/roda/request.rb#81
  def scope; end

  # The session for the current request.  Raises a RodaError if
  # a session handler has not been loaded.
  #
  # source://roda//lib/roda/request.rb#402
  def session; end

  private

  # Match any of the elements in the given array.  Return at the
  # first match without evaluating future matches.  Returns false
  # if no elements in the array match.
  #
  # source://roda//lib/roda/request.rb#411
  def _match_array(matcher); end

  # Match the given class.  Currently, the following classes
  # are supported by default:
  # Integer :: Match an integer segment, yielding result to block as an integer
  # String :: Match any non-empty segment, yielding result to block as a string
  #
  # source://roda//lib/roda/request.rb#427
  def _match_class(klass); end

  # Match integer segment of up to 100 decimal characters, and yield resulting value as an
  # integer.
  #
  # source://roda//lib/roda/request.rb#445
  def _match_class_Integer; end

  # Match the given symbol if any segment matches.
  # Match any nonempty segment.  This should be called without an argument.
  #
  # source://roda//lib/roda/request.rb#502
  def _match_class_String(sym = T.unsafe(nil)); end

  # Convert the segment matched by the Integer matcher to an integer.
  #
  # source://roda//lib/roda/request.rb#454
  def _match_class_convert_Integer(value); end

  # Match the given hash if all hash matchers match.
  #
  # source://roda//lib/roda/request.rb#438
  def _match_hash(hash); end

  # Match only if all of the arguments in the given array match.
  # Match the given regexp exactly if it matches a full segment.
  #
  # source://roda//lib/roda/request.rb#460
  def _match_regexp(re); end

  # Match the given string to the request path.  Matches only if the
  # request path ends with the string or if the next character in the
  # request path is a slash (indicating a new segment).
  #
  # source://roda//lib/roda/request.rb#467
  def _match_string(str); end

  # Match the given symbol if any segment matches.
  #
  # source://roda//lib/roda/request.rb#502
  def _match_symbol(sym = T.unsafe(nil)); end

  # The base remaining path to use.
  #
  # source://roda//lib/roda/request.rb#519
  def _remaining_path(env); end

  # Backbone of the verb method support, using a terminal match if
  # args is not empty, or a regular match if it is empty.
  #
  # source://roda//lib/roda/request.rb#525
  def _verb(args, &block); end

  # Yield to the match block and return rack response after the block returns.
  #
  # source://roda//lib/roda/request.rb#535
  def always; end

  # The body to use for the response if the response does not already have
  # a body.  By default, a String is returned directly, and nil is
  # returned otherwise.
  #
  # source://roda//lib/roda/request.rb#543
  def block_result_body(result); end

  # Attempts to match the pattern to the current path.  If there is no
  # match, returns false without changes.  Otherwise, modifies
  # SCRIPT_NAME to include the matched path, removes the matched
  # path from PATH_INFO, and updates captures with any regex captures.
  #
  # source://roda//lib/roda/request.rb#558
  def consume(pattern); end

  # The default path to use for redirects when a path is not given.
  # For non-GET requests, redirects to the current path, which will
  # trigger a GET request.  This is to make the common case where
  # a POST request will redirect to a GET request at the same location
  # will work fine.
  #
  # If the current request is a GET request, raise an error, as otherwise
  # it is easy to create an infinite redirect.
  #
  # @raise [RodaError]
  #
  # source://roda//lib/roda/request.rb#577
  def default_redirect_path; end

  # The default status to use for redirects if a status is not provided,
  # 302 by default.
  #
  # source://roda//lib/roda/request.rb#584
  def default_redirect_status; end

  # Whether the current path is considered empty.
  #
  # @return [Boolean]
  #
  # source://roda//lib/roda/request.rb#589
  def empty_path?; end

  # If all of the arguments match, yields to the match block and
  # returns the rack response when the block returns.  If any of
  # the match arguments doesn't match, does nothing.
  #
  # source://roda//lib/roda/request.rb#596
  def if_match(args); end

  # Attempt to match the argument to the given request, handling
  # common ruby types.
  #
  # source://roda//lib/roda/request.rb#613
  def match(matcher); end

  # Match only if all of the arguments in the given array match.
  #
  # source://roda//lib/roda/request.rb#641
  def match_all(args); end

  # Match by request method.  This can be an array if you want
  # to match on multiple methods.
  #
  # source://roda//lib/roda/request.rb#647
  def match_method(type); end

  # How to handle block results that are not nil, false, or a String.
  # By default raises an exception.
  #
  # @raise [RodaError]
  #
  # source://roda//lib/roda/request.rb#657
  def unsupported_block_result(result); end

  # Handle an unsupported matcher.
  #
  # @raise [RodaError]
  #
  # source://roda//lib/roda/request.rb#662
  def unsupported_matcher(matcher); end
end

# source://roda//lib/roda/request.rb#69
Roda::RodaPlugins::Base::RequestMethods::TERM = T.let(T.unsafe(nil), Object)

# Class methods for RodaResponse
#
# source://roda//lib/roda/response.rb#35
module Roda::RodaPlugins::Base::ResponseClassMethods
  # Since RodaResponse is anonymously subclassed when Roda is subclassed,
  # and then assigned to a constant of the Roda subclass, make inspect
  # reflect the likely name for the class.
  #
  # source://roda//lib/roda/response.rb#42
  def inspect; end

  # Reference to the Roda class related to this response class.
  #
  # source://roda//lib/roda/response.rb#37
  def roda_class; end

  # Reference to the Roda class related to this response class.
  #
  # source://roda//lib/roda/response.rb#37
  def roda_class=(_arg0); end
end

# Instance methods for RodaResponse
#
# source://roda//lib/roda/response.rb#48
module Roda::RodaPlugins::Base::ResponseMethods
  # Set the default headers when creating a response.
  #
  # source://roda//lib/roda/response.rb#62
  def initialize; end

  # Return the response header with the given key. Example:
  #
  #   response['Content-Type'] # => 'text/html'
  #
  # source://roda//lib/roda/response.rb#71
  def [](key); end

  # Set the response header with the given key to the given value.
  #
  #   response['Content-Type'] = 'application/json'
  #
  # source://roda//lib/roda/response.rb#78
  def []=(key, value); end

  # The body for the current response.
  #
  # source://roda//lib/roda/response.rb#52
  def body; end

  # The default headers to use for responses.
  #
  # source://roda//lib/roda/response.rb#83
  def default_headers; end

  # Return the default response status to be used when the body
  # has been written to. This is split out to make overriding
  # easier in plugins.
  #
  # source://roda//lib/roda/response.rb#144
  def default_status; end

  # Whether the response body has been written to yet.  Note
  # that writing an empty string to the response body marks
  # the response as not empty. Example:
  #
  #   response.empty? # => true
  #   response.write('a')
  #   response.empty? # => false
  #
  # @return [Boolean]
  #
  # source://roda//lib/roda/response.rb#94
  def empty?; end

  # Return the rack response array of status, headers, and body
  # for the current response.  If the status has not been set,
  # uses the return value of default_status if the body has
  # been written to, otherwise uses a 404 status.
  # Adds the Content-Length header to the size of the response body.
  #
  # Example:
  #
  #   response.finish
  #   #  => [200,
  #   #      {'Content-Type'=>'text/html', 'Content-Length'=>'0'},
  #   #      []]
  #
  # source://roda//lib/roda/response.rb#110
  def finish; end

  # Return the rack response array using a given body.  Assumes a
  # 200 response status unless status has been explicitly set,
  # and doesn't add the Content-Length header or use the existing
  # body.
  #
  # source://roda//lib/roda/response.rb#136
  def finish_with_body(body); end

  # The hash of response headers for the current response.
  #
  # source://roda//lib/roda/response.rb#55
  def headers; end

  # Show response class, status code, response headers, and response body
  #
  # source://roda//lib/roda/response.rb#149
  def inspect; end

  # Set the Location header to the given path, and the status
  # to the given status.  Example:
  #
  #   response.redirect('foo', 301)
  #   response.redirect('bar')
  #
  # source://roda//lib/roda/response.rb#158
  def redirect(path, status = T.unsafe(nil)); end

  # Return the Roda class related to this response.
  #
  # source://roda//lib/roda/response.rb#165
  def roda_class; end

  # The status code to use for the response.  If none is given, will use 200
  # code for non-empty responses and a 404 code for empty responses.
  #
  # source://roda//lib/roda/response.rb#59
  def status; end

  # The status code to use for the response.  If none is given, will use 200
  # code for non-empty responses and a 404 code for empty responses.
  #
  # source://roda//lib/roda/response.rb#59
  def status=(_arg0); end

  # Write to the response body.  Returns nil.
  #
  #   response.write('foo')
  #
  # source://roda//lib/roda/response.rb#172
  def write(str); end

  private

  # Use plain hash for headers by default on Rack 1-2
  #
  # source://roda//lib/roda/response.rb#183
  def _initialize_headers; end

  # Set the content length for empty 205 responses to 0
  #
  # source://roda//lib/roda/response.rb#202
  def empty_205_headers(headers); end

  # For each default header, if a header has not already been set for the
  # response, set the header in the response.
  #
  # source://roda//lib/roda/response.rb#210
  def set_default_headers; end
end

# source://roda//lib/roda/response.rb#49
Roda::RodaPlugins::Base::ResponseMethods::DEFAULT_HEADERS = T.let(T.unsafe(nil), Hash)

# source://roda//lib/roda/plugins.rb#10
Roda::RodaPlugins::EMPTY_ARRAY = T.let(T.unsafe(nil), Array)

# source://roda//lib/roda/plugins.rb#9
Roda::RodaPlugins::OPTS = T.let(T.unsafe(nil), Hash)

# Base class used for Roda requests.  The instance methods for this
# class are added by Roda::RodaPlugins::Base::RequestMethods, the
# class methods are added by Roda::RodaPlugins::Base::RequestClassMethods.
#
# source://roda//lib/roda/request.rb#21
class Roda::RodaRequest < ::Rack::Request
  include ::Roda::RodaPlugins::Base::RequestMethods
  extend ::Roda::RodaPlugins::Base::RequestClassMethods
end

# Base class used for Roda responses.  The instance methods for this
# class are added by Roda::RodaPlugins::Base::ResponseMethods, the class
# methods are added by Roda::RodaPlugins::Base::ResponseClassMethods.
#
# source://roda//lib/roda/response.rb#28
class Roda::RodaResponse
  include ::Roda::RodaPlugins::Base::ResponseMethods
  extend ::Roda::RodaPlugins::Base::ResponseClassMethods
end

# Contains constants for response headers.  This approach is used so that all
# headers used internally by Roda can be lower case on Rack 3, so that it is
# possible to use a plain hash of response headers instead of using Rack::Headers.
#
# source://roda//lib/roda/response.rb#12
module Roda::RodaResponseHeaders; end

# source://roda//lib/roda/response.rb#21
Roda::RodaResponseHeaders::ALLOW = T.let(T.unsafe(nil), String)

# source://roda//lib/roda/response.rb#21
Roda::RodaResponseHeaders::CACHE_CONTROL = T.let(T.unsafe(nil), String)

# source://roda//lib/roda/response.rb#21
Roda::RodaResponseHeaders::CONTENT_DISPOSITION = T.let(T.unsafe(nil), String)

# source://roda//lib/roda/response.rb#21
Roda::RodaResponseHeaders::CONTENT_ENCODING = T.let(T.unsafe(nil), String)

# source://roda//lib/roda/response.rb#21
Roda::RodaResponseHeaders::CONTENT_LENGTH = T.let(T.unsafe(nil), String)

# source://roda//lib/roda/response.rb#21
Roda::RodaResponseHeaders::CONTENT_SECURITY_POLICY = T.let(T.unsafe(nil), String)

# source://roda//lib/roda/response.rb#21
Roda::RodaResponseHeaders::CONTENT_SECURITY_POLICY_REPORT_ONLY = T.let(T.unsafe(nil), String)

# source://roda//lib/roda/response.rb#21
Roda::RodaResponseHeaders::CONTENT_TYPE = T.let(T.unsafe(nil), String)

# source://roda//lib/roda/response.rb#21
Roda::RodaResponseHeaders::ETAG = T.let(T.unsafe(nil), String)

# source://roda//lib/roda/response.rb#21
Roda::RodaResponseHeaders::EXPIRES = T.let(T.unsafe(nil), String)

# source://roda//lib/roda/response.rb#21
Roda::RodaResponseHeaders::LAST_MODIFIED = T.let(T.unsafe(nil), String)

# source://roda//lib/roda/response.rb#21
Roda::RodaResponseHeaders::LINK = T.let(T.unsafe(nil), String)

# source://roda//lib/roda/response.rb#21
Roda::RodaResponseHeaders::LOCATION = T.let(T.unsafe(nil), String)

# source://roda//lib/roda/response.rb#21
Roda::RodaResponseHeaders::PERMISSIONS_POLICY = T.let(T.unsafe(nil), String)

# source://roda//lib/roda/response.rb#21
Roda::RodaResponseHeaders::PERMISSIONS_POLICY_REPORT_ONLY = T.let(T.unsafe(nil), String)

# source://roda//lib/roda/response.rb#21
Roda::RodaResponseHeaders::SET_COOKIE = T.let(T.unsafe(nil), String)

# source://roda//lib/roda/response.rb#21
Roda::RodaResponseHeaders::TRANSFER_ENCODING = T.let(T.unsafe(nil), String)

# source://roda//lib/roda/response.rb#21
Roda::RodaResponseHeaders::VARY = T.let(T.unsafe(nil), String)

# The full version of Roda as a string.
#
# source://roda//lib/roda/version.rb#14
Roda::RodaVersion = T.let(T.unsafe(nil), String)

# The full version of Roda as a number (3.7.0 => 30070)
#
# source://roda//lib/roda/version.rb#17
Roda::RodaVersionNumber = T.let(T.unsafe(nil), Integer)