/*
 * This class creates the program to test the banking classes.
 * It creates a new Bank, sets the Customer (with an initial balance),
 * and performs a series of transactions with the Account object.
 */

import java.text.NumberFormat;

public class TestBanking2 {

  public static void main(String[] args) {
    NumberFormat currency_format = NumberFormat.getCurrencyInstance();
    Bank     bank = new Bank();
    Customer customer;
    Account account;

    //
    // Create bank customers and their accounts
    //

    System.out.println("Creating the customer Jane Smith.");
    bank.addCustomer("Jane", "Smith");
    customer = bank.getCustomer(0);
    System.out.println("Creating her Savings Account with a 500.00 balance and 3% interest.");
    customer.addAccount(new SavingsAccount(500.00, 0.03));
    customer.addAccount(new CheckingAccount(200.00, 400.00));

    System.out.println("Creating the customer Owen Bryant.");
    bank.addCustomer("Owen", "Bryant");
    customer = bank.getCustomer(1);
    System.out.println("Creating his Checking Account with a 500.00 balance and no overdraft protection.");
    customer.addAccount(new CheckingAccount(500.00));

    System.out.println("Creating the customer Tim Soley.");
    bank.addCustomer("Tim", "Soley");
    customer = bank.getCustomer(2);
    System.out.println("Creating his Checking Account with a 500.00 balance and 500.00 in overdraft protection.");
    customer.addAccount(new CheckingAccount(500.00, 500.00));

    System.out.println("Creating the customer Maria Soley.");
    bank.addCustomer("Maria", "Soley");
    customer = bank.getCustomer(3);
    System.out.println("Maria shares her Checking Account with her husband Tim.");
    customer.addAccount(bank.getCustomer(2).getAccount(0));

    System.out.println();

    //
    // Demonstrate behavior of various account types
    //

    // Test a standard Savings Account
    System.out.println("Retrieving the customer Jane Smith with her savings account.");
    customer = bank.getCustomer(0);
    account = customer.getAccount(0);
    // Perform some account transactions
    System.out.println("Withdraw 150.00: " + account.withdraw(150.00));
    System.out.println("Deposit 22.50: " + account.deposit(22.50));
    System.out.println("Withdraw 47.62: " + account.withdraw(47.62));
    System.out.println("Withdraw 400.00: " + account.withdraw(400.00));
    // Print out the final account balance
    System.out.println("Customer [" + customer.getLastName()
		       + ", " + customer.getFirstName()
		       + "] has a balance of " + account.getBalance());

    System.out.println();

    // Test a Checking Account w/o overdraft protection
    System.out.println("Retrieving the customer Owen Bryant with his checking account with no overdraft protection.");
    customer = bank.getCustomer(1);
    account = customer.getAccount(0);
    // Perform some account transactions
    System.out.println("Withdraw 150.00: " + account.withdraw(150.00));
    System.out.println("Deposit 22.50: " + account.deposit(22.50));
    System.out.println("Withdraw 47.62: " + account.withdraw(47.62));
    System.out.println("Withdraw 400.00: " + account.withdraw(400.00));
    // Print out the final account balance
    System.out.println("Customer [" + customer.getLastName()
		       + ", " + customer.getFirstName()
		       + "] has a balance of " + account.getBalance());

    System.out.println();

    // Test a Checking Account with overdraft protection
    System.out.println("Retrieving the customer Tim Soley with his checking account that has overdraft protection.");
    customer = bank.getCustomer(2);
    account = customer.getAccount(0);
    // Perform some account transactions
    System.out.println("Withdraw 150.00: " + account.withdraw(150.00));
    System.out.println("Deposit 22.50: " + account.deposit(22.50));
    System.out.println("Withdraw 47.62: " + account.withdraw(47.62));
    System.out.println("Withdraw 400.00: " + account.withdraw(400.00));
    // Print out the final account balance
    System.out.println("Customer [" + customer.getLastName()
		       + ", " + customer.getFirstName()
		       + "] has a balance of " + account.getBalance());

    System.out.println();

    // Test a Checking Account with overdraft protection
    System.out.println("Retrieving the customer Maria Soley with her joint checking account with husband Tim.");
    customer = bank.getCustomer(3);
    account = customer.getAccount(0);
    // Perform some account transactions
    System.out.println("Deposit 150.00: " + account.deposit(150.00));
    System.out.println("Withdraw 750.00: " + account.withdraw(750.00));
    // Print out the final account balance
    System.out.println("Customer [" + customer.getLastName()
		       + ", " + customer.getFirstName()
		       + "] has a balance of " + account.getBalance());

    // Generate a report
    System.out.println();
    System.out.println("\t\t\tCUSTOMERS REPORT");
    System.out.println("\t\t\t================");

    for ( int cust_idx = 0; cust_idx < bank.getNumOfCustomers(); cust_idx++ ) {
      customer = bank.getCustomer(cust_idx);

      System.out.println();
      System.out.println("Customer: "
			 + customer.getLastName() + ", "
			 + customer.getFirstName());

      for ( int acct_idx = 0; acct_idx < customer.getNumOfAccounts(); acct_idx++ ) {
	   account = customer.getAccount(acct_idx);
	   String  account_type = "";

	// Determine the account type
	/*** Step 1:
	**** Use the instanceof operator to test what type of account
	**** we have and set account_type to an appropriate value, such
	**** as "Savings Account" or "Checking Account".
	***/

	// Print the current balance of the account
	/*** Step 2:
	**** Print out the type of account and the balance.
	**** Feel free to use the currency_format formatter
	**** to generate a "currency string" for the balance.
	***/
      }
    }


  }
}
