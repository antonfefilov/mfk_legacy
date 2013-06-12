require "spec_helper"

describe "User" do
  describe "abilities" do
    subject { ability }
    let (:ability) { Ability.new(user) }
    let (:user) { nil }

    context "when is an admin" do
      let (:user) do
        admin_user = Fabricate(:user, username: "Haul", email: "lofdur@gmail.com", password: "q1w2e3")
        admin_role = Fabricate(:role, name: "admin")
        admin_user.roles << admin_role
        admin_user
      end
    
      it { should be_able_to(:manage, :all) } 
    end
  end 
end 
