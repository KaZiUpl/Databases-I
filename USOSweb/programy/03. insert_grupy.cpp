#include<iostream>
#include<fstream>
#include<string>
#include<ctime>
#include<cstdlib>
using namespace std;

int main()
{
    ofstream output("inserty_grupy.txt");

    int counter = 1;
    char litera = 'A';
    for(int id_przedmiotu=1;id_przedmiotu<=16;id_przedmiotu++)
    {
        litera = 'A';
        for(int j=0;j<3;j++)
        {
            output<<"INSERT INTO grupy VALUES("<<counter++<<", '"<<litera++<<"', "<<id_przedmiotu<<", "<<rand()%20+1<<");"<<endl;
        }
    }

    output.close();
    return 0;
}
