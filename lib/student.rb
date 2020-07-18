require_relative "../config/environment.rb"

class Student

  attr_accessor :name,:grade

  attr_reader :id

  def self.create_table
    sql="CREATE TABLE students(
    id INTEGER PRIMARY KEY,
    name TEXT,
    grade INTEGER
    );"
    D[:conn].execute(sql)
  end

  def self.drop_table
    sql="DROP TABLE students"
    D[:conn].execute(sql)
  end

  def save(name,grade)
    sql="INSERT INTO students(name,grade) VALUES(?,?)"
    D[:conn].execute(sql)
    sql1="SELECT id FROM students ORDER BY id DESC LIMIT 1"
    @id=D[:conn].execute(sql1)
  end

  def self.create(name,grade)
    @name=name
    @grade=grade
    save(name,grade)
  end

  def self.new_from_db(row)
    s=Students.new
    s.name(row[1])
    s.grade(row[2])
    return s 
  end

  


end
