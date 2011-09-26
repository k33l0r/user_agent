require File.expand_path('../spec_helper', __FILE__)

describe UserAgent do
  before(:each) do
    @agent = UserAgent.new 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_4; en-us) AppleWebKit/528.4+ (KHTML, like Gecko) Version/4.0dp1 Safari/526.11.2'
  end

  describe ".platform" do
    it "can detect blackberry" do
      agent = 'Mozilla/5.0 (BlackBerry; U; BlackBerry 9800; en-US) AppleWebKit/534.1+ (KHTML, like Gecko) Version/6.0.0.246 Mobile Safari/534.1+'
      UserAgent.platform(agent).should == :blackberry
    end

    it "can detect ipod" do
      agent = 'Mozilla/5.0 (iPod; U; CPU iPhone OS 2_0 like Mac OS X; de-de) AppleWebKit/525.18.1 (KHTML, like Gecko) Version/3.1.1 Mobile/5A347 Safari/525.20'
      UserAgent.platform(agent).should == :ipod
    end
  end

  describe "#initialize" do
    it "should allow a user agent string to be passed" do
      UserAgent.new('foo').source.should == 'foo'
    end
  end

  describe "#os" do
    it "should return operating system symbol" do
      @agent.os.should == 'OS X 10.5'
    end
  end

  describe "#engine" do
    it "should return engine symbol" do
      @agent.engine.should == :webkit
    end
  end

  describe "#engine_version" do
    it "should return engine version" do
      @agent.engine_version.should == '528.4'
    end
  end

  describe "#mobile?" do
    it "should return true for mobile platforms" do
      @agent.mobile?.should == false
    end
  end

  describe "#to_s" do
    it "should return the user agent string" do
      @agent.to_s.should == @agent.source
    end
  end

  describe "#inspect" do
    it "should return string presenting the engine, os, version, etc" do
      @agent.inspect.should == '#<UserAgent: name: :safari, version: "4.0dp1", os: "OS X 10.5", platform: :macintosh, engine: :webkit, engine_version: "528.4">'
    end
  end

  describe "#name" do
    it "should return the agent name symbol" do
      @agent.name.should == :safari
    end
  end

  describe "#eql?" do
    it "returns true for same source" do
      a = UserAgent.new('foo')
      b = UserAgent.new('foo')
      a.should eql(b)
    end

    it "returns false for different source" do
      a = UserAgent.new('foo')
      b = UserAgent.new('bar')
      a.should_not eql(b)
    end

    it "returns false for different classes" do
      a = UserAgent.new('foo')
      b = Class.new.new
      a.should_not eql(b)
    end
  end

  describe "#==" do
    it "returns true for same source" do
      a = UserAgent.new('foo')
      b = UserAgent.new('foo')
      a.should == b
    end

    it "returns false for different source" do
      a = UserAgent.new('foo')
      b = UserAgent.new('bar')
      a.should_not == b
    end

    it "returns false for different classes" do
      a = UserAgent.new('foo')
      b = Class.new.new
      a.should_not == b
    end
  end
end
