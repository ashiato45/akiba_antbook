#include <stdio.h>
#include <algorithm>

using namespace std;

int main(){
  int l = 0;
  int n = 0;
  int* ants = new int[1000000];

  scanf("%d", &l);
  scanf("%d", &n);
  for(int i=0; i < n; i++){
    scanf("%d", ants + i);
  }

  int minT = 0;
  for(int i=0; i < n; i++){
    minT = max(minT, min(ants[i], l - ants[i]));
  }

  int maxT = 0;
  for(int i=0; i < n; i++){
    maxT = max(maxT, max(ants[i], l - ants[i]));
  }

  printf("min = %d\n", minT);
  printf("max = %d\n", maxT);
  delete ants;

  return 0;
}
