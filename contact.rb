#encoding: utf-8

class Contact

  @@SQLBASE = 'my_contacts.sqlite'

  def self.find(id)
    db = SQLite3::Database.open(@@SQLBASE)


    db.results_as_hash = true

    if id
      # вывести записи удовлетворяющие условию

      result = db.execute('SELECT * FROM people WHERE company_id = ?',id)
      #для версии 2:
      #1.добавить перевод хэша в класс
      #2.создать экземпляры класса по количеству людей
      #3.передать значение для вывода
      puts result.class
      show_people(result)
      abort 'программа не доделана'
    else
      # вывести таблицу companies

      show_companies(db)
      db.close
      sleep(2)
      puts 'Вы не ввели ID компании для поиска, пожалуйста запустите программу повторно,
с указанием параметра в формате --id \'номер компании из списка\''
      abort
    end

  end


  def load_data(data_hash) # метод не задействован (проект)
    puts data_hash["rowid"].to_s
    @rowid = data_hash["rowid"].to_s
    @name = data_hash["name"].to_s
    @family_name = data_hash["family_name"].to_s
    @phone = data_hash["phone"].to_s
    @email = data_hash["email"].to_s
  end

  def self.show_companies(db)
    # метод ля отбражения перечная компаний
    db.results_as_hash = true

    query = 'SELECT rowid,name FROM companies '

    result = db.execute(query)


    #printf "[ ID\t][   NAME\t][   FAMILY NAME\t][   PHONE\t][   E-MAIL\t]"
    printf "[\t\tID\t\t][\t\t\tTITLE\t\t]"
    puts
    #puts result.to_s
    result.each do |line|
      c = 0
      line.each do |key,value|
        if c<2
        printf "|\t\t\t#{value.to_s}\t|"
        c += 1
          end
      end
      puts
    end
  end

  def self.show_people(result)

    puts result.class
    result.each do |line|
      puts line
      puts
    end

  end
end