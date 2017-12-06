#encoding: utf-8
#"Company Sort" ver 1 - HW 12-1 Anikram 06/12/2017

require_relative 'contact.rb'
require 'sqlite3' # подключение библиотек для работы с БД
require 'optparse' # подлючение парсера опций

options = {} #объявление массива с опциями

OptionParser.new do |opt| # вывод хелпа для пользователя
  opt.banner = "Usage: company_sort.rb [options]"

  opt.on('-h', 'Prints this help') do
    puts opt
    exit
  end

  opt.on('--id NUMBER', 'при запуске без параметра выводится список компаний, с просьбой ввести id') {|o| options[:company_id] = o}
end.parse!


result = Contact.find(options[:company_id])

puts result.to_s





