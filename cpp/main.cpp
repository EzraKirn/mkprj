#include <iostream>
#include <string>
#include <unordered_set>

#include "ProcesCSV.h"
#include "RHOsort.h"
#include "rapidcsv.h"

#ifdef LOGGING
#define LOG(X)  std::cout << X << " "
#define LOGL(X) std::cout << X << std::endl
#endif
#ifndef LOGGING
#define LOG(X)
#define LOGL(X)
#endif

int main(int argc, char *argv[])
{
  std::string input_CSV_name     = argv[1];
  std::string output_name_prefix = argv[2] + CSV::get_timestamp();

  rapidcsv::Document input_CSV   = CSV::LoadCSV(input_CSV_name);

  CSV::check_header(input_CSV);

  CSV::rename_input_columns(input_CSV);

  int sum_ILOSC_input                                   = CSV::get_sum(input_CSV);

  std::unordered_set<std::string> parent_components_IDs = CSV::get_unique_parents(input_CSV);

  CSV::create_column_ASORTYMETN_TYP(input_CSV, parent_components_IDs);

  std::string assembly_name = CSV::get_assembly_name(input_CSV);

  CSV::create_column_TECHNOLOGIA_RECEPTURA(input_CSV, assembly_name);

  CSV::create_column_GRUPA_PRODUKTOW_JEST_SKLADNIKIEM_RCP_NADRZEDNEGO_PRODUKTU_ETAP_1(input_CSV);

  CSV::create_trivial_columns(input_CSV);

  CSV::sort_columns(input_CSV);

  input_CSV.Save(output_name_prefix + "before_col_sort.csv");
  RHOsort::sortAssemblyCsv(input_CSV);
  input_CSV.Save(output_name_prefix + "after_col_sort.csv");

  const std::string &csv_filename = output_name_prefix + "_RHO_output.csv";
  input_CSV.Save(csv_filename);
  std::cout << "\033[31m" << "CSV file created: " << csv_filename << "\033[0m" << '\n';

  int sum_ILOSC_output = CSV::get_sum(input_CSV);
  std::cout << "Sum of \"Ilość\" after renaming was:" << sum_ILOSC_input << '\n';
  std::cout << "Sum of \"Ilość\" after sorting was: " << sum_ILOSC_input << '\n';
  std::cout << "\033[31mDifference is:              " << sum_ILOSC_input - sum_ILOSC_output << "\033[0m" << '\n';
  std::cout << "Generate XLSX?" << '\n';
  CSV::continue_Yn();

  CSV::dump_to_xlsx(input_CSV, output_name_prefix);
  return 0;
}
