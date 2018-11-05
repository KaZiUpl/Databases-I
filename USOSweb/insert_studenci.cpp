#include<iostream>
#include<fstream>
#include<string>
using namespace std;


int main()
{
    ifstream input("studenci.txt");
    ofstream output("inserty_studenci.txt");

    string imie, nazwisko;
    int counter = 1;

    while(!input.eof())
    {
        input>>imie>>nazwisko;
        output<<"INSERT INTO studenci VALUES("<<counter++<<",'"<<imie<<"','"<<nazwisko<<"');"<<endl;
    }


    input.close();
    output.close();
    return 0;
}
