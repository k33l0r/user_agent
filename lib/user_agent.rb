class UserAgent

  AttributesForInspect = [:name, :version, :os, :platform, :engine, :engine_version]

  module Engines
    Webkit    = /webkit/i
    Khtml     = /khtml/i
    Konqueror = /konqueror/i
    Chrome    = /chrome/i
    Presto    = /presto/i
    Gecko     = /gecko/i
    Msie      = /msie/i
  end

  module Versions
    Chrome  = /chrome\/([\d\w\.\-]+)/i
    Safari  = /version\/([\d\w\.\-]+)/i
    Ps3     = /([\d\w\.\-]+)\)\s*$/i
    Psp     = /([\d\w\.\-]+)\)?\s*$/i
  end

  module Browsers
    Konqueror           = /konqueror/i
    Chrome              = /chrome/i
    Safari              = /safari/i
    IE                  = /msie/i
    Opera               = /opera/i
    PS3                 = /playstation 3/i
    PSP                 = /playstation portable/i
    Firefox             = /firefox/i
  end

  module OS
    WindowsVista  = /windows nt 6\.0/i
    Windows7      = /windows nt 6\.\d+/i
    Windows2003   = /windows nt 5\.2/i
    WindowsXP     = /windows nt 5\.1/i
    Windows2000   = /windows nt 5\.0/i
    OSX           = /os x (\d+)[._](\d+)/i
    Linux         = /linux/i
    Wii           = /wii/i
    PS3           = /playstation 3/i
    PSP           = /playstation portable/i
    Ipad          = /\(iPad.*os (\d+)[._](\d+)/i
    Iphone        = /\(iPhone.*os (\d+)[._](\d+)/i
  end

  module Platform
    Windows     = /windows/i
    Mac         = /macintosh/i
    Linux       = /linux/i
    Wii         = /wii/i
    Playstation = /playstation/i
    Ipad        = /ipad/i
    Iphone      = /iphone/i
  end

  def self.engine(string)
    case string
      when Engines::Webkit    then :webkit
      when Engines::Khtml     then :khtml
      when Engines::Konqueror then :konqueror
      when Engines::Chrome    then :chrome
      when Engines::Presto    then :presto
      when Engines::Gecko     then :gecko
      when Engines::Msie      then :msie
      else
        :unknown
    end
  end

  def self.engine_version(string)
    if string =~ /#{engine(string)}[\/ ]([\d\w\.\-]+)/i
      $1
    end
  end

  def self.browser_name(string)
    case string
      when Browsers::Konqueror  then :konqueror
      when Browsers::Chrome     then :chrome
      when Browsers::Safari     then :safari
      when Browsers::IE         then :ie
      when Browsers::Opera      then :opera
      when Browsers::PS3        then :ps3
      when Browsers::PSP        then :psp
      when Browsers::Firefox    then :firefox
      else
        :unknown
    end
  end

  def self.browser_version(string)
    case name = browser_name(string)
      when :chrome
        $1 if string =~ Versions::Chrome
      when :safari
        $1 if string =~ Versions::Safari
      when :ps3
        $1 if string =~ Versions::Ps3
      when :psp
        $1 if string =~ Versions::Psp
      else
        $1 if string =~ /#{name}[\/ ]([\d\w\.\-]+)/i
    end
  end

  def self.os(string)
    case string
      when OS::WindowsVista then 'Windows Vista'
      when OS::Windows7     then 'Windows 7'
      when OS::Windows2003  then 'Windows 2003'
      when OS::WindowsXP    then 'Windows XP'
      when OS::Windows2000  then 'Windows 2000'
      when OS::OSX          then "OS X #{$1}.#{$2}"
      when OS::Linux        then 'Linux'
      when OS::Wii          then 'Wii'
      when OS::PS3          then 'Playstation'
      when OS::PSP          then 'Playstation'
      when OS::Ipad         then "iPad OS #{$1}.#{$2}"
      when OS::Iphone       then "iPhone OS #{$1}.#{$2}"
      else
        'Unknown'
    end
  end

  def self.platform(string)
    case string
      when Platform::Windows     then :windows
      when Platform::Mac         then :macintosh
      when Platform::Linux       then :linux
      when Platform::Wii         then :wii
      when Platform::Playstation then :playstation
      when Platform::Ipad        then :ipad
      when Platform::Iphone      then :iphone
      else
        :unknown
    end
  end

  attr_reader :source

  def initialize(source)
    @source = source.strip
  end

  def name
    @name ||= self.class.browser_name(source)
  end

  def version
    @version ||= self.class.browser_version(source)
  end

  def engine
    @engine ||= self.class.engine(source)
  end

  def engine_version
    @engine_version ||= self.class.engine_version(source)
  end

  def os
    @os ||= self.class.os(source)
  end

  def platform
    @platform ||= self.class.platform(source)
  end

  def to_s
    @source
  end

  def inspect
    attributes_as_nice_string = AttributesForInspect.map do |name|
      "#{name}: #{send(name).inspect}"
    end.join(', ')

    "#<#{self.class}: #{attributes_as_nice_string}>"
  end

  def eql?(other)
    self.class.eql?(other.class) && source == other.source
  end
  alias :== :eql?
end
