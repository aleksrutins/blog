# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: false
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/mustermann/all/mustermann.rbi
#
# mustermann-3.0.0

module Mustermann
  def self.[](name); end
  def self.extend_object(object); end
  def self.new(*input, type: nil, operator: nil, **options); end
  def self.normalized_type(type); end
  def self.register(name, type); end
  def self.try_require(path); end
end
class Mustermann::Error < StandardError
end
class Mustermann::CompileError < Mustermann::Error
end
class Mustermann::ParseError < Mustermann::Error
end
class Mustermann::ExpandError < Mustermann::Error
end
class Mustermann::SimpleMatch
  def +(other); end
  def [](*args); end
  def captures; end
  def initialize(string = nil, names: nil, captures: nil); end
  def inspect; end
  def names; end
  def to_s; end
end
class Mustermann::EqualityMap
  def fetch(key); end
  def finalizer(hash); end
  def initialize; end
  def map; end
  def self.new; end
  def track(key, object); end
end
class Mustermann::Pattern
  def &(other); end
  def +(other); end
  def ==(other); end
  def ===(string); end
  def =~(string); end
  def ^(other); end
  def always_array?(key); end
  def eql?(other); end
  def expand(behavior = nil, values = nil); end
  def hash; end
  def initialize(string, uri_decode: nil, **options); end
  def inspect; end
  def map_param(key, value); end
  def match(string); end
  def named_captures; end
  def names; end
  def options; end
  def params(string = nil, captures: nil, offset: nil); end
  def peek(string); end
  def peek_match(string); end
  def peek_params(string); end
  def peek_size(string); end
  def respond_to?(method, *args); end
  def respond_to_special?(method); end
  def self.new(string, ignore_unknown_options: nil, **options); end
  def self.register(*names); end
  def self.supported?(option, **options); end
  def self.supported_options(*list); end
  def simple_inspect; end
  def to_proc; end
  def to_s; end
  def to_templates; end
  def unescape(string, decode = nil); end
  def uri_decode; end
  def |(other); end
  include Mustermann
end
class Mustermann::Composite < Mustermann::Pattern
  def ==(pattern); end
  def ===(string); end
  def eql?(pattern); end
  def expand(behavior = nil, values = nil); end
  def hash; end
  def initialize(patterns, operator: nil, **options); end
  def inspect; end
  def match(string); end
  def operator; end
  def params(string); end
  def patterns; end
  def patterns_from(pattern, **options); end
  def respond_to_special?(method); end
  def self.new(*patterns, **options); end
  def self.supported?(option, type: nil, **options); end
  def simple_inspect; end
  def to_s; end
  def to_templates; end
  def with_matching(string, method); end
end
class Mustermann::Concat < Mustermann::Composite
  def ===(string); end
  def combined_ast; end
  def expand(behavior = nil, values = nil); end
  def initialize(*, **); end
  def match(string); end
  def operator; end
  def params(string); end
  def peek_match(string); end
  def peek_params(string); end
  def peek_size(string); end
  def pump(string, inject_with: nil, initial: nil, with_size: nil); end
  def respond_to_special?(method); end
  def to_templates; end
end
module Mustermann::Concat::Native
  def +(other); end
  def look_ahead(other); end
  def native_concat(other); end
  def native_concat?(other); end
end
module Mustermann::AST
end
class Mustermann::AST::Node
  def each_leaf(&block); end
  def initialize(payload = nil, **options); end
  def is_a?(type); end
  def length; end
  def min_size; end
  def parse; end
  def payload; end
  def payload=(arg0); end
  def self.[](name); end
  def self.constant_name(name); end
  def self.parse(payload = nil, **options, &block); end
  def self.type; end
  def start; end
  def start=(arg0); end
  def stop; end
  def stop=(arg0); end
  def type; end
end
class Mustermann::AST::Node::Capture < Mustermann::AST::Node
  def constraint; end
  def constraint=(arg0); end
  def convert; end
  def convert=(arg0); end
  def name; end
  def parse; end
  def qualifier; end
  def qualifier=(arg0); end
