#ifndef _FARUK_H
#define _FARUK_H

#include <iostream>
#include <vector>
#include <algorithm>
#include <ctime>
#include <cmath>

using namespace std;

#define loop(var, n) for(int var = 0; var < n; var++)

#define BLACK_BOX (char)(219)

#define DBG cout<<"dbg"<<endl;cin.ignore(1000,'\n');cin.get();

#define DEBUG(var) cin.ignore(1000,'\n');cout<<var<<endl;cin.get();

void wait_s(double secs) {
    time_t begin_time = clock();
    while((double)(clock() - begin_time) / CLOCKS_PER_SEC < secs);
}

template<typename T>
void print_vector_generic(const vector<T> &vec) {
    for(int i = 0; i < vec.size(); i++) {
        cout << vec[i] << ", ";
    }
    cout << endl;
}

template<char T>
bool is_specific_char(char c) {
    return (c == (char)T);
}

bool is_alpha(char c) {
    return (c >= 'a' && c <= 'z') || (c >= 'A' && c >= 'Z');
}

bool is_digit(char c) {
    return (c >= '0' && c <= '9');
}

void char_to_upper(char &c) {
    if(c >= 'a' && c <= 'z') {
        c = 'A' + (c - 'a');
    }
}

void char_to_lower(char &c) {
    if(c >= 'A' && c <= 'Z') {
        c = 'a' + (c - 'A');
    }
}

string generate_code_section_header(string section_name, bool is_end = false) {
    string code_section_header = "";

    code_section_header += "// ";
    for(int i = 0; i < section_name.length() + 12; i++) {
        code_section_header += "=";
    }
    code_section_header += "\n";

    code_section_header += "// ";
    for(int i = 0; i < 5; i++) {
        code_section_header += "=";
    }
    code_section_header += " ";
    code_section_header += section_name;
    code_section_header += " ";
    for(int i = 0; i < 5; i++) {
        code_section_header += "=";
    }
    code_section_header += "\n";

    code_section_header += "// ";
    for(int i = 0; i < section_name.length() + 12; i++) {
        code_section_header += "=";
    }
    code_section_header += "\n";

    if(!is_end) {
        code_section_header += generate_code_section_header("--endof " + section_name, true);
    }

    return code_section_header;
}

short bit_at(int n, int index) {
    for(int i = 0; i < index; i++) {
        n = n >> 1;
    }
    return (n % 2);
}

string int_to_string(unsigned int n) {
    stringstream ss;
    ss << n;

    return (ss.str());
}

int string_to_int(string str) {
    long integer_result = 0;
    int curr_pow = 0;
    for(int i = str.length() - 1; i >= 0; i--) {
        integer_result += (str[i] - '0') * ceil(pow(10., 1. * curr_pow++));
    }

    return integer_result;
}

#endif // _FARUK_H
