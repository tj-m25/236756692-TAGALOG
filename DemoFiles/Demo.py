print("Welcome to the app of Infinite Money Bank")
print("Please type in the command of yur chosen transasction below [1-4]")
print("==============================================")
while True:
    balance = 100.00
    b2 = 20.00
    print("[1] Check Balance")
    print("[2] Withdraw Money")
    print("[3] Deposit Money")
    print("[4] Exit Application")
    print("==============================================")
    choice =int(input("Please enter your command: "))
    if choice == 1:
        print(f"Your current balance is: {balance} PHP")
    elif choice == 2:
        amount = int(input("Please enter the amount you would like to withdraw: "))
        if amount <= balance:
            balance -= amount
            print(f"You have withdrawn an amount of {amount} PHP")
            print(f"Your current balance is {balance} PHP")
        else:
            print("Invalid amount or insufficient balance.")
    elif choice == 3:
        amount = int(input("PLease enter the amount you would like to deposit: "))
        if amount >= b2:
            b2 += amount
            print(f"You have deposited an amount of {amount} PHP")
            print(f"Your current balance is {b2} PHP")
        else:
            print("Invalid deposit amount.")
    elif choice == 4:
        print("Thank you for using our app. Have a nice day!")
        break
    else:
        print("Invalid Choice. Please enter a valid command [1-4].")