end
class Mustermann::AST::Node::Char < Mustermann::AST::Node
  def min_size; end
end
class Mustermann::AST::Node::Expression < Mustermann::AST::Node
  def operator; end
  def operator=(arg0); end
end
class Mustermann::AST::Node::Composition < Mustermann::AST::Node
  def initialize(payload = nil, **options); end
end
class Mustermann::AST::Node::Group < Mustermann::AST::Node::Composition
end
class Mustermann::AST::Node::Union < Mustermann::AST::Node::Composition
end
class Mustermann::AST::Node::Optional < Mustermann::AST::Node
end
class Mustermann::AST::Node::Or < Mustermann::AST::Node
end
class Mustermann::AST::Node::Root < Mustermann::AST::Node
  def pattern; end
  def pattern=(arg0); end
  def self.parse(string, &block); end
end
class Mustermann::AST::Node::Separator < Mustermann::AST::Node
  def min_size; end
end
class Mustermann::AST::Node::Splat < Mustermann::AST::Node::Capture
  def name; end
end
class Mustermann::AST::Node::NamedSplat < Mustermann::AST::Node::Splat
  def name; end
end
class Mustermann::AST::Node::Variable < Mustermann::AST::Node::Capture
  def explode; end
  def explode=(arg0); end
  def prefix; end
  def prefix=(arg0); end
end
class Mustermann::AST::Node::WithLookAhead < Mustermann::AST::Node
  def at_end; end
  def at_end=(arg0); end
  def head; end
  def head=(arg0); end
  def initialize(payload, at_end, **options); end
end
class Mustermann::Identity < Mustermann::Pattern
  def ===(string); end
  def expand(behavior = nil, values = nil); end
  def peek_size(string); end
  def to_ast; end
  def to_templates; end
  include Mustermann::Concat::Native
end
class Mustermann::AST::Parser
  def buffer; end
  def default_node(char); end
  def eos?(*args, **, &block); end
  def expect(regexp, char: nil, **options); end
  def getch(*args, **, &block); end
  def initialize(pattern: nil, **options); end
  def min_size(start, stop, node); end
  def node(type, *args, **, &block); end
  def parse(string); end
  def pattern; end
  def pos(*args, **, &block); end
  def read; end
  def read_args(key_separator, close, separator: nil, symbol_keys: nil, **options); end
  def read_brackets(open, close, char: nil, escape: nil, quote: nil, **options); end
  def read_escaped(close, escape: nil, **options); end
  def read_list(*close, separator: nil, escape: nil, quotes: nil, ignore: nil, **options); end
  def read_suffix(element); end
  def scan(regexp); end
  def self.on(*chars, &block); end
  def self.parse(string, **options); end
  def self.suffix(pattern = nil, after: nil, &block); end
  def string; end
  def unexpected(char = nil, exception: nil); end
  extend Forwardable
end
class Mustermann::AST::Translator
  def decorator_for(node); end
  def error_class; end
  def escape(char, parser: nil, escape: nil, also_escape: nil); end
  def self.create(&block); end
  def self.dispatch_table; end
  def self.inherited(subclass); end
  def self.raises(error); end
  def self.translate(*types, &block); end
  def translate(node, *args, **, &block); end
end
class Mustermann::AST::Translator::NodeTranslator < Anonymous_Delegator_1
  def initialize(node, translator); end
  def node; end
  def self.register(*types); end
  def t(*args, **, &block); end
  def translator; end
end
class Mustermann::AST::Boundaries::NodeTranslator < Mustermann::AST::Translator::NodeTranslator
  def self.translator; end
end
class Mustermann::AST::Boundaries < Mustermann::AST::Translator
  def self.set_boundaries(ast, string: nil, start: nil, stop: nil); end
  def set_boundaries(node, start, stop); end
end
class Mustermann::AST::Compiler::NodeTranslator < Mustermann::AST::Translator::NodeTranslator
  def self.translator; end
