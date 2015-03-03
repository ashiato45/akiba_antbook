#include <stdio.h>
#include <algorithm>
#define TENPOWSIX (1000000)

using namespace std;

int main(){
  int lotteryNumber = 0;
  int target = 0;
  int* pieces = new int[TENPOWSIX];

  /* read data */
  scanf("%d", &lotteryNumber);
  scanf("%d", &target);
  for(int i=0; i < lotteryNumber; i++){
    scanf("%d", &pieces[i]);
  }

  /* process */
  bool found = false;
  sort(pieces, pieces + lotteryNumber);
  for(int a=0; a < lotteryNumber; a++){
    for(int b=a; b < lotteryNumber; b++){
      for(int c=b; c < lotteryNumber; c++){
	int dn = target - pieces[a] - pieces[b] - pieces[c];
	if(!(c <= dn)){
	  continue;
	}
	bool f = binary_search(pieces, pieces + lotteryNumber, dn);
	if(f){
	  //printf("DEBUG: %d %d %d %d\n", pieces[a], pieces[b], pieces[c], dn);
	  found = true;
	  goto COMPLETED;
	}
      }
    }
  }

 COMPLETED:
  if(found){
    printf("YES\n");
  }else{
    printf("NO\n");
  }
  
  /* post process */
  delete pieces;
  return 0;
}
