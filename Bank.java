import java.io.*;

class OverdrawException extends Exception {
  OverdrawException (String str) {
    super(str);
  }
}

class Account {                         // simple account
  public native void externalBooking(); // for bookings 
                                        // from native programs
  private float balance;
  private float limit;                  
  public Account() {
    balance=0;
    limit = -100;
  }
  public void setBalance(float amount) throws OverdrawException {
    if (amount < limit)
      throw new OverdrawException("Limit overdrawn"); 
    balance = amount;
  }
  public void booking(float amount) throws OverdrawException {   
                                        // deposit > 0, 
                                        // withdraw < 0
    if (balance + amount < limit)
      throw new OverdrawException("Limit overdrawn"); 
    balance += amount;
  }
  public float getBalance() {		// actcual balance
    return balance;
  }
}

public class Bank {
  static private Account accounts[];
  static { System.loadLibrary("account");}

  Bank() {                             // bank with 10 accounts
    accounts = new Account[10];
    for (int i=0; i<accounts.length; i++)
      accounts[i] = new Account();
  }

  public static void main(String[] args) {
    Bank b = new Bank();
    try {
      b.accounts[0].setBalance(200);
    } catch (OverdrawException e) {
      System.out.println(e);
    }
    System.out.println("0: " + b.accounts[0].getBalance());
    try {
      b.accounts[1].setBalance(-200);
    } catch (OverdrawException e) {
      System.out.println(e);
    }
    System.out.println("1: " + b.accounts[1].getBalance());
    
  }
}

