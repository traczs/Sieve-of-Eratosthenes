#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <sys/time.h>

void SieveOfEratosthenes(int n)
{
	FILE* file = fopen("Coutput.txt","w+");
    // Create a boolean array "prime[0..n]" and initialize
    // all entries it as true. A value in prime[i] will
    // finally be false if i is Not a prime, else true.
    bool prime[n];
    memset(prime, true, sizeof(prime));
    
    for (int p=2; p*p<=n; p++)
    {
        // If prime[p] is not changed, then it is a prime
        if (prime[p] == true)
        {
            // Update all multiples of p
            for (int i=p*2; i<=n; i += p)
            {
                prime[i] = false;
			}
        }
    }
    
    for (int p=2; p<=n; p++)
    {
        if (prime[p])
        {
            fprintf(file, "%d\n", p);
        }
	}
	//printf("\n");
	fclose(file);
}
 

int main(int argc, char* argv[])
{
	
	struct timeval timeBefore, timeAfter;
	int input;
	printf("Enter the upper limit:");
	scanf("%d",&input);
    printf("input: %d\n",input);
    gettimeofday(&timeBefore,NULL);
    SieveOfEratosthenes(input);
    gettimeofday(&timeAfter,NULL);
    printf("Time in seconds: %lf seconds\n",(double)(((timeAfter.tv_sec - timeBefore.tv_sec)*1000000+timeAfter.tv_usec) - timeBefore.tv_usec)/1000000);
    
    return 0;
}
