#include <iostream>

#include <fstream>
#include <cstdlib>
#include <ctime>
#include <sstream>

#include <algorithm>

#include "faruk.h"

using namespace std;

#define DIV_CLOSE (string)("</div>")
#define CURR_ELEMENT (string)("el-" + int_to_string(element_id))


string random_color() {
    #define COLOR_NUM 8
    string colors[COLOR_NUM] = {"#1D70CF", "#E03DE0", "#63B510", "#384D0F", "#7419CF", "#992295", "#2EBFB8", "#E6F035"};
    static unsigned int current_index = 0;

    current_index = (current_index + 1) % COLOR_NUM;
    return colors[current_index];
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
    bool use_random_colors,
    int level = 0,
    unsigned int starting_id = 0
) {

    //cout << "entered: ||" << format_string << "||" << endl;

    if(format_string == "") {
        return;
    }

    static unsigned int
        element_id = starting_id,
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

        curr_index = first_index - format_string.begin() + 1; // on paren or start of repetition num

        unsigned int repetitions = 1;
        if(format_string[curr_index] != '(') {
            unsigned int diff = format_string.find_first_of('(', curr_index) - curr_index;
            repetitions = string_to_int( format_string.substr(curr_index, diff) );
            curr_index += diff;
        }

        unsigned int old_curr_index = curr_index;

        // TODO: add overflow check!!! + exception
        for(int i = 0; i < repetitions; i++) {
            unsigned int first_par_occurance = format_string.find_first_of(')', curr_index + 1);
            string numeric_data = format_string.substr( curr_index + 1,  first_par_occurance - (curr_index + 1) );

            curr_index = first_par_occurance;
            css_file +=
                generate_css_class(
                                    CURR_ELEMENT, ((*first_index == 'r') ? "height: " : "width: ") + numeric_data + "%;\n" + ((use_random_colors) ? "" : "//") + "background-color: " + random_color() + ";\n"
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
                    generate_positioning_files_string( html_file, css_file, format_string.substr(curr_index + 2, (i - 2) - curr_index + 2), use_random_colors, level + 1 );
                    curr_index = i;
                    break;
                }
            }
            // --endof recursive call

            html_file += string(level, '\t') + DIV_CLOSE + "\n";

            if(i != repetitions - 1) {
                curr_index = old_curr_index;
            }
        }
    }

    if(level == 1) {
        html_file += DIV_CLOSE + "\n";
    }
}

void generate_html_footer_part(string &html_file) {
    html_file +=
"<footer>\n\
</footer>\n\n\
\n</body>\n\n\
</html>\n";
}

void generate_html_header_part(string &html_file, string title, string css_file_name) {
    string header_string = "<!doctype html>\n\
<html>\n\n\
<head>\n\
\t<meta charset=\"utf-8\" />\n\
\t<link rel=\"stylesheet\" href=\"styles/common.css\" />\n\
\t<link rel=\"stylesheet\" href=\"styles/" + css_file_name + "\" />\n\
\t<title>Homepage</title>\n\
</head>\n\n\
<body>\n\n";

    html_file += header_string;
}

void reformat_format_string(string &format_string) {

}

bool is_valid_format_string(const string &format_string) {
    return true;
}

void generate_positioning_files(string format_string, string html_file_name, string css_file_name, string common_path, bool use_random_colors) {
    if(!is_valid_format_string(format_string)) {
        throw "Invalid format string";
    }

    reformat_format_string(format_string);

    string html_file = "", css_file = "";
    generate_html_header_part(html_file, "Index page", css_file_name);
    generate_positioning_files_string(html_file, css_file, format_string, use_random_colors, 0, 13);
    generate_html_footer_part(html_file);

    ofstream html_file_stream(common_path + "/" + html_file_name.c_str()),
             css_file_stream(common_path + "/styles/" + css_file_name.c_str());

    html_file_stream << html_file;
    css_file_stream << css_file;
}

int main() {

    unsigned int choice;
    //cin >> choice;
    choice = 1;

    if(choice == 1) {
        try {
            // format string format (xD) : container_width container_height
            string format_string =
                "1000px 500px r(100){ c(15){  } c(70){ c(50){ r(25){  } r(5){  } r(70){ r10(20){ c(25){  } c(75){ r(25){  } r(50){  } r(25){  } } } } } c(50){ r(25){  } r(75){ r(10){  } r(90){  } }  } } c(15){  } }";
            //cout << "Enter website format string...\t";
            //cin >> format_string;
            cout << "Generating files...\n";
            generate_positioning_files(
                                    format_string,
                                    "generated.html",
                                    "generated.css",
                                    "C:\\Users\\FARUK\\Desktop\\faruk\\linux merge\\faruk\\uni\\6\\wt\\e-art",
                                    true
                                    );
            wait_s(.5);

            return 1;
        } catch(const char *err_msg) {
            cout << "An error has occured.\nError messaage:\t" << err_msg << endl;

            return 4041;
        }
    } else if(choice == 2) {
        cout << generate_div_string("1", "row test-class");

        return 2;
    } else if(choice == 3) {
        cout << string_to_int("12312313") << endl;

        return 3;
    }

    return 0;
}