end
class Mustermann::AST::Compiler < Mustermann::AST::Translator
  def compile(ast, except: nil, **options); end
  def encoded(char, uri_decode: nil, space_matches_plus: nil, **options); end
  def error_class; end
  def self.compile(ast, **options); end
end
class Mustermann::AST::Compiler::Capture < Mustermann::AST::Compiler::NodeTranslator
  def default(**options); end
  def from_array(array, **options); end
  def from_hash(hash, **options); end
  def from_nil(**options); end
  def from_string(string, **options); end
  def from_symbol(symbol, **options); end
  def pattern(capture: nil, **options); end
  def qualified(string, greedy: nil, **options); end
  def translate(**options); end
  def with_lookahead(string, lookahead: nil, **options); end
end
class Mustermann::AST::Compiler::Splat < Mustermann::AST::Compiler::Capture
  def pattern(**options); end
end
class Mustermann::AST::Compiler::Variable < Mustermann::AST::Compiler::Capture
  def default(allow_reserved: nil, **options); end
  def parametric(string); end
  def pattern(parametric: nil, separator: nil, **options); end
  def qualified(string, **options); end
  def register_param(parametric: nil, split_params: nil, separator: nil, **options); end
  def translate(**options); end
end
class Mustermann::AST::Transformer::NodeTranslator < Mustermann::AST::Translator::NodeTranslator
  def self.translator; end
end
class Mustermann::AST::Transformer < Mustermann::AST::Translator
  def self.transform(tree); end
end
class Mustermann::AST::Transformer::GroupTransformer < Mustermann::AST::Transformer::NodeTranslator
  def group(elements); end
  def split_payload; end
  def translate; end
  def union; end
end
class Mustermann::AST::Transformer::RootTransformer < Mustermann::AST::Transformer::GroupTransformer
  def union; end
end
class Mustermann::AST::Transformer::ExpressionTransform < Mustermann::AST::Transformer::NodeTranslator
  def translate; end
end
class Mustermann::AST::Transformer::ExpressionTransform::Operator < Struct
  def allow_reserved; end
  def allow_reserved=(_); end
  def parametric; end
  def parametric=(_); end
  def prefix; end
  def prefix=(_); end
  def self.[](*arg0); end
  def self.inspect; end
  def self.keyword_init?; end
  def self.members; end
  def self.new(*arg0); end
  def separator; end
  def separator=(_); end
end
class Mustermann::AST::Transformer::ArrayTransform < Mustermann::AST::Transformer::NodeTranslator
  def create_lookahead(elements, *args); end
  def expect_lookahead?(element); end
  def list_for(element); end
  def lookahead?(element, in_lookahead = nil); end
  def lookahead_buffer; end
  def lookahead_payload?(payload, in_lookahead); end
  def payload; end
  def track(element); end
  def translate; end
end
class Mustermann::AST::Validation::NodeTranslator < Mustermann::AST::Translator::NodeTranslator
  def self.translator; end
end
class Mustermann::AST::Validation < Mustermann::AST::Translator
  def check_name(name, forbidden: nil); end
  def names; end
  def self.validate(ast); end
end
class Mustermann::AST::TemplateGenerator::NodeTranslator < Mustermann::AST::Translator::NodeTranslator
  def self.translator; end
end
class Mustermann::AST::TemplateGenerator < Mustermann::AST::Translator
  def self.generate_templates(ast); end
end
class Mustermann::AST::ParamScanner::NodeTranslator < Mustermann::AST::Translator::NodeTranslator
  def self.translator; end
end
class Mustermann::AST::ParamScanner < Mustermann::AST::Translator
  def self.scan_params(ast); end
end
class Mustermann::RegexpBased < Mustermann::Pattern
  def ===(*args, **, &block); end
  def =~(*args, **, &block); end
  def compile(**options); end
  def initialize(string, **options); end
  def match(*args, **, &block); end
  def named_captures(*args, **, &block); end
  def names(*args, **, &block); end
  def peek_match(string); end
  def peek_size(string); end
  def regexp; end
  def to_regexp; end
  extend Forwardable
