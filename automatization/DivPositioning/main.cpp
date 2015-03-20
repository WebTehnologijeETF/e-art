#include <iostream>

#include <fstream>
#include <cstdlib>
#include <ctime>

using namespace std;

void generate_positioning_files_string(
    string &html_file,
    string &css_file,
    string format_string,
    int level = 0
) {
    // fill
}

bool is_valid_format_string(string format_string) {
    return true;
}

void generate_positioning_files(string format_string, string html_file_name, string css_file_name) {
    if(!is_valid_format_string(format_string)) {
        throw "Invalid format string";
    }

    string html_file = "", css_file = "";
    generate_positioning_files_string(html_file, css_file, format_string);

    ofstream html_file_stream(html_file_name.c_str()), css_file_stream(css_file_name.c_str());
    html_file_stream << html_file;
    css_file_stream << css_file;
}

int main() {

    string format_string = "[]";
    generate_positioning_files(format_string, "test.html", "test.css");

    return 0;
}
