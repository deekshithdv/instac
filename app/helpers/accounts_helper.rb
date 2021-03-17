module AccountsHelper

    def current_user?
        if @account.id == current_account.id
            return true
        else
            return false
        end
    end

end
