#include<iostream>
#include <stdio.h>
#include<queue>
#include<vector>
using namespace std;
#define N 1000010
class Rule
{
public:
	bool operator () (const int& a,const int &b) const
	{
		return a>b;
	}
};
priority_queue<int> que1;//最大优先队列
priority_queue<int,vector<int>,Rule> que2;
int in[N];
int main ()
{
	long long ans=0;
	int n,k;
	scanf("%d",&n);
	for(int i=1;i<=n;i++)
	{
		scanf("%d",&k);
		for(int j=0;j<k;j++)
		{
			int x;
			scanf("%d",&x);
			que1.push(x);
			que2.push(x);
			in[x]++;
		}
		while(in[que1.top()]==0)//不存在的不参与抽奖
			que1.pop();
		while(in[que2.top()]==0)
			que2.pop();
		ans += que1.top()-que2.top();
		in[que1.top()]--;
		in[que2.top()]--;
		que1.pop();
		que2.pop();
	}
	printf("%ld\n",ans);
	return 0;
}