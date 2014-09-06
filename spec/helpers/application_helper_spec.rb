require 'spec_helper'

describe ApplicationHelper do
    describe "full title" do
        it "should include the page title" do
            expect(full_title("foo")).to match(/foo/)
        end

        it "should includ the base title" do
            expect(full_title("foo")).to match(/^Library/)
        end

        it "should not include a bar for the home page" do
            expect(full_title("")).not_to match(/\|/)
        end
    end
end
