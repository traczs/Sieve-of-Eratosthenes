#!/usr/bin/env/python3
import time
if __name__=='__main__':
    num = input("enter the ceiling range: ")
	#initialize boolean array 
    prime = [True for i in range(num)]
    p = 2
    start_time = time.time()
    while (p * p <= num):
         
        # If prime[p] is not changed, then it is a prime
        if (prime[p] == True):
             
            # Update all multiples of p
            for i in range(p * 2, num, p):
                prime[i] = False
        p += 1
    
    file=open("output.txt", "w") 
    # Print all prime numbers
    for p in range(2, num):
        if prime[p]:
            file.write(str(p)+"\n")
    file.close()
    print("Execution time : %s seconds" % (time.time() - start_time))
 
