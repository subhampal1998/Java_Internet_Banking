package Table;

public class Transaction {

	 private String Transaction_No;
	 
	 private String Transaction_Account_Number_Sender;
	 
	 private String Transaction_Date;
	 
	 private String Transaction_Time;
	 
	 private String Transaction_Amount;
	 
	 private String Transaction_Account_Number_Reciever;
	 
	 private String Status;

	

	public String getTransaction_No() {
		return Transaction_No;
	}

	public void setTransaction_No(String transaction_No) {
		Transaction_No = transaction_No;
	}

	public String getTransaction_Account_Number_Sender() {
		return Transaction_Account_Number_Sender;
	}

	public void setTransaction_Account_Number_Sender(String transaction_Account_Number_Sender) {
		Transaction_Account_Number_Sender = transaction_Account_Number_Sender;
	}

	public String getTransaction_Date() {
		return Transaction_Date;
	}

	public void setTransaction_Date(String transaction_Date) {
		Transaction_Date = transaction_Date;
	}

	public String getTransaction_Time() {
		return Transaction_Time;
	}

	public void setTransaction_Time(String transaction_Time) {
		Transaction_Time = transaction_Time;
	}

	public String getTransaction_Amount() {
		return Transaction_Amount;
	}

	public void setTransaction_Amount(String transaction_Amount) {
		Transaction_Amount = transaction_Amount;
	}

	
	public String getTransaction_Account_Number_Reciever() {
		return Transaction_Account_Number_Reciever;
	}

	public void setTransaction_Account_Number_Reciever(String transaction_Account_Number_Reciever) {
		Transaction_Account_Number_Reciever = transaction_Account_Number_Reciever;
	}
	public String getStatus() {
		return Status;
	}

	public void setStatus(String status) {
		Status = status;
	}
	
	
}
