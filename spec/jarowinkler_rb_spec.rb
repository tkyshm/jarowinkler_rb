require 'spec_helper'

describe JarowinklerRb do
  it 'has a version number' do
    expect(JarowinklerRb::VERSION).not_to be nil
  end

  it 'Compare "GKECRATE" with "DKQKETRACE"' do
    dw = JarowinklerRb.comp("GKECRATE","DKQKETRACE")
    expect(dw).to eq(0.7277777777777779)
  end

  it 'Compare "CRATE" with "TRACE"' do
    dw = JarowinklerRb.comp("CRATE","TRACE")
    expect(dw).to eq(0.7333333333333334)
  end

  it 'Compare "DWAYNE" with "DUANE"' do
    dw = JarowinklerRb.comp("DWAYNE","DUANE")
    expect(dw).to eq(0.8400000000000001)
  end

  it 'Compare "DIXON with "DICKSONX""' do
    dw = JarowinklerRb.comp("DIXON","DICKSONX")
    expect(dw).to eq(0.8133333333333332)
  end

  it 'Compare "MARTHA" with "MARHTA"' do
    dw = JarowinklerRb.comp("MARTHA","MARHTA")
    expect(dw).to eq(0.9611111111111111)
  end

  it 'Compare "ジョジョの奇妙な冒険　スターダストクルセイダース" with "ジョジョの奇妙な冒険　スターダストクルセイダース　エジプト編"' do
    str1 = "ジョジョの奇妙な冒険　スターダストクルセイダース"
    str2 = "ジョジョの奇妙な冒険　スターダストクルセイダース　エジプト編"
    dw = JarowinklerRb.comp(str1,str2)
    expect(dw).to eq(0.96)
  end

end
