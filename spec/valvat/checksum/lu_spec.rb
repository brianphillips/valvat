require 'spec_helper'

describe Valvat::Checksum::LU do
  %w(LU13669580 LU25361352 LU23124018 LU17560609).each do |valid_vat|
    it "returns true on valid vat #{valid_vat}" do
      Valvat::Checksum.validate(valid_vat).should eql(true)
    end

    invalid_vat = "#{valid_vat[0..-4]}#{valid_vat[-2]}#{valid_vat[-3]}#{valid_vat[-1]}"

    it "returns false on invalid vat #{invalid_vat}" do
      Valvat::Checksum.validate(invalid_vat).should eql(false)
    end
  end
end