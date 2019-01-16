require_relative('../db/sql_runner')

class Hogwarts

  attr_reader :id
  attr_accessor :first_name, :last_name, :house, :age

  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house = options['house']
    @age = options['age'].to_i
  end

  def save()
     sql = "INSERT INTO hogwarts
     (
       first_name,
       last_name,
       house,
       age
     )
     VALUES
     (
       $1, $2, $3, $4
     )
     RETURNING *"
     values = [@first_name, @last_name, @house, @age]
     harry_data = SqlRunner.run(sql, values)
     @id = harry_data.first()['id'].to_i
   end

end