end
class Mustermann::AST::Expander::NodeTranslator < Mustermann::AST::Translator::NodeTranslator
  def self.translator; end
end
class Mustermann::AST::Expander < Mustermann::AST::Translator
  def add(ast); end
  def add_to(list, result); end
  def error_class; end
  def error_for(values); end
  def escape(string, *args, **); end
  def expand(values); end
  def expandable?(values); end
  def expandable_keys(keys); end
  def for_capture(node, **options); end
  def keys; end
  def mappings; end
  def pattern(string = nil, *keys, **filters); end
  def pattern_for(node, **options); end
end
class Mustermann::Caster < Anonymous_Delegator_2
  def cast(hash); end
  def caster_for(type, &block); end
  def initialize(*types, &block); end
  def register(*types, &block); end
end
class Mustermann::Caster::Any
  def cast(key, value); end
  def initialize(&block); end
end
class Mustermann::Caster::Value < Mustermann::Caster::Any
  def cast(key, value); end
  def initialize(type, &block); end
end
class Mustermann::Caster::Key < Mustermann::Caster::Any
  def cast(key, value); end
  def initialize(type, &block); end
end
class Mustermann::Expander
  def <<(*patterns); end
  def ==(other); end
  def add(*patterns); end
  def additional_values; end
  def append(uri, values); end
  def cast(*types, &block); end
  def caster; end
  def eql?(other); end
  def expand(behavior = nil, values = nil); end
  def expandable?(values); end
  def hash; end
  def initialize(*patterns, additional_values: nil, **options, &block); end
  def map_values(values); end
  def patterns; end
  def slice(hash, keys); end
  def split_values(values); end
  def with_rest(values); end
end
class Mustermann::AST::Pattern < Mustermann::RegexpBased
  def boundaries(*args, **, &block); end
  def compile(**options); end
  def compiler(*args, **, &block); end
  def expand(behavior = nil, values = nil); end
  def generate_templates(*args, **, &block); end
  def map_param(key, value); end
  def param_converters; end
  def param_scanner(*args, **, &block); end
  def parse(*args, **, &block); end
  def parser(*args, **, &block); end
  def scan_params(*args, **, &block); end
  def self.boundaries; end
  def self.compiler; end
  def self.on(*args, **, &block); end
  def self.param_scanner; end
  def self.parser; end
  def self.suffix(*args, **, &block); end
  def self.template_generator; end
  def self.transformer; end
  def self.validation; end
  def set_boundaries(*args, **, &block); end
  def template_generator(*args, **, &block); end
  def to_ast; end
  def to_templates; end
  def transform(*args, **, &block); end
  def transformer(*args, **, &block); end
  def validate(*args, **, &block); end
  def validation(*args, **, &block); end
  extend Forwardable
end
class Mustermann::Sinatra < Mustermann::AST::Pattern
  def native_concat(other); end
  def safe_string; end
  def self.escape(string); end
  def self.try_convert(input, **options); end
  def |(other); end
  include Mustermann::Concat::Native
end
class Mustermann::Sinatra::Parser < Mustermann::AST::Parser
end
class InvalidName___Class_0x00___NodeTranslator_3 < Mustermann::AST::Translator::NodeTranslator
  def self.translator; end
end
class Mustermann::Sinatra::TryConvert::NodeTranslator < Mustermann::AST::Translator::NodeTranslator
  def self.translator; end
end
class Mustermann::Sinatra::TryConvert < Mustermann::AST::Translator
  def initialize(options); end
  def new(input, escape = nil); end
  def options; end
  def self.convert(input, **options); end
  def uri_decode; end
end
class Mustermann::Regular < Mustermann::RegexpBased
  def check_anchors(scanner); end
  def compile(**options); end
  def extended_regexp?(string); end
  def initialize(string, check_anchors: nil, **options); end
  include Mustermann::Concat::Native
end
