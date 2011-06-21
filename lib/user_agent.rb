class UserAgent
  def self.engine_version(string)
    if string =~ /#{engine(string)}[\/ ]([\d\w\.\-]+)/i
      $1
    end
  end

  def self.version(string)
    case name = browser_name(string)
      when :chrome ; $1 if string =~ /chrome\/([\d\w\.\-]+)/i
      when :safari ; $1 if string =~ /version\/([\d\w\.\-]+)/i
      when :ps3    ; $1 if string =~ /([\d\w\.\-]+)\)\s*$/i
      when :psp    ; $1 if string =~ /([\d\w\.\-]+)\)?\s*$/i
      else           $1 if string =~ /#{name}[\/ ]([\d\w\.\-]+)/i
    end
  end

  def self.engine(string)
    case string
      when /webkit/i    ; :webkit
      when /khtml/i     ; :khtml
      when /konqueror/i ; :konqueror
      when /chrome/i    ; :chrome
      when /presto/i    ; :presto
      when /gecko/i     ; :gecko
      when /msie/i      ; :msie
      else                :unknown
    end
  end

  def self.os(string)
    case string
      when /windows nt 6\.0/i             ; 'Windows Vista'
      when /windows nt 6\.\d+/i           ; 'Windows 7'
      when /windows nt 5\.2/i             ; 'Windows 2003'
      when /windows nt 5\.1/i             ; 'Windows XP'
      when /windows nt 5\.0/i             ; 'Windows 2000'
      when /os x (\d+)[._](\d+)/i         ; "OS X #{$1}.#{$2}"
      when /linux/i                       ; 'Linux'
      when /wii/i                         ; 'Wii'
      when /playstation 3/i               ; 'Playstation'
      when /playstation portable/i        ; 'Playstation'
      when /\(iPad.*os (\d+)[._](\d+)/i   ; "iPad OS #{$1}.#{$2}"
      when /\(iPhone.*os (\d+)[._](\d+)/i ; "iPhone OS #{$1}.#{$2}"
      else                                ; 'Unknown'
    end
  end

  def self.browser_name(string)
    case string
      when /konqueror/i            ; :konqueror
      when /chrome/i               ; :chrome
      when /safari/i               ; :safari
      when /msie/i                 ; :ie
      when /opera/i                ; :opera
      when /playstation 3/i        ; :ps3
      when /playstation portable/i ; :psp
      when /firefox/i              ; :firefox
      else                         ; :unknown
    end
  end

  def self.platform(string)
    case string
      when /windows/i     ; :windows
      when /macintosh/i   ; :macintosh
      when /linux/i       ; :linux
      when /wii/i         ; :wii
      when /playstation/i ; :playstation
      when /ipad/i        ; :ipad
      when /iphone/i      ; :iphone
      else                  :unknown
    end
  end

  attr_reader :source

  def initialize(source)
    @source = source.strip
  end

  def name
    self.class.browser_name(source)
  end

  def version
    self.class.version(source)
  end

  def engine
    self.class.engine(source)
  end

  def engine_version
    self.class.engine_version(source)
  end

  def os
    self.class.os(source)
  end

  def platform
    self.class.platform(source)
  end

  def to_s
    @source
  end

  def inspect
    "#<UserAgent:#{name} version:#{version.inspect} engine:\"#{engine.to_s}:#{engine_version}\" os:#{os.to_s.inspect}>"
  end

  def ==(other)
    source == other.source
  end
end
