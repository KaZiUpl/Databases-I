#include<iostream>
#include<fstream>
#include<string>
#include<algorithm>
using namespace std;


int main()
{
    ifstream input("przedmioty.txt");
    ofstream output("inserty_przedmioty.txt");

    string nazwa_przedmiotu,typ_zaliczenia,wymiar_godzin_str;
    int wymiar_godzin_int;

    int counter = 1;

    while(!input.eof())
    {
        getline(input,nazwa_przedmiotu);
        getline(input,typ_zaliczenia);
        getline(input,wymiar_godzin_str);
        wymiar_godzin_int = strtol(wymiar_godzin_str.c_str(),NULL,10);


        output<<"INSERT INTO przedmioty VALUES("<<counter++<<",'"<<nazwa_przedmiotu<<"','"<<typ_zaliczenia<<"',"<<wymiar_godzin_int<<");"<<endl;
    }


    input.close();
    output.close();
    return 0;
}