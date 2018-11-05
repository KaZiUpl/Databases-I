#pragma once
#include<string>
#include<algorithm>
using namespace std;

extern int id_przedmiotu;



class Przedmiot
{
public:
    int     id_przedmiotu,
            wymiar_godzin;
    string  nazwa,
            typ_zaliczenia;

    friend ostream & operator<<(ostream &, const Przedmiot &);
    friend istream & operator>>(istream &, Przedmiot &);

};

ostream & operator<<(ostream & output, const Przedmiot & przedmiot)
{
    output<<przedmiot.id_przedmiotu<<" "<<przedmiot.nazwa<<" "<<przedmiot.typ_zaliczenia<<" "<<przedmiot.wymiar_godzin<<endl;
    return output;
}
istream & operator>>(istream & input, Przedmiot & przedmiot)
{
    string wymiar_godzin_str,nazwa,typ_zal;
    cout<<"Podaj nazwe, typ_zaliczenia i wymiar_godzin:\n";
    przedmiot.id_przedmiotu = id_przedmiotu++;
    getline(input,nazwa);
    przedmiot.nazwa = nazwa;
    getline(input,typ_zal);
    przedmiot.typ_zaliczenia = typ_zal;
    getline(input,wymiar_godzin_str);
    przedmiot.wymiar_godzin = strtol(wymiar_godzin_str.c_str(),NULL,10);

    return input;
}
