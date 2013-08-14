require 'minitest/autorun'
require 'ver_ex'

describe VerEx do
  describe '#something' do
    subject { VerEx().something() }
    it { assert !subject.test("") }
    it { assert subject.test("a") }
    it { assert subject.test("foobar") }
  end
  describe '#anything' do
    subject { VerEx().anything() }
    it { assert subject.test("") }
    it { assert subject.test("a") }
  end
  describe '#then' do
    describe 'with normal letters' do
      subject { VerEx().startOfLine().then('a') }
      it { assert !subject.test("") }
      it { assert !subject.test("b") }
      it { assert subject.test("a") }
    end
    describe 'with special characters' do
      subject { VerEx().startOfLine().then(')') }
      it { assert !subject.test("") }
      it { assert !subject.test("b") }
      it { assert subject.test(")") }
    end
  end
  describe '#anythingBut' do
    subject { VerEx().startOfLine().anythingBut( "w" ) }
    it { assert subject.test("w") }
    it { assert subject.test("") }
    it { assert subject.test("what") }
  end
  describe '#somethingBut' do
    subject { VerEx().startOfLine().somethingBut( "w" ) }
    it { assert !subject.test("w") }
    it { assert !subject.test("") }
    it { assert subject.test("a") }
  end
  describe '#endOfLine' do
    subject { VerEx().find( "a" ).endOfLine(); }
    it { assert !subject.test("") }
    it { assert !subject.test(".. b") }
    it { assert subject.test(".. a") }
  end
  describe '#maybe' do
    subject {VerEx().startOfLine().then( "a" ).maybe( "b" ).then('c')}
    it {assert !subject.test("adc")}
    it {assert subject.test("acb")}
    it {assert subject.test("abc")}
  end
  describe '#anyOf' do
    subject {VerEx().startOfLine().then( "a" ).anyOf( "xyz" );}
    it {assert !subject.test("acb")}
    it {assert subject.test("ax")}
    it {assert subject.test("ay")}
  end
  describe '#or' do
    subject {VerEx().startOfLine().then( "abc" ).or( "def" )}
    it {assert !subject.test('dbczzz')}
    it {assert !subject.test('foodefzzz')}
    it {assert subject.test('abczzz')}
    it {assert subject.test('defzzz')}
  end
  describe '#lineBreak' do
    subject {VerEx().startOfLine().then( "abc" ).lineBreak().then( "def" )}
    it {assert subject.test( "abc\r\ndef")}
    it {assert subject.test( "abc\ndef")}
    it {assert !subject.test( "abc\r\n def")}
  end
  describe '#br' do
    subject {VerEx().startOfLine().then( "abc" ).br().then( "def" )}
    it {assert subject.test( "abc\r\ndef")}
    it {assert subject.test( "abc\ndef")}
    it {assert !subject.test( "abc\r\n def")}
  end
  describe '#tab' do
    subject {VerEx().startOfLine().tab().then( "abc" )}
    it {assert !subject.test( "abc")}
    it {assert subject.test( "\tabc")}
  end
  describe '#searchOneLine' do
    it do
      skip
      testRegex = VerEx().startOfLine().then( "a" ).br().then( "b" ).endOfLine()
      testString = "a\nb"
      assert( testRegex.test( testString ), "b is on the second line" )

      testRegex = VerEx().startOfLine().then( "a" ).br().then( "b" ).endOfLine().searchOneLine()
      testString = "a\nb"
      assert( testRegex.test( testString ), "b is on the second line but we are only searching the first" )
    end
  end
  describe '#withAnyCase' do
  end
  describe '#stopAtFirst' do
  end

  describe '#range' do
  end

  describe '#replace' do
  end

  describe '#multiple' do
  end

  describe '#beginCapture' do
  end
  describe '#endCapture' do
  end
end
