require 'fluent/test'
require 'fluent/test/helpers'
require 'fluent/test/driver/parser'
require 'fluent/plugin/parser_logfmt'

class LogfmtParserTest < ::Test::Unit::TestCase
  include Fluent::Test::Helpers

  def setup
    Fluent::Test.setup
    @parser =Fluent::Test::Driver::Parser.new(Fluent::Plugin::LogfmtParser)
  end

  test 'basic parsing' do
    @parser.configure({})
    @parser.instance.parse('time="2018-01-01 00:00:00" aaa=111 bbb=222') { |time, record|
      assert_equal(event_time('2018-01-01 00:00:00').to_i, time)
      assert_equal({ 'aaa' => 111, 'bbb' => 222 }, record)
    }
  end

  test 'time_format' do
    @parser.configure({ :time_format => '%Y/%m/%d %H:%M:%S' })
    assert_raise Fluent::Plugin::Parser::ParserError do
      @parser.instance.parse('time="2018-01-01 00:00:00" aaa=111 bbb=222') { |time, record|
        assert_equal(event_time('2018-01-01 00:00:00').to_i, time)
        assert_equal({ 'aaa' => 111, 'bbb' => 222 }, record)
      }
    end

    @parser.instance.parse('time="2018/01/02 01:23:45" aaa=111 bbb=222') { |time, record|
      assert_equal(event_time('2018-01-02 01:23:45').to_i, time)
      assert_equal({ 'aaa' => 111, 'bbb' => 222 }, record)
    }
  end

  test 'time_key' do
    @parser.configure({ :time_format => '%Y/%m/%d %H:%M:%S', :time_key => 'real_time' })
    @parser.instance.parse('time="2018-01-01 00:00:00" aaa=111 real_time="2018/01/02 01:23:45" bbb=222') { |time, record|
      assert_equal(event_time('2018-01-02 01:23:45').to_i, time)
      assert_equal({ 'time' => '2018-01-01 00:00:00', 'aaa' => 111, 'bbb' => 222 }, record)
    }
  end
end
