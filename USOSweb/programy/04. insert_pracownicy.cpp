#include<iostream>
#include<fstream>
#include<string>
#include<ctime>
#include<cstdlib>
#include<vector>
using namespace std;


int main()
{
    ifstream input("pracownicy.txt");
    ofstream output("inserty_pracownicy.txt");
    string tytuly[] = {
        "inz.",
        "mgr",
        "mgr inz.",
        "dr",
        "dr hab.",
        "prof.",
        "prof. dr hab."
    };

    string imie, nazwisko;
    int counter = 1;

    while(input>>imie>>nazwisko)
    {
        output<<"INSERT INTO studenci VALUES("<<counter++<<", '"<<imie<<"', '"<<nazwisko<<"', 'prowadzacy', '"<<tytuly[rand()%7]<<"');"<<endl;
    }


    input.close();
    output.close();
    return 0;
}
