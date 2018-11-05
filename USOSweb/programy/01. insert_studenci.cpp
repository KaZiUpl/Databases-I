#include<iostream>
#include<fstream>
#include<string>
#include<ctime>
#include<cstdlib>
using namespace std;


int main()
{
    srand(time(NULL));

    ifstream input("studenci.txt");
    ofstream output("inserty_studenci.txt");

    string imie, nazwisko;
    int counter = 1;

    while(!input.eof())
    {
        input>>imie>>nazwisko;
        output<<"INSERT INTO studenci VALUES("<<counter++<<",'"<<imie<<"','"<<nazwisko<<"',"<<rand()%7+1<<");"<<endl;
    }


    input.close();
    output.close();
    return 0;
}
