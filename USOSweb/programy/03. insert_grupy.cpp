#include<iostream>
#include<fstream>
#include<string>
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
            output<<"INSERT INTO grupy VALUES("<<counter++<<",'"<<litera++<<"',"<<id_przedmiotu<<");"<<endl;
        }
    }

    output.close();
    return 0;
}
