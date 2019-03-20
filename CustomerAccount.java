/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import my.accounts.AccountType;
import my.bankaccounts.BankAccount;


public class CustomerAccount {

    private String name;
    private BankAccount accountNumber;
    private AccountType acctType;
    
    public CustomerAccount(String name, BankAccount accountNumber, 
            AccountType acctType) {
        this.name = name;
        this.accountNumber = accountNumber;
        this.acctType = acctType;
       }

    @Override
    public String toString() {
        return "CustomerAccount{" + "name=" + getName() + 
                ", \naccountNumber=" + getAccountNumber() + ", "
                + "\nacctType=" + getAcctType() + ", "
                + "\nbalance=" + accountNumber.getBalance() + '}';
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the accountNumber
     */
    public BankAccount getAccountNumber() {
        return accountNumber;
    }

    /**
     * @param accountNumber the accountNumber to set
     */
    public void setAccountNumber(BankAccount accountNumber) {
        this.accountNumber = accountNumber;
    }

    /**
     * @return the acctType
     */
    public AccountType getAcctType() {
        return acctType;
    }

    /**
     * @param acctType the acctType to set
     */
    public void setAcctType(AccountType acctType) {
        this.acctType = acctType;
    }

   
}
