# Program to edit design parameters in files

# import libraries
import sys


# define functions

def edit_param(file_name, param, new_val):
    f = open(file_name, 'r')

    output_str = ""
    for line in f:
        new_line = ""
        if param in line:
            # edit parameter
            new_line = param + " " + str(new_val) + "\n"
        else:
            # keep line as is
            new_line = line

        # store data in output string
        output_str += new_line

    # stop read
    f.close()
    # clear and write
    f = open(file_name, 'w')
    f.write(output_str)
    f.close()


# get input and check argument count
case = 0
if len(sys.argv) != 2:
    print(sys.argv)
    raise Exception("Invalid number of arguments")
else:
    case = int(sys.argv[1])
    print(case)

# cases structure: case#: [density, period, width,height]
# close: 12, 20, 26, success: 17
cases = {0: [0.5, 10, 500, 500],
         1: [0.5, 20, 500, 500],
         2: [0.75, 10, 500, 500],
         3: [0.75, 20, 500, 500],
         4: [0.5, 7, 500, 500],
         5: [0.4, 7, 500, 500],
         6: [0.35, 10, 500, 500],
         7: [0.4, 7, 400, 500],
         8: [0.4, 5, 500, 500],
         9: [0.4, 5, 400, 600],
         10: [0.4, 4, 500, 500],
         11: [0.4, 7, 600, 500],
         12: [0.4, 5, 400, 500],
         13: [0.45, 5, 500, 500],
         14: [0.45, 7, 500, 500],
         15: [0.7, 4, 400, 500],
         16: [0.7, 5, 400, 500],
         17: [0.7, 7, 400, 500],
         18: [0.9, 7, 400, 500],
         19: [0.9, 4, 400, 500],
         20: [0.8, 7, 400, 500],
         21: [0.85, 7, 400, 500],
         22: [0.85, 6, 400, 500],
         23: [0.8, 7, 400, 450],
         24: [0.85, 7, 400, 450],
         25: [0.9, 7, 400, 450],
         26: [0.9, 6, 500, 500],
         27: [0.9, 6, 400, 500],
         28: [0.9, 7, 400, 430],
         29: [0.9, 6, 400, 420],
         30: [0.7, 6, 400, 500],
         31: [0.7, 7, 400, 450],
         32: [0.7, 7, 400, 430],
         33: [0.6, 6, 400, 500],
         34: [0.85, 7, 400, 420],
         35: [0.85, 6, 400, 420],
         36: [0.75, 7, 400, 500],
         37: [0.75, 6, 400, 500],
         38: [0.71, 7, 400, 500],
         39: [0.8, 7, 400, 420],
         40: [0.67, 6, 400, 500],
         41: [0.8, 7, 500, 420],
         42: [0.8, 4, 500, 420],
         43: [0.9, 6, 500, 500]}

# params for tech file
tech_file = "scripts/tech.tcl"
density_param = "set rm_cell_density"
clk_period_param = "set rm_clock_period"

# params for floorplan
floorplan_file = "scripts/floorplan.tcl"
width_param = "set rm_core_width"
height_param = "set rm_core_height"

# change files
edit_param(tech_file, density_param, cases[case][0])
edit_param(tech_file, clk_period_param, cases[case][1])
edit_param(floorplan_file, width_param, cases[case][2])
edit_param(floorplan_file, height_param, cases[case][3])

# record test details
record_file = "scripts/parameters.txt"
f = open(record_file, 'w+')
data = "# cases structure: case#: [density, period, width,height] \n" +\
    str(case) + ": " + str(cases[case])
f.write(data)
f.close()
