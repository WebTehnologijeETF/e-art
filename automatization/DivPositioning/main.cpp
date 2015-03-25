#include <iostream>

#include <fstream>
#include <cstdlib>
#include <ctime>
#include <sstream>

#include <algorithm>

using namespace std;

#define DIV_CLOSE (string)("</div>")
#define CURR_ELEMENT (string)("el-" + int_to_string(element_id))

string int_to_string(unsigned int n) {
    stringstream ss;
    ss << n;

    return (ss.str());
}

string random_color() {
    srand(time(NULL));

    string color = "#";
    for(int i = 0; i < 6; i++) {
        color += int_to_string(rand() % 10 + 1);
    }

    return color;
}

string generate_div_string(string div_id, string div_class) {
    string div_string = "<div id=\"";

    div_string += div_id + "\" class=\"" + div_class + "\">\n";

    return div_string;
}

string generate_css_class(string class_name, string attributes) {
    string class_string = "";

    for(int i = 0; i < attributes.length() - 1; i++) {
        if(attributes[i] == '\n' || i == 0) {
            attributes.insert(i + (i != 0), "\t");
        }
    }
    class_string += "." + class_name + " {\n" + attributes + "}\n";

    return class_string;
}

void generate_positioning_files_string(
    string &html_file,
    string &css_file,
    string format_string,
    int level = 0
) {

    //cout << "entered: ||" << format_string << "||" << endl;

    if(format_string == "") {
        return;
    }

    static unsigned int
        element_id = 0,
        format_string_index = 0;

    if(level == 0) {
        // container div + initial classes, all in first iteration
        css_file += generate_css_class(
                                        "container",
                                        "height: " + format_string.substr(0, format_string.find_first_of(' ')) + ";\n" +
                                            "width: " + "100%;\n"
                                        );
        css_file += generate_css_class(
                                        "row",
                                        "width: 100%;\nfloat: left;\n"
                                        );
        css_file += generate_css_class(
                                        "col",
                                        "height: 100%;\nfloat: left;\n"
                                        );

        html_file += generate_div_string(CURR_ELEMENT, "container");
        ++element_id;
        ++level;
    }

    // find r + c on the current level + recursive calls

    unsigned int curr_index = 0;
    while(true) {
        auto first_index =
            find_if(format_string.begin() + curr_index, format_string.end(), [](char c) { return c == 'r' || c == 'c'; });
        if(first_index >= format_string.end()) {
            break;
        }

        curr_index = first_index - format_string.begin() + 1;
        unsigned int first_par_occurance = format_string.find_first_of(')', curr_index + 1);
        string numeric_data = format_string.substr( curr_index + 1,  first_par_occurance - (curr_index + 1) );
        curr_index = first_par_occurance;
        css_file +=
            generate_css_class(
                                CURR_ELEMENT, ((*first_index == 'r') ? "height: " : "width: ") + numeric_data + "%;\n//background-color: " + random_color() + ";\n"
                               );
        html_file += string(level, '\t') + generate_div_string(CURR_ELEMENT, ((*first_index == 'r') ? "row " : "col ") + CURR_ELEMENT);
        ++element_id;

        // recursive calls
        short balance = 0;
        // terminates if format_string is correctly formated :D

        //cout << format_string.substr(curr_index + 2) << endl;
        //cin.get();
        //cin.get();

        for(int i = curr_index + 2; ; i++) {
            if(format_string[i] == '{') {
                ++balance;
            } else if(format_string[i] == '}') {
                --balance;
            }

            //cout << format_string[i] << " " << balance << endl;
            //cin.get();

            if(balance < 0) {
                generate_positioning_files_string( html_file, css_file, format_string.substr(curr_index + 2, (i - 2) - curr_index + 2), level + 1 );
                curr_index = i;
                break;
            }
        }
        // --endof recursive call

        html_file += string(level, '\t') + DIV_CLOSE + "\n";
    }

    if(level == 1) {
        html_file += DIV_CLOSE + "\n";
    }
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

    unsigned int choice;
    cin >> choice;

    if(choice == 1) {
        // format string format (xD) : container_width container_height
        string format_string =
            "1000px 500px r(33){ c(25){  } c(25){  } c(50){  } } r(67){ c(25){  } c(75){  } }";
        generate_positioning_files(format_string, "test.html", "test.css");

        return 1;
    } else if(choice == 2) {
        cout << generate_div_string("1", "row test-class");

        return 2;
    }

    return 0;
}
