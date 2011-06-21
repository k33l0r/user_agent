require File.expand_path('../spec_helper', __FILE__)

def test(name, version, platform, os, engine, engine_version, string)
  it "should parse #{name} #{version} on #{os} with engine #{engine} #{engine_version}" do
    agent = UserAgent.new string
    agent.name.should == name
    agent.platform.should == platform
    agent.os.should == os
    agent.engine.should == engine
    agent.version.should == version
    agent.engine_version.should == engine_version
  end
end

describe UserAgent do

  test :safari,     '4.0dp1',       :windows,     'Windows XP',    :webkit,     '526.9',      'Mozilla/5.0 (Windows; U; Windows NT 5.1; en) AppleWebKit/526.9 (KHTML, like Gecko) Version/4.0dp1 Safari/526.8'
  test :safari,     '4.0.3',        :windows,     'Windows Vista', :webkit,     '531.9',      'Mozilla/5.0 (Windows; U; Windows NT 6.0; en-us) AppleWebKit/531.9 (KHTML, like Gecko) Version/4.0.3 Safari/531.9'
  test :safari,     '4.0.2',        :windows,     'Windows 7',     :webkit,     '532',        'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/532+ (KHTML, like Gecko) Version/4.0.2 Safari/530.19.1'
  test :safari,     '4.0.1',        :macintosh,   'OS X 10.5',     :webkit,     '531.2',      'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_7; en-us) AppleWebKit/531.2+ (KHTML, like Gecko) Version/4.0.1 Safari/530.18'
  test :safari,     '4.0',          :windows,     'Windows Vista', :webkit,     '528.16',     'Mozilla/5.0 (Windows; U; Windows NT 6.0; ru-RU) AppleWebKit/528.16 (KHTML, like Gecko) Version/4.0 Safari/528.16'
  test :safari,     '3.2.3',        :windows,     'Windows XP',    :webkit,     '525.28.3',   'Mozilla/5.0 (Windows; U; Windows NT 5.1; cs-CZ) AppleWebKit/525.28.3 (KHTML, like Gecko) Version/3.2.3 Safari/525.29'
  test :safari,     '4.0.4',        :ipad,        'iPad OS 3.2',   :webkit,     '531.21.10',  'Mozilla/5.0 (iPad; U; CPU OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Version/4.0.4 Mobile/7B314 Safari/531.21.10'
  test :safari,     '4.0.4',        :ipad,        'iPad OS 3.2',   :webkit,     '531.21.10',  'Mozilla/5.0 (iPad; U; CPU iPhone OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Version/4.0.4 Mobile/7B314 Safari/531.21.10'
  test :safari,     '4.0',          :iphone,      'iPhone OS 3.0', :webkit,     '528.18',     'Mozilla/5.0 (iPhone; U; CPU iPhone OS 3_0 like Mac OS X; en-us) AppleWebKit/528.18 (KHTML, like Gecko) Version/4.0 Mobile/7A341 Safari/528.16'
  test :ie,         '8.0',          :windows,     'Windows 7',      :msie,      '8.0',        'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.2; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0)'
  test :ie,         '7.0b',         :windows,     'Windows 2003',   :msie,      '7.0b',       'Mozilla/4.0 (compatible; MSIE 7.0b; Windows NT 5.2; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.0.04506.30)'
  test :ie,         '7.0',          :windows,     'Windows XP',     :msie,      '7.0',        'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.2)'
  test :ie,         '7.0',          :windows,     'Windows XP',     :msie,      '7.0',        'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.2; MSOffice 12)'
  test :ie,         '6.0b',         :windows,     'Windows XP',     :msie,      '6.0b',       'Mozilla/4.0 (compatible; MSIE 6.0b; Windows NT 5.1)'
  test :ie,         '6.0',          :windows,     'Windows XP',     :msie,      '6.0',        'Mozilla/5.0 (Windows; U; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727)'
  test :opera,      '9.99',         :windows,     'Windows XP',     :presto,    '9.9.9',      'Opera/9.99 (Windows NT 5.1; U; pl) Presto/9.9.9'
  test :opera,      '9.70',         :linux,       'Linux',          :gecko,     '20061208',   'Mozilla/5.0 (Linux i686 ; U; en; rv:1.8.1) Gecko/20061208 Firefox/2.0.0 Opera 9.70'
  test :opera,      '9.64',         :linux,       'Linux',          :presto,    '2.1.1',      'Opera/9.64 (X11; Linux i686; U; Linux Mint; it) Presto/2.1.1'
  test :opera,      '9.00',         :wii,         'Wii',            :unknown,    nil,         'Opera/9.00 (Nintindo Wii; U; ; 103858; Wii Shop Channel/1.0; en)'
  test :chrome,     '6.0.472.62',   :macintosh,   'OS X 10.6',      :webkit,    '534.3',      'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_4; en-US) AppleWebKit/534.3 (KHTML, like Gecko) Chrome/6.0.472.62 Safari/534.3'
  test :chrome,     '6.0.472.63',   :macintosh,   'OS X 10.6',      :webkit,    '534.3',      'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_4; en-US) AppleWebKit/534.3 (KHTML, like Gecko) Chrome/6.0.472.63 Safari/534.3'
  test :chrome,     '6.0.472.55',   :linux,       'Linux',          :webkit,    '534.3',      'Mozilla/5.0 (X11; U; Linux i686; en-US) AppleWebKit/534.3 (KHTML, like Gecko) Chrome/6.0.472.55 Safari/534.3'
  test :chrome,     '5.0.375.127',  :windows,     'Windows XP',     :webkit,    '533.4',      'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/533.4 (KHTML, like Gecko) Chrome/5.0.375.127 Safari/533.4'
  test :chrome,     '6.0.472.59',   :windows,     'Windows XP',     :webkit,    '534.3',      'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/534.3 (KHTML, like Gecko) Chrome/6.0.472.59 Safari/534.3'
  test :chrome,     '6.0.472.53',   :linux,       'Linux',          :webkit,    '534.3',      'Mozilla/5.0 (X11; U; Linux x86_64; en-US) AppleWebKit/534.3 (KHTML, like Gecko) Chrome/6.0.472.53 Safari/534.3'
  test :chrome,     '4.0.202.2',    :linux,       'Linux',          :webkit,    '532.0',      'Mozilla/5.0 (X11; U; Linux i686 (x86_64); en-US) AppleWebKit/532.0 (KHTML, like Gecko) Chrome/4.0.202.2 Safari/532.0'
  test :chrome,     '0.2.149.27',   :windows,     'Windows 2003',   :webkit,    '525.13',     'Mozilla/5.0 (Windows; U; Windows NT 5.2; en-US) AppleWebKit/525.13 (KHTML, like Gecko) Chrome/0.2.149.27 Safari/525.13 '
  test :chrome,     '0.2.149.30',   :windows,     'Windows Vista',  :webkit,    '525.13',     'Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US) AppleWebKit/525.13 (KHTML, like Gecko) Chrome/0.2.149.30 Safari/525.13 '
  test :konqueror,  '4.2',          :linux,       'Linux',          :khtml,     '4.2.4',      'Mozilla/5.0 (compatible; Konqueror/4.2; Linux; X11; x86_64) KHTML/4.2.4 (like Gecko) Fedora/4.2.4-2.fc11'
  test :konqueror,  '3.1-rc6',      :linux,       'Linux',          :konqueror, '3.1-rc6',    'Mozilla/5.0 (compatible; Konqueror/3.1-rc6; i686 Linux; 20021105)'
  test :ps3,        '2.00',         :playstation, 'Playstation',    :unknown,   nil,          'Mozilla/5.0 (PLAYSTATION 3; 2.00)'
  test :ps3,        '1.10',         :playstation, 'Playstation',    :unknown,   nil,          'Mozilla/5.0 (PLAYSTATION 3; 1.10)'
  test :psp,        '2.00',         :playstation, 'Playstation',    :unknown,   nil,          'PSP (PlayStation Portable); 2.00'
  test :psp,        '2.00',         :playstation, 'Playstation',    :unknown,   nil,          'Mozilla/4.0 (PSP (PlayStation Portable); 2.00)'
  test :firefox,    '3.5.13',       :windows,     'Windows XP',     :gecko,     '20100914',   'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.13) Gecko/20100914 Firefox/3.5.13 (.NET CLR 3.5.30729)'
  test :firefox,    '3.6.10',       :windows,     'Windows XP',     :gecko,     '20100914',   'Mozilla/5.0 (Windows; U; Windows NT 5.1; pt-BR; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10 GTB7.1'
  test :firefox,    '3.6.10',       :windows,     'Windows Vista',  :gecko,     '20100914',   'Mozilla/5.0 (Windows; U; Windows NT 6.0; pt-BR; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10 GTB7.1 ( .NET CLR 3.5.30729)'
  test :firefox,    '3.6.8',        :linux,       'Linux',          :gecko,     '20100723',   'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.2.8) Gecko/20100723 Ubuntu/9.10 (karmic) Firefox/3.6.8'
  test :firefox,    '3.6.9',        :linux,       'Linux',          :gecko,     '20100824',   'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.2.9) Gecko/20100824 Firefox/3.6.9'
  test :firefox,    '3.6.9',        :linux,       'Linux',          :gecko,     '20100825',   'Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.2.9) Gecko/20100825 Ubuntu/10.04 (lucid) Firefox/3.6.9'

end
